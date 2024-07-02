import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/models/homemodel.dart';
import 'package:shop_app/modules/products/producstbloc.dart';
import 'package:shop_app/modules/products/productsblocstates.dart';
import 'package:shop_app/shared/constants/constants.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, ProductStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = ProductsBloc.get(context);
        return Scaffold(
          body: cubit.homeData == null
              ? Center(child: CircularProgressIndicator())
              : SingleChildScrollView(
                child: Column(
                    children: [
                      CarouserImages(cubit.homeData!),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: EdgeInsets.all(10.0),
                        child: GridView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.homeData!.data!.products!.length,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 3 / 4.7,
                          ),
                          itemBuilder: (context, index) {
                            return HomeProducts(cubit.homeData!.data!.products![index]);
                            },
                        ),)
                    ],
                  ),
              ),
        );
      },
    );
  }
}

Widget CarouserImages(HomeModel model) {
  return Container(
    width: double.infinity,
    child: CarouselSlider(
        items: model.data!.banners!
            .map((e) => Image(
                  image: NetworkImage(e.image!),
                  width: double.infinity,
                  fit: BoxFit.cover,
                ))
            .toList(),
        options: CarouselOptions(
          viewportFraction: 1.0,
          initialPage: 0,
          height: 200,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
        )),
  );
}
Widget HomeProducts(ProductHomeData model){
  return  Container(
                              color: Colors.white,
                              child: Stack(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image(
                                        width: double.infinity,
                                        height: 150,
                                        image: NetworkImage(model.image!),
                                        
                                      ),
                                      Container(
                                        height: 40,
                                        child: Text(model.name!,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Container(
                                          height: 35,
                                          child: Row(
                                            children: [
                                              Text("${model.price} LE" , style: TextStyle(color: Colors.blue),),
                                              Spacer(),
                                              IconButton(
                                                hoverColor: Colors.red,
                                                onPressed: (){
                                                  // favoriteProducts.add(model);
                                                }, icon: Icon(Icons.favorite_outlined,color: Colors.grey,))
                                            ],
                                          ),
                                        ),
                                      ),
                                      model.discount== 0 ? SizedBox() : Padding(
                                        padding: const EdgeInsets.symmetric(horizontal:  8.0),
                                        child: Text("${model.oldprice} LE" ,style: TextStyle(
                                                decoration: TextDecoration.lineThrough,
                                                decorationColor: Colors.red,
                                                color: Colors.red
                                                                          
                                              ),),
                                      ),
                                    ],
                                  ),
                                  
                                  model.discount== 0 ? SizedBox() :Container(color: Colors.red,
                                  child: Text("discount ${model.discount}%", style: TextStyle(color: Colors.white),),)
                                ],
                              ),
                            );
                          
}
class HomeModel {
  bool? status;
  String? message;
  HomeDataModel? data;
  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = (json['data'] != null)
        ? new HomeDataModel.fromJson(json['data'])
        : null;
  }
}

class HomeDataModel {
  List<BannersHomeData>? banners = [];
  List<ProductHomeData>? products = [];
  String? ad;
  HomeDataModel.fromJson(Map<String, dynamic> json) {
    ad = json['ad'];

    json['banners'].forEach((element) {
      banners!.add(BannersHomeData.fromJson(element));
    });

    json['products'].forEach((element) {
      products!.add(ProductHomeData.fromJson(element));
    });
  }
}

class BannersHomeData {
  int? id;
  String? image;
  BannersHomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }
}

class ProductHomeData {
  int? id;
  var price;
  var oldprice;
  int? discount;
  String? name;
  String? image;
  bool? infav;
  bool? incart;

  ProductHomeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    price = json['price'];
    oldprice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    infav = json['in_favorites'];
    incart = json['in_cart'];
  }
} 


//_____________________


// class HomeModel {
//     HomeModel({
//         required this.status,
//         required this.message,
//         required this.data,
//     });

//     final bool? status;
//     final dynamic message;
//     final Data? data;

//     factory HomeModel.fromJson(Map<String, dynamic> json){ 
//         return HomeModel(
//             status: json["status"],
//             message: json["message"],
//             data: json["data"] == null ? null : Data.fromJson(json["data"]),
//         );
//     }

// }

// class Data {
//     Data({
//         // required this.banners,
//         required this.products,
//         required this.ad,
//     });

//     // final List<Banner> banners;
//     final List<Product> products;
//     final String? ad;

//     factory Data.fromJson(Map<String, dynamic> json){ 
//         return Data(
//             // banners: json["banners"] == null ? [] : List<Banner>.from(json["banners"]!.map((x) => Banner.fromJson(x))),
//             products: json["products"] == null ? [] : List<Product>.from(json["products"]!.map((x) => Product.fromJson(x))),
//             ad: json["ad"],
//         );
//     }

// }

// class Banner {
//     Banner({
//         required this.id,
//         required this.image,
//         required this.category,
//         required this.product,
//     });

//     final int? id;
//     final String? image;
//     final dynamic category;
//     final dynamic product;

//     factory Banner.fromJson(Map<String, dynamic> json){ 
//         return Banner(
//             id: json["id"],
//             image: json["image"],
//             category: json["category"],
//             product: json["product"],
//         );
//     }

// }

// class Product {
//     Product({
//         required this.id,
//         required this.price,
//         required this.oldPrice,
//         required this.discount,
//         required this.image,
//         required this.name,
//         // required this.description,
//         // required this.images,
//         required this.inFavorites,
//         required this.inCart,
//     });

//     final int? id;
//     var price;
//     var oldPrice;
//     final int? discount;
//     final String? image;
//     final String? name;
//     // final String? description;
//     // final List<String> images;
//     final bool? inFavorites;
//     final bool? inCart;

//     factory Product.fromJson(Map<String, dynamic> json){ 
//         return Product(
//             id: json["id"],
//             price: json["price"],
//             oldPrice: json["old_price"],
//             discount: json["discount"],
//             image: json["image"],
//             name: json["name"],
//             // description: json["description"],
//             // images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
//             inFavorites: json["in_favorites"],
//             inCart: json["in_cart"],
//         );
//     }

// }

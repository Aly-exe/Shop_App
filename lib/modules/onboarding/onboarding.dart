// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:shop_app/modules/login/loginscreen.dart';
import 'package:shop_app/shared/helpers/cashhelper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingModel {
  final String image;
  final String title1;
  final String title2;
  final String description;
  OnboardingModel(
      {required this.image,
      required this.title1,
      required this.title2,
      required this.description});
}

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  var onboardingcontroller = PageController();
  bool islast = false;
  int? pageIndex;
  List<OnboardingModel> onboardinglist = [
    OnboardingModel(
        image: "assets/images/onboardingImage1.png",
        title1: "Online Food Ordering ",
        title2: "Mega Discount",
        description:
            "You can shop from everywhere and you will get order faster than you imagine"),
    OnboardingModel(
        image: "assets/images/onboardingImage2.png",
        title1: "Online Shopping Fast ",
        title2: "Delivery",
        description:
            "You can shop from everywhere and you will get order faster than you imagine"),
    OnboardingModel(
        image: "assets/images/onboardingImage3.png",
        title1: "Clothing Discount More ",
        title2: "Than 50,000 Product",
        description:
            "You can shop from everywhere and you will get order faster than you imagine")
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          actions: [
            TextButton(
              onPressed: () {
                CashHelper.setData(key: "onboarding", value: false)
                    .then((value) => Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        )))
                    .catchError((error) {});
              },
              child: Text(
                "SKIP",
              ),
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [
            Expanded(
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                controller: onboardingcontroller,
                itemBuilder: (context, index) =>
                    onboardingwidget(onboardinglist[index]),
                itemCount: onboardinglist.length,
                onPageChanged: (value) {
                  setState(() {
                    pageIndex = value;
                    if (pageIndex == onboardinglist.length - 1) {
                      islast = true;
                    } else {
                      islast = false;
                    }
                  });
                },
              ),
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: onboardingcontroller,
                  count: onboardinglist.length,
                  effect: const WormEffect(
                      dotHeight: 12,
                      dotWidth: 25,
                      type: WormType.normal,
                      activeDotColor: Colors.blue),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    onboardingcontroller.nextPage(
                      duration: Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.easeInOut,
                    );
                    if (islast) {
                      
                      CashHelper.setData(key: "onboarding", value: false)
                          .then((value) => Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              )))
                          .catchError((error) {});
                    }
                  },
                  child: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }

  Widget onboardingwidget(OnboardingModel data) {
    return Column(
      children: [
        Image.asset("${data.image}"),
        SizedBox(
          height: 20.0,
        ),
        Text(
          "${data.title1}",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700),
        ),
        SizedBox(
          height: 10.0,
        ),
        Text(
          "${data.title2}",
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 20.0,
        ),
        Container(
          width: 300,
          child: Text(
            "${data.description}",
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 15.0,
            ),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

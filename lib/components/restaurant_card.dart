import 'package:flutter/material.dart';
import 'package:restaurant_test/components/favourite_button.dart';
import 'package:restaurant_test/size_config.dart';

import '../constants.dart';

class RestaurantCard extends StatelessWidget {
  final double? width, height;
  final String? distance;
  final double? rating;
  final String? name, categories, duration;
  final String? offer;
  final bool? isFavourite, noMinOrder, liveTracking, freeDelivery, isPromoted,all;
  final AssetImage? image;
  final String? imageUrl;

  const RestaurantCard(
      {Key? key,
      this.width,
      this.height,
      this.image,
      this.imageUrl,
      this.name,
      this.duration,
      this.categories,
      this.distance,
      this.freeDelivery,
      this.isFavourite,
      this.isPromoted,
      this.liveTracking,
      this.noMinOrder,
      this.offer,
      this.all=false,
      this.rating})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12.0)),
                      ),
                  child: Stack(
                    children: [
                      Container(
                        width: width,
                        height: height! * .7,
                        decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: cardShadow,
                                spreadRadius: 3,
                                blurRadius: 8,
                                offset: Offset(0, 1.5), // changes position of shadow
                              ),
                            ],
                          borderRadius: BorderRadius.all(Radius.circular(12.0)),
                          image: DecorationImage(
                              alignment: Alignment(-.2, 0),
                              image:
                                  AssetImage("assets/images/restaurant_1.png"),
                              fit: BoxFit.cover),
                        ),
                        alignment: Alignment.bottomCenter,
                      ),
                      Align(
                          alignment: const Alignment(.95, -.95),
                          child: FavouriteButton(
                            width: getProportionateScreenWidth(30),
                            height: getProportionateScreenHeight(30),
                            isSelected: isFavourite,
                          )),
                      isPromoted!?Align(
                        alignment: const Alignment(-.95, -.95),
                        child: Container(
                          width: width! * .27,
                          height: getProportionateScreenHeight(30),
                          decoration: BoxDecoration(
                            color: Colors.transparent.withOpacity(0.5),
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8.0)),
                          ),
                          child: Center(
                              child: Text(
                            "Promoted",
                            style: TextStyle(
                                fontSize: getProportionateScreenWidth(11.0),
                                fontFamily: "MontserratSemiBold",
                                color: Colors.white),
                          )),
                        ),
                      ):Container()   ,
                    ],
                  )),
            ),

            Align(
              alignment: Alignment(0,1),
              child: Container(
                width: width!*.925,
                height: height!*.5,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: cardShadow,
                        spreadRadius: 2,
                        blurRadius: 8,
                        offset: Offset(0, 1.5), // changes position of shadow
                      ),
                    ]),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height:height!*.3,
                      child: Row(
                        children: [
                          Expanded(
                            child: Align(
                              alignment:all!?Alignment(0,0):Alignment(1,0),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(height: getProportionateScreenHeight(10),),
                                  Container(
                                    decoration: const BoxDecoration(
                                      color: homePageIconsColor,
                                      borderRadius:BorderRadius.all(Radius.circular(6)),
                                    ),
                                    width: width!*.15,
                                    height:getProportionateScreenHeight(25),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('$rating',style: TextStyle(fontSize: getProportionateScreenWidth(12.0),fontFamily: "MontserratMedium",color: Colors.white),),
                                        const Icon(Icons.star,color:Colors.white,size:15 ,),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text("$name",style: TextStyle(
                                        fontSize: getProportionateScreenWidth(16.0),
                                        fontFamily: "MontserratSemiBold",
                                        color:secondTextColor,
                                      ),),
                                      Text("$categories",style: TextStyle(
                                        fontSize: getProportionateScreenWidth(13.0),
                                        fontFamily: "MontserratMedium",
                                        color:hintTextColor,
                                      ),),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment(.7,0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.location_on,color: homePageIconsColor,size:35),
                                  Text("$distance",style: TextStyle(
                                    fontSize: getProportionateScreenWidth(11.0),
                                    fontFamily: "MontserratMedium",
                                    color:secondTextColor,
                                  ),),
                                  SizedBox(height: getProportionateScreenHeight(15),)
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height:height!*.2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(15),
                              ),
                              noMinOrder!?SizedBox(
                                width: width!*.45-getProportionateScreenWidth(7.5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(13),
                                      height: getProportionateScreenHeight(13),
                                      child: Image.asset("assets/images/money_icon.png"),
                                    ),
                                    SizedBox(width: getProportionateScreenWidth(3),),
                                    Text("No min order",style: TextStyle(fontSize: getProportionateScreenWidth(12.0),fontFamily: "MontserratMedium",color: secondTextColor)),
                                  ],
                                ),
                              ):Container(),
                              liveTracking!?SizedBox(
                                width: width!*.45-getProportionateScreenWidth(7.5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(13),
                                      height: getProportionateScreenHeight(13),
                                      child: Image.asset("assets/images/location.png"),
                                    ),
                                    SizedBox(width: getProportionateScreenWidth(3),),
                                    Text("No min order",style: TextStyle(fontSize: getProportionateScreenWidth(12.0),fontFamily: "MontserratMedium",color: secondTextColor)),
                                  ],
                                ),
                              ):Container(),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenWidth(15),
                              ),
                              SizedBox(
                                width: width!*.45-getProportionateScreenWidth(7.5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(13),
                                      height: getProportionateScreenHeight(13),
                                      child: Image.asset("assets/images/timer.png"),
                                    ),
                                    SizedBox(width: getProportionateScreenWidth(3),),
                                    Text("$duration delivery",style: TextStyle(fontSize: getProportionateScreenWidth(12.0),fontFamily: "MontserratMedium",color: secondTextColor)),
                                  ],
                                ),
                              ),
                              freeDelivery!?SizedBox(
                                width: width!*.45-getProportionateScreenWidth(7.5),
                                child: Row(
                                  children: [
                                    Container(
                                      width: getProportionateScreenWidth(13),
                                      height: getProportionateScreenHeight(13),
                                      child: Image.asset("assets/images/cash_icon.png"),
                                    ),
                                    SizedBox(width: getProportionateScreenWidth(3),),
                                    Text("Free delivery",style: TextStyle(fontSize: getProportionateScreenWidth(12.0),fontFamily: "MontserratMedium",color: secondTextColor)),
                                  ],
                                ),
                              ):Container(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            offer!=null?Align(
              alignment:Alignment(-.85,-.25),
              child: Container(
                width: getProportionateScreenWidth(100),
                height: getProportionateScreenHeight(40),
                decoration: BoxDecoration(
                  color:homePageIconsColor,
                  borderRadius: BorderRadius.all(Radius.circular(8.0))
                ),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(offer!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                      fontSize: getProportionateScreenWidth(10.0),
                      fontFamily: "MontserratSemiBold",
                      color:Colors.white,
                    ),),
                  ),
                ),
              ),
            ):Container(),
          ],
        ),
      ),
    );
  }
}

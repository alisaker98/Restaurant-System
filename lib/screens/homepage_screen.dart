import 'package:flutter/material.dart';
import 'package:restaurant_test/components/custom_button.dart';
import 'package:restaurant_test/components/food_card.dart';
import 'package:restaurant_test/components/order_card.dart';
import 'package:restaurant_test/components/profile_pic.dart';
import 'package:restaurant_test/components/restaurant_card.dart';
import 'package:restaurant_test/components/search_card.dart';

import '../constants.dart';
import '../size_config.dart';
import 'navigator_page.dart';

class HomePage extends StatelessWidget {
  late Function() onTap;
  var imgList=[
    'assets/images/slider1.png',
    'assets/images/slider2.png',
  ];
  var foodImgList=[
    {
      "category":"Pizza",
      "image":"assets/images/pizza_category.png"
    },
    {
      "category":"Wings",
      "image":"assets/images/wings.png"
    },
    {
      "category":"Chicken",
      "image":"assets/images/chicken.png"
    },
    {
      "category":"Hummus",
      "image":"assets/images/Hummus.png"
    },
    {
      "category":"Burger",
      "image":"assets/images/burger.png"
    },
    {
      "category":"Biryani",
      "image":"assets/images/biryani.png"
    },
    {
      "category":"Burger",
      "image":"assets/images/burger.png"
    },
    {
      "category":"Biryani",
      "image":"assets/images/biryani.png"
    },
    {
      "category":"Pizza",
      "image":"assets/images/pizza_category.png"
    },
  ];
  HomePage({required this.onTap});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            width: MediaQuery.of(context).size.width*.95,
            child: Stack(
              children: [
                ListView(
                  children: [
                    SizedBox(
                      height: getProportionateScreenHeight(180),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(170),

                      child:ListView.builder(

                          itemCount: imgList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context,int index){
                            return Row(
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width*.75,
                                  decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(10)),

                                  ),
                                  child: Image.asset(imgList[index]),
                                ),
                                SizedBox(
                                  width: getProportionateScreenWidth(20),
                                ),
                              ],
                            );
                          }),

                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: cardShadow,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 1.5), // changes position of shadow
                            ),

                          ]),
                      height:getProportionateScreenHeight(140),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Align(
                                  alignment:Alignment(-.6,0),
                                  child: Text("Recent Orders",
                                  style: TextStyle(
                                    fontSize: getProportionateScreenWidth(15.0),
                                    color:secondTextColor,
                                    fontFamily: "MontserratSemiBold",
                                  ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment:Alignment(.75,0),
                                  child: GestureDetector(
                                    onTap:(){

                                    },
                                    child: Text("View All",
                                      style: TextStyle(
                                        fontSize: getProportionateScreenWidth(10.0),
                                        color:homePageIconsColor,
                                        fontFamily: "MontserratSemiBold",
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: getProportionateScreenHeight(85),

                            child:ListView.builder(

                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context,int index){
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: getProportionateScreenWidth(15),
                                      ),
                                      OrderCard(
                                        image: Image.asset("assets/images/food_pic.png"),
                                        name: "Tortilla Wrap",
                                        price:20,
                                        duration: "30 min",
                                        hasSale: true,
                                        saleAmount: 25,
                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(20),
                                      ),
                                    ],
                                  );
                                }),

                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(20),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: cardShadow,
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 1.5), // changes position of shadow
                            ),

                          ]),
                      height:getProportionateScreenHeight(220),
                      child: Stack(
                        children: [

                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              SizedBox(
                                height: getProportionateScreenHeight(50),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: getProportionateScreenHeight(15),
                                    ),
                                    Text("Trending Food",
                                      style: TextStyle(
                                        fontSize: getProportionateScreenWidth(15.0),
                                        color:secondTextColor,
                                        fontFamily: "MontserratSemiBold",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: SizedBox(
                                    height: getProportionateScreenHeight(170),
                                    width: MediaQuery.of(context).size.width*.9,
                                    child: GridView.builder(
                                      itemCount: foodImgList.length,
                                      shrinkWrap: true,
                                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 3,
                                        mainAxisSpacing: 8,
                                        crossAxisSpacing: 0,
                                        childAspectRatio: 2.0,
                                      ),
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: const EdgeInsets.all(0.0),
                                      itemBuilder: (BuildContext context,int index){
                                        return FoodCard(
                                          onTap: () {

                                          },
                                          name:
                                          foodImgList[index]["category"],
                                          image: Image.asset(foodImgList[index]["image"]!),
                                        );
                                      },



                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap:(){

                            },
                            child: Align(
                              alignment:Alignment.bottomCenter,
                              child: Opacity(
                                opacity: .5,
                                child: Container(
                                  width: MediaQuery.of(context).size.width*.85,
                                  height: getProportionateScreenHeight(28),
                                  decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Colors.black54,
                                          Colors.black,
                                        ],
                                      )
                                  ),

                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(0,.95),
                            child: Text(
                              'Load More...',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                fontFamily: "MontserratSemiBold",
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenHeight(15),
                              ),
                              Text("New Restaurants",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15.0),
                                  color:secondTextColor,
                                  fontFamily: "MontserratSemiBold",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10),),
                          SizedBox(
                            height: getProportionateScreenHeight(310),

                            child:ListView.builder(

                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context,int index){
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      RestaurantCard(
                                        width: getProportionateScreenWidth(300),
                                        height: getProportionateScreenHeight(300),
                                        image: AssetImage("assets/images/restaurant_1.png"),
                                        name: "Mociani Let",
                                        rating: 4.3,
                                        categories: "Italian, Pizza, Pasta",
                                        distance: "7.5 km",
                                        noMinOrder: true,
                                        liveTracking: true,
                                        duration: "30 min",
                                        freeDelivery: true,
                                        isFavourite: false,
                                        isPromoted: true,
                                        offer: "50% Off Uptown 20AED",


                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                    ],
                                  );
                                }),

                          ),

                        ],
                      ),
                    ),
                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),

                    Container(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: getProportionateScreenHeight(15),
                              ),
                              Text("Most Ordered",
                                style: TextStyle(
                                  fontSize: getProportionateScreenWidth(15.0),
                                  color:secondTextColor,
                                  fontFamily: "MontserratSemiBold",
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: getProportionateScreenHeight(10),),
                          SizedBox(
                            height: getProportionateScreenHeight(310),

                            child:ListView.builder(

                                itemCount: 3,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (BuildContext context,int index){
                                  return Row(
                                    children: [
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                      RestaurantCard(
                                        width: getProportionateScreenWidth(300),
                                        height: getProportionateScreenHeight(300),
                                        image: AssetImage("assets/images/restaurant_1.png"),
                                        name: "Mociani Let",
                                        rating: 4.3,
                                        categories: "Italian, Pizza, Pasta",
                                        distance: "7.5 km",
                                        noMinOrder: true,
                                        liveTracking: true,
                                        duration: "30 min",
                                        freeDelivery: true,
                                        isFavourite: false,
                                        isPromoted: true,
                                        offer: "50% Off Uptown 20AED",



                                      ),
                                      SizedBox(
                                        width: getProportionateScreenWidth(10),
                                      ),
                                    ],
                                  );
                                }),

                          ),

                        ],
                      ),
                    ),

                    SizedBox(
                      height: getProportionateScreenHeight(30),
                    ),

                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenHeight(15),
                            ),
                            Text("All Restaurants",
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(15.0),
                                color:secondTextColor,
                                fontFamily: "MontserratSemiBold",
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: getProportionateScreenHeight(10),),
                        GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),

                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 1,
                              childAspectRatio: 1
                            ),

                            itemCount: 3,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context,int index){
                              return Column(
                                children: [
                                  RestaurantCard(
                                    width: MediaQuery.of(context).size.width*.9,
                                    height: getProportionateScreenHeight(320),
                                    image: AssetImage("assets/images/restaurant_1.png"),
                                    name: "Mociani Let",
                                    rating: 4.3,
                                    categories: "Italian, Pizza, Pasta",
                                    distance: "7.5 km",
                                    noMinOrder: true,
                                    liveTracking: true,
                                    duration: "30 min",
                                    freeDelivery: true,
                                    isFavourite: false,
                                    isPromoted: true,
                                    offer: "50% Off Uptown 20AED",
                                    all: true,


                                  ),

                                ],
                              );
                            }),

                      ],
                    ),



                  ],
                ),
                Positioned(
                  top: 0.0,
                  child: Container(
                    color:Colors.white,
                    height: getProportionateScreenHeight(160),
                    width: MediaQuery.of(context).size.width*.95,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            GestureDetector(
                              onTap:onTap,
                              child: SizedBox(
                                width: getProportionateScreenWidth(20),
                                height: getProportionateScreenHeight(20),
                                child: Image.asset('assets/images/menu_icon.png'),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            ProfilePic(getProportionateScreenWidth(34), null, getProportionateScreenHeight(34)),
                            SizedBox(
                              width: getProportionateScreenWidth(10),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 Text("Home",
                                   style: TextStyle(
                                  color: homePageIconsColor,
                                  fontFamily: "MontserratMedium",
                                  fontSize: getProportionateScreenWidth(15),
                                ),),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width*.7,
                                  child: Text("Almeena tower - bolonindg",style: TextStyle(
                                    color: secondTextColor,
                                    fontFamily: "MontserratSemiBold",
                                    fontSize: getProportionateScreenWidth(15),
                                  ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),

                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: [
                            SearchCard(
                              width: MediaQuery.of(context).size.width*.75,
                              height: getProportionateScreenHeight(53),
                              onTap: (){

                              },
                              onChange: (value){

                              },
                            ),
                            CustomButton(
                              width: getProportionateScreenWidth(51),
                              height: getProportionateScreenHeight(53),
                              onTap: (){

                              },
                            ),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

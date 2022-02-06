import 'package:flutter/material.dart';
import 'package:restaurant_test/size_config.dart';

import '../constants.dart';

class OrderCard extends StatelessWidget {
  final String? name,duration;
  final double? price;
  final Image? image;
  final bool? hasSale;
  final int? saleAmount;
   OrderCard({Key? key,this.name,this.price,this.duration,this.image,this.hasSale,this.saleAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width*.67,
      height: getProportionateScreenHeight(83),
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
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration:const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(12)),
            ),
            child: Center(child: image ?? Image.asset("assets/images/default_food.png")),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name!,textAlign:TextAlign.start,style: TextStyle(color:secondTextColor,fontSize: getProportionateScreenWidth(13.0),fontFamily: "MontserratMedium"),),
              Text('AED $price',textAlign:TextAlign.start,style: TextStyle(color:homePageIconsColor,fontSize: getProportionateScreenWidth(10.0),fontFamily: "MontserratMedium"),),
              SizedBox(height: getProportionateScreenHeight(8),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: getProportionateScreenWidth(9),
                    height: getProportionateScreenHeight(13),
                    child: Image.asset("assets/images/timer.png"),
                  ),
                  SizedBox(width: getProportionateScreenWidth(5),),
                  Text('Delivered in $duration',textAlign:TextAlign.start,style: TextStyle(color:hintTextColor,fontSize: getProportionateScreenWidth(10.0),fontFamily: "MontserratMedium"),),
                ],
              ),
            ],
          ),
          hasSale!?Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: getProportionateScreenWidth(25.0),
                height: getProportionateScreenHeight(25.0),
                child: Image.asset('assets/images/sale.png'),
              ),
              SizedBox(height: getProportionateScreenHeight(8),),
              Text("$saleAmount% off",style: TextStyle(color: homePageIconsColor,fontSize: getProportionateScreenWidth(10),fontFamily: "MontserratMedium"),),
            ],
          ):Container(),
        ],
      ),
    );
  }
}

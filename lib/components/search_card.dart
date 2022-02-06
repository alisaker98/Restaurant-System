import 'package:flutter/material.dart';
import 'package:restaurant_test/constants.dart';
import 'package:restaurant_test/size_config.dart';

class SearchCard extends StatelessWidget {
  final double? width, height;
  final Function()? onTap;
  final Function(String?)? onChange;

  const SearchCard(
      {Key? key, this.width, this.height, this.onTap, this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
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
      child: Stack(
        children: [
          GestureDetector(
            onTap: onTap,
            child: Align(
              alignment: Alignment(.9, 0),
              child: Container(
                width: getProportionateScreenWidth(35),
                height: getProportionateScreenHeight(35),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: homePageIconsColor,
                ),
                child: Center(
                  child: Container(
                      width: getProportionateScreenWidth(18),
                      height: getProportionateScreenHeight(18),
                      child: Image.asset("assets/images/search_icon.png")),
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment(-.5, 0),
              child: Container(
                width: width! * .75,
                height: height,
                child: Center(
                  child: TextFormField(
                    cursorColor: homePageIconsColor,
                    style: TextStyle(
                        fontSize: getProportionateScreenWidth(12.0),
                        fontFamily: "MontserratMedium",
                        color: secondTextColor),
                    decoration: InputDecoration(
                        hintText:"Restaurant Name, Cuisine or dish",
                        hintStyle: TextStyle(
                            overflow: TextOverflow.ellipsis,
                            fontSize: getProportionateScreenWidth(12.0),
                            fontFamily: "MontserratMedium",
                            color: hintTextColor),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.fromLTRB(0, 5, 0, 0)),
                    onChanged: onChange,

                  ),
                ),
              )),
        ],
      )
    );
  }
}

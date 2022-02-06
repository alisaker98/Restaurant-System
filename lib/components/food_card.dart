import 'package:flutter/material.dart';
import 'package:restaurant_test/size_config.dart';

class FoodCard extends StatelessWidget {
  final Image? image;
  final String? name;
  final Function()? onTap;
  const FoodCard({Key? key,this.name,this.image,this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: getProportionateScreenWidth(55),
        height: getProportionateScreenHeight(97),
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: Stack(
          children: [
            Center(child: image!),
            Center(
              child: Text(name!,style:TextStyle(fontSize: getProportionateScreenWidth(13),fontFamily: "MontserratMedium",color:Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}

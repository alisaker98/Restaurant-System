import 'package:flutter/material.dart';

import '../constants.dart';
import '../size_config.dart';

class CustomButton extends StatelessWidget {
  final double? width, height;
  final Function()? onTap;

  const CustomButton(
      {Key? key, this.width, this.height, this.onTap})
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
        child:Center(
          child: Container(
              width: width!*.5,
              height: height!*.5,
              child: Image.asset("assets/images/filter_icon.png")),
        ),
    );
  }
}

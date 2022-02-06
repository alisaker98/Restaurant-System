import 'package:flutter/material.dart';

import '../constants.dart';

class ProfilePic extends StatelessWidget {
  final double? width,height;
  final AssetImage? image;
   const ProfilePic(this.width,this.image,this.height, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.transparent,width: 1),
        image: DecorationImage(
          image: image!=null?image!:AssetImage("assets/images/default_pic.png"),
          fit: BoxFit.cover
        ),
      ),
      width: width!,
      height: height!,
    );
  }
}

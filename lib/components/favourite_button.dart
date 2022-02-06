import 'package:flutter/material.dart';

import '../constants.dart';

class FavouriteButton extends StatefulWidget {
  final double? width,height;
  bool? isSelected;
  FavouriteButton({Key? key,this.width,this.height,this.isSelected}) : super(key: key);

  @override
  _FavouriteButtonState createState() => _FavouriteButtonState();
}

class _FavouriteButtonState extends State<FavouriteButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:(){
        setState(() {
          widget.isSelected=!widget.isSelected!;
        });
      },
      child: Container(
        width: widget.width!,
        height: widget.height!,
        decoration: BoxDecoration(
          color:Colors.transparent.withOpacity(0.5),
          borderRadius: const BorderRadius.all(Radius.circular(8.0)),
        ),
        child:Center(
          child: Icon(Icons.favorite,color:widget.isSelected!?homePageIconsColor:Colors.white),
        ) ,
      ),
    );
  }
}

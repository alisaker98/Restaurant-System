import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_test/components/profile_pic.dart';

import '../constants.dart';
import '../size_config.dart';
import 'homepage_screen.dart';

class NavigatorPage extends StatefulWidget {
  const NavigatorPage({Key? key}) : super(key: key);

  @override
  _NavigatorPageState createState() => _NavigatorPageState();
}

class _NavigatorPageState extends State<NavigatorPage>
    with SingleTickerProviderStateMixin {
  static bool isCollapsed = true;
  static const Duration duration = Duration(milliseconds: 300);
  static late AnimationController _controller;
  static late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: 0.8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Stack(
        children: [
          menu(context),
          mainPage(context),
        ],
      ),
    );
  }

  Widget mainPage(BuildContext context) {
    return AnimatedPositioned(
      duration: duration,
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.5 * SizeConfig.screenWidth,
      right: isCollapsed ? 0 : -0.4 * SizeConfig.screenWidth,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Container(
          decoration: isCollapsed?BoxDecoration():BoxDecoration(
            border: Border.all(
              color: Colors.white.withOpacity(.50),
              width: 15
            ),
            borderRadius: BorderRadius.circular(40.0),
          ),
          child: Material(
            animationDuration: duration,
            borderRadius: BorderRadius.all(Radius.circular(40.0)),
            elevation: 0,
            child: HomePage(
              onTap: openDrawer,

            ),
          ),
        ),
      ),
    );
  }

  void openDrawer() {
    setState(() {
      if (isCollapsed)
        _controller.forward();
      else
        _controller.reverse();
      isCollapsed = !isCollapsed;
    });
  }

  Widget menu(BuildContext context) {
    String? selectedValue;
    var languages=[
      {
        "language":"Eng",
        "image":"assets/images/en.png"
      },
      {
        "language":"Ar",
        "image":"assets/images/ar.png"
      },
    ];
    return Scaffold(
      backgroundColor: homePageIconsColor,
      body: Stack(
        children: [
          Align(
            alignment: Alignment(-.75,0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(height: getProportionateScreenHeight(160),),

                ProfilePic(getProportionateScreenWidth(80),AssetImage("assets/images/food_pic.png"), getProportionateScreenHeight(80)),
                SizedBox(height: getProportionateScreenHeight(10),),
                Text("Josh Wa.",style: TextStyle(fontSize: getProportionateScreenWidth(15),fontFamily: "MontserratSemiBold",color: Colors.white),),

                SizedBox(height: getProportionateScreenHeight(80),),
                SizedBox(
                  width: getProportionateScreenWidth(90.0),
                  child: Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(25),
                        height: getProportionateScreenHeight(24),
                        child: Image.asset("assets/images/orders.png"),
                      ),
                      SizedBox(width: getProportionateScreenWidth(6),),
                      Text("Orders",style: TextStyle(fontSize: getProportionateScreenWidth(15.0),fontFamily: "MontserratMedium",color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),

                SizedBox(
                  width: getProportionateScreenWidth(90.0),
                  child: Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(25),
                        height: getProportionateScreenHeight(24),
                        child: Image.asset("assets/images/clock.png"),
                      ),
                      SizedBox(width: getProportionateScreenWidth(6),),
                      Text("History",style: TextStyle(fontSize: getProportionateScreenWidth(15.0),fontFamily: "MontserratMedium",color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),

                SizedBox(
                  width: getProportionateScreenWidth(90.0),
                  child: Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(25),
                        height: getProportionateScreenHeight(24),
                        child: Image.asset("assets/images/privacy.png"),
                      ),
                      SizedBox(width: getProportionateScreenWidth(6),),
                      Text("Privacy",style: TextStyle(fontSize: getProportionateScreenWidth(15.0),fontFamily: "MontserratMedium",color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(50),),

                SizedBox(
                  width: getProportionateScreenWidth(90.0),
                  child: Row(
                    children: [
                      Container(
                        width: getProportionateScreenWidth(25),
                        height: getProportionateScreenHeight(24),
                        child: Image.asset("assets/images/logout.png"),
                      ),
                      SizedBox(width: getProportionateScreenWidth(6),),
                      Text("Logout",style: TextStyle(fontSize: getProportionateScreenWidth(15.0),fontFamily: "MontserratMedium",color: Colors.white)),
                    ],
                  ),
                ),
                SizedBox(height: getProportionateScreenHeight(60),),




              ],

            ),
          ),
          Align(
            alignment: Alignment(-.6,.8),
            child:Container(
              height: getProportionateScreenHeight(100),
              width: MediaQuery.of(context).size.width*.45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Language",style:TextStyle(fontSize: getProportionateScreenWidth(12.0),fontFamily: "MontserratMedium",color: Colors.white)),
                  DropdownButtonHideUnderline(
                    child: DropdownButton2(
                      isExpanded: true,
                      hint: Row(
                        children: [
                          Container(child: Image.asset(languages[0]["image"]!)),
                          const SizedBox(
                            width: 4,
                          ),
                           Expanded(
                            child: Text(
                              languages[0]["language"]!,
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(12),
                                fontFamily: "MontserratMedium",
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                      items: languages
                          .map((item) =>
                          DropdownMenuItem<String>(
                            value: item["language"],
                            child: Row(
                              children: [
                                Container(
                                    decoration:BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                    ),
                                    child: Center(child: Image.asset(item["image"]!,))),
                                 SizedBox(
                                  width: getProportionateScreenWidth(6),
                                ),
                                Expanded(
                                  child: Text(
                                    item["language"]!,
                                    style: TextStyle(
                                      fontSize: getProportionateScreenWidth(12),
                                      fontFamily: "MontserratMedium",
                                      color: secondTextColor,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ],
                            ),
                          ))
                          .toList(),
                      value: selectedValue,
                      onChanged: (value) {
                        setState(() {
                          selectedValue = value as String;
                        });
                      },
                      icon: const Icon(
                        Icons.arrow_drop_down_sharp,
                      ),
                      iconSize: 16,
                      iconEnabledColor: Colors.white,
                      iconDisabledColor: Colors.white,
                      buttonHeight: 50,
                      buttonWidth: 150,
                      buttonDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.transparent,
                      ),
                      buttonElevation: 0,
                      itemHeight: 40,
                      itemPadding: const EdgeInsets.only(left: 14, right: 14,top: 14),
                      dropdownMaxHeight: 200,
                      dropdownWidth: 200,
                      dropdownPadding: null,
                      dropdownDecoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        color: Colors.white,
                      ),
                      dropdownElevation: 0,
                      scrollbarRadius: const Radius.circular(40),
                      scrollbarThickness: 6,
                      scrollbarAlwaysShow: true,
                      offset: const Offset(-20, 30),
                    ),
                  ),                  ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

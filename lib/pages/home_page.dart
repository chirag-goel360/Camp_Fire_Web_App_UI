import 'dart:ui';
import 'package:camp_fire/utility/app_assets.dart';
import 'package:camp_fire/utility/app_colors.dart';
import 'package:camp_fire/utility/app_string.dart';
import 'package:camp_fire/utility/responsive.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: Image.asset(
                AppAssets.bg,
                fit: BoxFit.cover,
              ).image,
            ),
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              boxShadow: <BoxShadow>[
                BoxShadow(
                  color: Colors.white24,
                  blurRadius: 5.0,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                ),
              ],
            ),
            child: Stack(
              children: [
                Positioned(
                  top: -100,
                  right: 120,
                  child: Image.asset(
                    AppAssets.headphone,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _headerWidget(),
                    Flexible(
                      child: _bodyWidget(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _headerWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _logoWidget(),
          if (!Responsive.isMobile(context)) _menuWidget(),
          _btnWidget(),
        ],
      ),
    );
  }

  Widget _logoWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (!Responsive.isMobile(context))
          Image.asset(
            AppAssets.logo,
            height: 30,
          ),
        SizedBox(
          width: 10,
        ),
        if (!Responsive.isMobile(context))
          Text(
            "Camp Fire",
            style: TextStyle(
              fontFamily: AppString.fontBold,
              fontSize: 30,
            ),
          ),
      ],
    );
  }

  Widget _menuWidget() {
    return Container(
      child: Row(
        children: [
          _menuItemWidget(
            text: "Home",
          ),
          _menuItemWidget(
            text: "About",
          ),
          _menuItemWidget(
            text: "Blog",
          ),
          _menuItemWidget(
            text: "Contact us",
          ),
        ],
      ),
    );
  }

  _menuItemWidget({String text}) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 24,
          fontFamily: AppString.fontLight,
        ),
      ),
    );
  }

  Widget _btnWidget() {
    return Container(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 15,
          ),
          onPrimary: AppColors.white,
          primary: AppColors.btnColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Text(
          "Get a Quote",
          style: TextStyle(
            fontSize: 18,
            fontFamily: AppString.fontMedium,
          ),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _bodyWidget() {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: _mainContainWidget(),
          ),
          _bottomListWidget(),
        ],
      ),
    );
  }

  Widget _mainContainWidget() {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (!Responsive.isMobile(context))
                  Text(
                    "Enjoy the\ntime together",
                    style: TextStyle(
                      fontSize: 55,
                      fontFamily: AppString.fontBold,
                    ),
                  ),
                if (Responsive.isMobile(context))
                  Text(
                    "Enjoy the\ntime together",
                    style: TextStyle(
                      fontSize: 33,
                      fontFamily: AppString.fontBold,
                    ),
                  ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "650+ Travel Agents serving 1258+ Destinations worldwide",
                  style: TextStyle(
                    fontSize: 20,
                    fontFamily: AppString.fontLight,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(
                    left: 15,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.btnColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Watch Videos",
                        style: TextStyle(
                          color: AppColors.white,
                          fontFamily: AppString.fontMedium,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Container(
                        margin: EdgeInsets.all(5),
                        padding: EdgeInsets.symmetric(
                          horizontal: 5,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColors.btnColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Image.asset(
              AppAssets.group,
            ),
          ),
        ],
      ),
    );
  }

  Widget _bottomListWidget() {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _listTile(
              "Camp Fire",
              AppAssets.campFire,
              true,
            ),
            _listTile(
              "DJ Night",
              AppAssets.djNight,
              false,
            ),
            _listTile(
              "Photography",
              AppAssets.photography,
              true,
            ),
            _listTile(
              "Competitions",
              AppAssets.competitions,
              false,
            ),
            _listTile(
              "Games",
              AppAssets.games,
              false,
            ),
          ],
        ),
      ),
    );
  }

  Widget _listTile(String text, String image, bool isLike) {
    return Container(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
      ),
      padding: EdgeInsets.symmetric(
        vertical: 0,
      ),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                color: Colors.white.withOpacity(0.5),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.white24,
                    blurRadius: 5.0,
                    offset: Offset(
                      5.0,
                      5.0,
                    ),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    image,
                    height: 150,
                    width: 200,
                    fit: BoxFit.contain,
                  ),
                  Row(
                    children: [
                      Text(
                        text,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        child: CircleAvatar(
                          child: Image.asset(
                            AppAssets.button,
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                isLike ? AppAssets.likeIcon : AppAssets.disLikeIcon,
                height: isLike ? 40 : 20,
                width: isLike ? 40 : 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

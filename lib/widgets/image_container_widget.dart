import 'package:flutter/material.dart';

import '../utils/consonant.dart';

class ImageBuilderContainer extends StatelessWidget {
  Color containerColor;
  String descTextOne;
  String descTextTwo;
  String descTextThree;
  String imagePath;
  Widget widget;
  ImageBuilderContainer(
      {Key? key,
      required this.containerColor,
      required this.descTextOne,
      required this.descTextTwo,
      required this.descTextThree,
        required this.imagePath,
        required this.widget
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8), color: containerColor),
      child: Padding(
        padding: const EdgeInsets.only(left: 12.0,right: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.sizedBox(4, 0.0),
            AppUtils.showTextLocale(
                text: descTextOne,
                style: TextStyle(
                    color: AppUtils.blueColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w800)),
            AppUtils.sizedBox(0.0, 0.0),
            AppUtils.showTextLocale(
                text:descTextTwo,
                style: TextStyle(
                    color: AppUtils.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w800)),
            AppUtils.showTextLocale(
                text: descTextThree,
                style: TextStyle(
                    color: AppUtils.greyColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w800)),
            widget,
            Center(child: Image.asset(imagePath,scale: 1.2,))
          ],
        ),
      ),
      // child: ,
    );
  }
}


class DoubleWidgetImage extends StatelessWidget {
  const DoubleWidgetImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: AppUtils.lightRed),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppUtils.sizedBox(2, 0.0),
                    AppUtils.showTextLocale(
                        text: 'dis',
                        style: TextStyle(
                            color: AppUtils.blueColor,
                            fontSize: 18,
                            fontWeight: FontWeight.w800)),
                    AppUtils.sizedBox(4, 0.0),
                    AppUtils.showTextLocale(
                        text:"shop_sm",
                        style: TextStyle(
                            color: AppUtils.greyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w800)),
                    AppUtils.showTextLocale(
                        text: "save",
                        style: TextStyle(
                            color: AppUtils.greyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.w800)),
                  ],
                )),
                AppUtils.sizedBox(0.0, 0.0),
                Expanded(child: Image.asset('assets/boxes.png'))
              ],
            ),
          ),
          // child: ,
        ),
        AppUtils.sizedBox(12.0, 0.0),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8), color: AppUtils.lightGreen),
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0,right: 8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppUtils.sizedBox(0.0, 0.0),
                    AppUtils.showTextLocale(
                        text: 'subs',
                        style: TextStyle(
                            color: AppUtils.blueColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                    AppUtils.sizedBox(4, 0.0),
                    AppUtils.showTextLocale(
                        text:"get_more",
                        style: TextStyle(
                            color: AppUtils.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                    AppUtils.showTextLocale(
                        text: "les",
                        style: TextStyle(
                            color: AppUtils.greyColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w800)),
                  ],
                )),
                AppUtils.sizedBox(0.0, 0.0),
                Expanded(child: Image.asset('assets/good.png',scale: 1.3,))
              ],
            ),
          ),
          // child: ,
        ),
      ],
    );
  }
}


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_locales/flutter_locales.dart';

class AppUtils {
  static Color textColor = const Color(0xff07052A);
  static Color buttonColor = const Color(0xff4D65C0);
  static Color grayFind = const Color(0xff8C919D);
  static Color sliderOneColor = const Color(0xffFFF0E6);
  static Color sliderTwoColor = const Color(0xffCFF3D5);
  static Color sliderThreeColor = const Color(0xffE6E5F8);
  static Color orangeColor = const Color(0xffE95F36);
  static Color blueColor = const Color(0xff07052A);
  static Color greyColor = const Color(0xff8C919D);
  static Color lightGreen = const Color(0xffF1F9F1);
  static Color lightPink = const Color(0xffF1F1FC);
  static Color lightBlue = const Color(0xffEDFCFF);
  static Color lightRed = const Color(0xffFFF2F2);
  static Color darkGreen = const Color(0xff2CA66F);
  static const List<Color> gradientColors = [
    Color(0xff6633FF),
    Color(0xff04F60B),
  ];

  static Widget sizedBox(double height, double width) {
    return SizedBox(
      height: height,
      width: width,
    );
  }

  static Widget showText({required String text, required TextStyle style}) {
    return Text(
      text,
      style: style,
    );
  }
  static Widget showTextLocale({required String text, required TextStyle style}) {
    return LocaleText(
      text,
      style: style,
    );
  }

  static Widget showCount({required String text}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2),
          color: AppUtils.grayFind.withOpacity(0.3)),
      child: Text(
        text,
        style: TextStyle(color: AppUtils.grayFind.withOpacity(0.8)),
      ),
    );
  }

  // static appRoutePush(BuildContext context,Function() route){
  //   Navigator.push(context, MaterialPageRoute(builder: (_)=>route));
  // }
  static checkCode(
      {required TextEditingController controller,
      required BuildContext context,
      required Function(String) onChange}) {
    return SizedBox(
      height: 48,
      width: 52,
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(10)),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(10)),
          errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
              borderRadius: BorderRadius.circular(10)),
        ),
        onChanged: onChange,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        style: Theme.of(context).textTheme.headline5,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
      ),
    );
  }

  static Widget showLocation() {
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.red)),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0,vertical: 4),
          child: AppUtils.showTextLocale(
            text: "location",
            style: const TextStyle(
                fontWeight: FontWeight.w600, color: Colors.red, fontSize: 14),
          ),
        ),
      ),
    );
  }

  static InputDecoration inputFieldDco({required String hintText}) {
    return InputDecoration(
      isDense: true,
      hintText: hintText,
      prefixIcon: const Icon(Icons.search),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(10)),
      focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(10)),
      errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.withOpacity(0.6)),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
//bottomNavigationBar: ConvexAppBar(
//           // curveSize: ,
//           // curve: ,
//           top: -30,
//           gradient: LinearGradient(
//             colors: _gradientColors,
//             begin: Alignment.bottomLeft,
//             end: Alignment.topRight,
//           ),
//           // backgroundColor: ,
//           style: TabStyle.fixed,
//           items: [
//             TabItem(icon: Icons.add),
//             TabItem(
//               icon: Image.asset('asset/bottom_img.png'),
//             ),
//             TabItem(icon: Icons.assessment),
//           ],
//           initialActiveIndex: 1,
//           onTap: (int i) => print('click index=$i'),
//         ),

import 'package:ecommerce/utils/consonant.dart';
import 'package:flutter/material.dart';

class ShowRestaurants extends StatelessWidget {
  final String imagePath;
  final String name;
  const ShowRestaurants({Key? key,required this.imagePath,required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding:const EdgeInsets.symmetric(horizontal: 6,vertical: 6),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18)
          ),
            child: Image.asset(imagePath,fit: BoxFit.cover,)),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: AppUtils.showTextLocale(
              text: name, style:const TextStyle(fontWeight: FontWeight.w800)),
        ),
      ],
    );
  }
}

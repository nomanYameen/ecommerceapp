



import 'package:ecommerce/utils/consonant.dart';
import 'package:flutter/material.dart';

class ShowFavourite extends StatelessWidget {
  final String imagePath;
  final String desc;
  const ShowFavourite({Key? key,required this.imagePath,required this.desc}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 220,
          height: 120,
          decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(imagePath),
          )
        ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0,vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              // crossAxisAlignment: Ma,
              children: [
                Container(
                  height: 30,
                  padding: EdgeInsets.symmetric(vertical: 6,horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: AppUtils.darkGreen
                  ),
                  child: Center(
                    child: AppUtils.showTextLocale(text: "off_30", style:const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600
                    )),
                  ),
                ),
                CircleAvatar(
                  radius: 12,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.star,color: AppUtils.orangeColor,size: 16,),
                )
              ],
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: AppUtils.showTextLocale(text: desc, style:const TextStyle(
                fontWeight: FontWeight.bold,
              )),
            ),
            AppUtils.sizedBox(0.0, 40),
            Icon(Icons.star,color: AppUtils.orangeColor,size: 18,),
            AppUtils.showText(text: "4.0 (100+)", style:const TextStyle(fontWeight: FontWeight.w700)),
          ],
        ),
        AppUtils.showTextLocale(text:"bev",style: TextStyle(
          color: Colors.grey.withOpacity(0.9)
        ),)
      ],
    );
  }
}

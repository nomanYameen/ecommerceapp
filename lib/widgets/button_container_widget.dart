import 'package:ecommerce/utils/consonant.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final Function() onpress;
  final Widget widget;
  const ButtonWidget({Key? key,required this.onpress,required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpress,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.08,
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/continue_image.png'))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "ggg",
              style: TextStyle(color: Colors.transparent),
            ),
            widget,
            const Padding(
              padding: EdgeInsets.only(right: 10.0),
              child: Icon(
                Icons.arrow_forward,
                size: 20,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

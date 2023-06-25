import 'dart:async';

import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/home.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/screens/home_category_screen.dart';
import 'package:ecommerce/screens/phone.dart';
import 'package:ecommerce/utils/consonant.dart';
import 'package:ecommerce/widgets/button_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class OtpNumber extends StatefulWidget {
  const OtpNumber({Key? key}) : super(key: key);

  @override
  State<OtpNumber> createState() => _OtpNumberState();
}

class _OtpNumberState extends State<OtpNumber> {
  TextEditingController code1 = TextEditingController();
  TextEditingController code2 = TextEditingController();
  TextEditingController code3 = TextEditingController();
  TextEditingController code4 = TextEditingController();
  TextEditingController code5 = TextEditingController();
  TextEditingController code6 = TextEditingController();
  final auth = FirebaseAuth.instance;
  bool isChek =false;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    code1.dispose();
    code2.dispose();
    code3.dispose();
    code4.dispose();
    code5.dispose();
    code6.dispose();
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.sizedBox(50, 0.0),
            Center(
              child: Image.asset('assets/phonedial.png'),
            ),
            AppUtils.sizedBox(30, 0.0),
            AppUtils.showText(
              text: 'We texted you',
              style: TextStyle(
                  color: AppUtils.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            AppUtils.sizedBox(6, 0.0),
            Row(
              children: [
                AppUtils.showText(
                  text: 'Enter the code that we send on',
                  style: TextStyle(
                      color: AppUtils.grayFind.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                AppUtils.showText(
                  text: ' +923063870558',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.9),
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
                ),
              ],
            ),
            AppUtils.sizedBox(20, 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppUtils.showCount(text: "00"),
                AppUtils.sizedBox(0.0, 8),
                AppUtils.showText(
                    text: ":",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: AppUtils.grayFind)),
                AppUtils.sizedBox(0.0, 8),
                AppUtils.showCount(text: _start.toString()),
              ],
            ),
            AppUtils.sizedBox(20, 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppUtils.checkCode(
                    context: context,
                    controller: code1,
                    onChange: (val) {
                      if (code1.text.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                AppUtils.checkCode(
                    context: context,
                    controller: code2,
                    onChange: (val) {
                      if (code2.text.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                AppUtils.checkCode(
                    context: context,
                    controller: code3,
                    onChange: (val) {
                      if (code1.text.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                AppUtils.checkCode(
                    context: context,
                    controller: code4,
                    onChange: (val) {
                      if (code1.text.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                AppUtils.checkCode(
                    context: context,
                    controller: code5,
                    onChange: (val) {
                      if (code1.text.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    }),
                AppUtils.checkCode(
                    context: context,
                    controller: code6,
                    onChange: (val) {
                      // if(code1.text.length ==1){
                      FocusScope.of(context).unfocus();
                      // }
                    }),
              ],
            ),
            AppUtils.sizedBox(10, 0.0),

            ///button widget container
            ButtonWidget(onpress: () async {
              // Create a PhoneAuthCredential with the code
              try {
               setState(() {
                 isChek=true;
               });
                PhoneAuthCredential credential = PhoneAuthProvider.credential(
                    verificationId: PhoneNumber.verificationId,
                    smsCode:
                        "${code1.text + code2.text + code3.text + code4.text + code5.text + code6.text}");

                // Sign the user in (or link) with the credential
                await auth.signInWithCredential(credential);
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>Home()), (route) => false);
                // Navigator.push(context, MaterialPageRoute(builder: (_)=>const Home()));
                print("otp screen called");
               setState(() {
                 isChek=false;
               });
              } on FirebaseAuthException catch (e) {
                print("e called");
                print(e.message.toString());
                flutterToast(message: e.message.toString());
              }
              // Navigator.pushAndRemoveUntil(
              //   context,
              //   MaterialPageRoute(builder: (_) => const HomeCategoryScreen()),
              //   (route) => false,
              // );
            },
              widget: isChek? const Center(child: CircularProgressIndicator(color: Colors.white,),): AppUtils.showText(
                text: "Continue".toUpperCase(),
                style: const TextStyle(
                    color: Colors.white, fontSize: 16, wordSpacing: 1.2),
              ),
            ),
            AppUtils.sizedBox(8, 0.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppUtils.showText(
                    text: "Did not receive Code?",
                    style: TextStyle(color: AppUtils.grayFind)),
                AppUtils.sizedBox(0.0, 4),
                AppUtils.showText(
                    text: " Resend",
                    style: TextStyle(
                        color: AppUtils.buttonColor,
                        fontWeight: FontWeight.w700)),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Timer? _timer;
  int _start = 59;

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}

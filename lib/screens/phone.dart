import 'package:country_picker/country_picker.dart';
import 'package:ecommerce/main.dart';
import 'package:ecommerce/provider/otp_method_provider.dart';
import 'package:ecommerce/screens/otp.dart';
import 'package:ecommerce/utils/consonant.dart';
import 'package:ecommerce/widgets/button_container_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PhoneNumber extends StatefulWidget {
  const PhoneNumber({Key? key}) : super(key: key);
  static String verificationId="";

  @override
  State<PhoneNumber> createState() => _PhoneNumberState();
}

class _PhoneNumberState extends State<PhoneNumber> {
  TextEditingController controller = TextEditingController();
  var countryCode = "+92";
  bool isChek=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [Image.asset('assets/appbaricon.png')],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14.0),
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppUtils.sizedBox(50, 0.0),
            Center(
              child: Image.asset('assets/dial.png'),
            ),
            AppUtils.sizedBox(60, 0.0),
            AppUtils.showText(
              text: 'Welcome to Find',
              style: TextStyle(
                  color: AppUtils.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.w600),
            ),
            AppUtils.sizedBox(6, 0.0),
            Row(
              children: [
                AppUtils.showText(
                  text: 'Enter your phone number below to get into',
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                AppUtils.showText(
                  text: ' Find',
                  style: TextStyle(
                      color: AppUtils.textColor.withOpacity(0.7),
                      fontSize: 17,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
            AppUtils.sizedBox(20, 0.0),
            AppUtils.showText(
              text: 'Phone',
              style: TextStyle(
                  color: AppUtils.textColor,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            ),
            AppUtils.sizedBox(20, 0.0),
            Consumer<OtpCheckProvider>(
              builder: (context,ref,child){
                return TextFormField(
                  onChanged: (val){
                    ref.phoneNumber(val);
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          FocusManager.instance.primaryFocus!.unfocus();
                          showCountryPicker(
                              useSafeArea: true,
                              showPhoneCode: true,
                              context: context,
                              countryListTheme: CountryListThemeData(
                                  flagSize: 25,
                                  backgroundColor: Colors.white,
                                  textStyle: const TextStyle(
                                      fontSize: 16, color: Colors.blueGrey),
                                  bottomSheetHeight: 450,
                                  // Optional. Country list modal height
                                  //Optional. Sets the border radius for the bottomsheet.
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20.0),
                                    topRight: Radius.circular(20.0),
                                  ),
                                  inputDecoration: InputDecoration(
                                    hintText: 'Search Country',
                                    labelText: "Search country by name",
                                    labelStyle:
                                    TextStyle(color: AppUtils.textColor),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.6)),
                                        borderRadius: BorderRadius.circular(10)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.withOpacity(0.6)),
                                        borderRadius: BorderRadius.circular(10)),
                                  )),
                              onSelect: (val) {
                                print('called');
                                print('called');
                                print('called');
                                print(val);
                                // print(val.phoneCode);
                                ref.changeCountryCode(val.phoneCode);
                                print('called');
                                print('called');
                                print('called');
                              });
                        },
                        child:  Padding(
                          padding: EdgeInsets.only(top: 8.0, left: 8),
                          child: Text(
                            "+${ref.countryCode}",
                            style:const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
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
                );
              },
            ),
            AppUtils.sizedBox(30, 0.0),
            Consumer<OtpCheckProvider>(
              builder: (context,ref,child){
                return ButtonWidget(
                    widget: isChek? const Center(child: CircularProgressIndicator(color: Colors.white,),): AppUtils.showText(
                      text: "Continue".toUpperCase(),
                      style: const TextStyle(
                          color: Colors.white, fontSize: 16, wordSpacing: 1.2),
                    ),
                    onpress: ()async{
                  FocusScope.of(context).unfocus();
                  if(ref.phoneNum==null|| ref.phoneNum.isEmpty){
                    flutterToast(message: "Please enter numer");
                  }else if(ref.phoneNum.length < 10){
                    flutterToast(message: "Please enter valid number");
                  }else{
                    // setState(() {
                    //   isChek=true;
                    // });
                    await FirebaseAuth.instance.verifyPhoneNumber(
                      phoneNumber: "${countryCode+ref.phoneNum}",
                      verificationCompleted: (PhoneAuthCredential credential) {},
                      verificationFailed: (FirebaseAuthException e) {},
                      codeSent: (String verificationId, int? resendToken) {
                        PhoneNumber.verificationId= verificationId;
                        Navigator.push(context, MaterialPageRoute(builder: (_)=>const OtpNumber()));
                      },
                      codeAutoRetrievalTimeout: (String verificationId) {},
                    );
                    // setState(() {
                    //   isChek=false;
                    // });
                  }
                  print('phone code called');
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>const OtpNumber()));
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}

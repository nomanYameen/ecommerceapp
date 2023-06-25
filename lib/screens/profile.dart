


import 'package:ecommerce/screens/phone.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Placeholder(
      child: Scaffold(
        body: GestureDetector(
          onTap: ()async{
          await FirebaseAuth.instance.signOut().then((value) =>{
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>const PhoneNumber()), (route) => false)
          });
          },
            child:const Center(child: Text('Logout'),)),
      ),
    );
  }
}

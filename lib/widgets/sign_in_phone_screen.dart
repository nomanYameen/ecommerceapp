// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
//
// class PhoneNumberAuthenticationScreen extends StatefulWidget {
//   @override
//   _PhoneNumberAuthenticationScreenState createState() =>
//       _PhoneNumberAuthenticationScreenState();
// }
//
// class _PhoneNumberAuthenticationScreenState
//     extends State<PhoneNumberAuthenticationScreen> {
//   final FirebaseAuth _auth = FirebaseAuth.instance;
//   String _verificationId = '';
//
//   void _verifyPhoneNumber(String phoneNumber) async {
//     await _auth.verifyPhoneNumber(
//       phoneNumber: phoneNumber,
//       verificationCompleted: (PhoneAuthCredential credential) async {
//         // Auto-retrieval of the verification code completed.
//         // Sign in the user with the credential.
//         await _auth.signInWithCredential(credential);
//         // Handle the signed-in user.
//       },
//       verificationFailed: (FirebaseAuthException e) {
//         // Handle verification failed scenario.
//         print('erroc called');
//         print('erroc called');
//         print('erroc called');
//         print(e.message.toString());
//         print('erroc called');
//         print('erroc called');
//         print('erroc called');
//       },
//       codeSent: (String verificationId, int? resendToken) {
//         // Save the verification ID for later use.
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//       codeAutoRetrievalTimeout: (String verificationId) {
//         // Auto-retrieval timeout.
//         setState(() {
//           _verificationId = verificationId;
//         });
//       },
//     );
//   }
//
//   void _signInWithPhoneNumber(String smsCode) async {
//     try {
//       final PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: _verificationId,
//         smsCode: smsCode,
//       );
//       final UserCredential userCredential =
//       await _auth.signInWithCredential(credential);
//       final User? user = userCredential.user;
//       // Handle the signed-in user.
//     } catch (e) {
//       // Handle sign-in error.
//       print(e.toString());
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Number Authentication'),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           ElevatedButton(
//             onPressed: () {
//               _verifyPhoneNumber('+1234567890'); // Replace with the phone number you want to verify
//             },
//             child: Text('Verify Phone Number'),
//           ),
//           SizedBox(height: 16),
//           ElevatedButton(
//             onPressed: () {
//               _signInWithPhoneNumber('123456'); // Replace with the SMS code you received
//             },
//             child: Text('Sign In with SMS Code'),
//           ),
//         ],
//       ),
//     );
//   }
// }

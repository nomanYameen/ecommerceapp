import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce/screens/chats.dart';
import 'package:ecommerce/screens/home_category_screen.dart';
import 'package:ecommerce/screens/home_screen_bottom.dart';
import 'package:ecommerce/screens/orders.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';

import 'screens/otp.dart';
import 'screens/phone.dart';
import 'screens/profile.dart';
import 'utils/consonant.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  final List _screenList =  [
    HomeCategoryScreen(),
    // HomeBottomScreen(),
    Orders(),
    HomeCategoryScreen(),
    Chats(),
    Profile(),
  ];
  int _cIndex = 2;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _onPressed() {
    if (_animationController.isDismissed) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }
  bool _isFirstIcon = true;
  @override
  Widget build(BuildContext context) {
    return Placeholder(
        child: Scaffold(
            // appBar: AppBar(
            //   title: Text('Bottom Navigation Bar'),
            // ),
            body: _screenList[_cIndex],
            bottomNavigationBar: ConvexAppBar(
              // curve: 20,
              // curveSize:120,
              // height: 120,
              height: 68,
              // top: 120,
              curveSize: 100,
              cornerRadius: 20,
              gradient: const LinearGradient(
                  colors: AppUtils.gradientColors,
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight),
              style: TabStyle.fixedCircle,
              items: [
                TabItem(
                  activeIcon: Image.asset('assets/home-Filled.png',scale: 0.1,),
                  icon: Image.asset('assets/home-Regular.png',scale: 0.1,),
                    title: Locales.string(context, "home")),
                TabItem(
                    activeIcon: Image.asset(
                      'assets/package-Filled.png',
                      scale: 0.1,
                    ),
                    icon: Image.asset(
                      'assets/package-Regular.png',
                      scale: 0.1,
                      // scale: 0.001,
                    ),
                    title: Locales.string(context, 'order')),
                TabItem(
                    // activeIcon: CircleAvatar(
                    //   // backgroundColor: Colors.red,
                    //   // backgroundColor: Color(0xff#FFEA17),
                    //   // radius: 40,
                    //   child: Center(
                    //     child: Image.asset(
                    //       'assets/bottom_img.png',
                    //       // scale: 0.1,
                    //       // fit: BoxFit.contain,
                    //     ),
                    //   ),
                    //   // backgroundColor: Colors.red,
                    // ),
                    icon: Container(
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage('assets/circle_color.png'),scale: 0.1)
                      ),
                      child: Center(child: Icon(Icons.shopping_basket,color: Colors.white,),),
                    )),
                TabItem(
                    icon: Image.asset(
                      'assets/comment-dots-Regular.png',
                      scale: 0.1,
                    ),
                    activeIcon: Image.asset(
                      'assets/comment-dots-Filled.png',
                      scale: 0.1,
                    ),
                    title: Locales.string(context, 'chat')),
                TabItem(
                    activeIcon: Image.asset(
                      'assets/user-Filled.png',
                      scale: 0.1,
                    ),
                    icon: Image.asset(
                      'assets/user-Regular.png',
                      scale: 0.1,
                    ),
                    title: Locales.string(context, 'profile')),
              ],
              // initialActiveIndex: 2,
              onTap: (int i) => _incrementTab(i),
            )));
  }

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }
}

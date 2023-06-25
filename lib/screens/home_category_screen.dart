import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/utils/consonant.dart';
import 'package:ecommerce/widgets/image_container_widget.dart';
import 'package:ecommerce/widgets/show_favourite_marchates_widget.dart';
import 'package:ecommerce/widgets/show_restaurants_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'show_api_data.dart';

class HomeCategoryScreen extends StatefulWidget {
  const HomeCategoryScreen({Key? key}) : super(key: key);

  @override
  State<HomeCategoryScreen> createState() => _HomeCategoryScreenState();
}

class _HomeCategoryScreenState extends State<HomeCategoryScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Row(
            children: [
              Image.asset('assets/map-marker-Regular.png'),
              AppUtils.sizedBox(0.0, 8),
              AppUtils.showTextLocale(
                text: "Welcome",
                style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    fontSize: 16),
              ),
              AppUtils.sizedBox(0.0, 6),
              GestureDetector(
                onTap: (){
                  LocaleNotifier.of(context)!.change('ar');
                  // Navigator.push(context, MaterialPageRoute(builder: (_)=>ShowApiData()));
                },
                  child: AppUtils.showLocation()),
            ],
          ),
          actions: [Image.asset('assets/heart-Regular.png')],
        ),
      ),
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              decoration: AppUtils.inputFieldDco(
                  hintText: Locales.string(context, "shops_search")),
            ),
            AppUtils.sizedBox(8.0, 0.0),
            ///slider for show images
            CarouselSlider(
              items: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: AppUtils.sliderOneColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          child: Padding(
                        padding: const EdgeInsets.only(left: 18.0,top: 8,right: 12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppUtils.showTextLocale(text: "20_off", style: TextStyle(
                              color: AppUtils.orangeColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w800
                            )),
                            AppUtils.showTextLocale(text: "any_fast_food", style: TextStyle(
                                color: AppUtils.blueColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w600
                            )),
                            AppUtils.sizedBox(4, 0.0),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                gradient: const LinearGradient(
                                    colors: AppUtils.gradientColors,
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.bottomRight),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 4.0),
                                      child: AppUtils.showTextLocale(text: "order_now", style:const TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          // fontWeight: FontWeight.w600
                                      )),
                                    ),
                                    const Icon(Icons.arrow_forward_rounded,color: Colors.white,size: 22,)
                                  ],
                                ),
                              ),
                            ),
                            AppUtils.sizedBox(8, 0.0),
                            AppUtils.showTextLocale(text: "valid_util", style: TextStyle(
                                color: AppUtils.greyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w600
                            )),
                        ],),
                      )),
                      Expanded(
                          child: Image.asset('assets/Pizza_slice.png',scale: 1.4,)),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: AppUtils.sliderTwoColor,
                    borderRadius: BorderRadius.circular(8.0),
                    // image: const DecorationImage(
                    //   image: AssetImage("asset/carsoul.png"),
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: AppUtils.sliderThreeColor,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ],
              options: CarouselOptions(
                height: 140.0,
                enlargeCenterPage: true,
                // autoPlay: true,
                aspectRatio: 16 / 9,
                // enlargeFactor: 0.3,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration:const Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
            ///grid view for images
            AppUtils.sizedBox(8.0, 0.0),
            GridView.extent(
              shrinkWrap: true,
              physics:const NeverScrollableScrollPhysics(),
              // childAspectRatio: 1/16,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              maxCrossAxisExtent: 180.0,
              // childAspectRatio: 1/16,
              children: [
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (_)=>ShowApiData()));
                  },
                  child: ImageBuilderContainer(
                    imagePath: 'assets/food_image_test.png',
                    containerColor: AppUtils.lightGreen,
                    descTextOne: "food_delivery",
                    descTextTwo: "order_from",
                    descTextThree: "order_res",
                    widget: AppUtils.sizedBox(4, 0.0),
                  ),
                ),
                ImageBuilderContainer(
                  imagePath: 'assets/shop_bag.png',
                  containerColor: AppUtils.lightPink,
                  descTextOne: "store",
                  descTextTwo: "shop_til",
                  descTextThree: "shop_end",
                  widget: AppUtils.sizedBox(0.0, 0.0),
                ),
                ImageBuilderContainer(
                  imagePath: 'assets/thank_you.png',
                  containerColor: AppUtils.lightBlue,
                  descTextOne: "courier",
                  descTextTwo: "parcel",
                  descTextThree: "door",
                  widget: AppUtils.sizedBox(34, 0.0),
                ),
                const DoubleWidgetImage(),
              ],

            ),
            ///show user fav data
            AppUtils.sizedBox(12.0, 0.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppUtils.showTextLocale(text: "fav", style:  TextStyle(
                  fontSize: 18,
                  color: AppUtils.blueColor,
                  fontWeight: FontWeight.bold
                )),
                AppUtils.showTextLocale(text: "view_all", style: TextStyle(
                  color: AppUtils.orangeColor
                )),
              ],
            ),
            AppUtils.sizedBox(8.0, 0.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  const ShowFavourite(imagePath: 'assets/dinner.png', desc: "tea"),
                  AppUtils.sizedBox(0.0, 12.0),
                  const ShowFavourite(imagePath: 'assets/Rectangle5919.png', desc: "imtiaz_store"),
                ],
              ),
            ),
            ///section for resturants
            AppUtils.sizedBox(12.0, 0.0),
            AppUtils.showTextLocale(text: "restaurants", style:  TextStyle(
                fontSize: 18,
                color: AppUtils.blueColor,
                fontWeight: FontWeight.bold
            )),
            AppUtils.sizedBox(12.0, 0.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing3.png',
                        name: 'shar',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing1.png',
                        name: 'bur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pizza.png',
                        name: 'pizza',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing1.png',
                        name: 'bur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing1.png',
                        name: 'bur',
                      ),
                    ],
                  ),
                  AppUtils.sizedBox(12.0, 0.0),
                  Row(
                    children: [
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing3.png',
                        name: 'shar',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing1.png',
                        name: 'bur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pizza.png',
                        name: 'pizza',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing1.png',
                        name: 'bur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing1.png',
                        name: 'bur',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ///section for stores
            AppUtils.sizedBox(12.0, 0.0),
            AppUtils.showTextLocale(text: "store", style:  TextStyle(
                fontSize: 18,
                color: AppUtils.blueColor,
                fontWeight: FontWeight.bold
            )),
            AppUtils.sizedBox(12.0, 0.0),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                children: [
                  Row(
                    children: [
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing14.png',
                        name: 'fur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing13.png',
                        name: 'gift',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing14.png',
                        name: 'fur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing13.png',
                        name: 'gift',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing14.png',
                        name: 'fur',
                      ),
                      AppUtils.sizedBox(0.0, 18.0),
                      const ShowRestaurants(
                        imagePath: 'assets/pngwing13.png',
                        name: 'gift',
                      ),
                    ],
                  ),
                ],
              ),
            ),
            AppUtils.sizedBox(80, 0.0)
          ],
        ),
      ),
    );
  }
}

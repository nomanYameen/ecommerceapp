import 'package:ecommerce/provider/otp_method_provider.dart';
import 'package:ecommerce/utils/consonant.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShowApiData extends StatefulWidget {
  const ShowApiData({Key? key}) : super(key: key);

  @override
  State<ShowApiData> createState() => _ShowApiDataState();
}

class _ShowApiDataState extends State<ShowApiData> {
  @override
  void initState() {
    context.read<OtpCheckProvider>().getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        elevation: 0.0,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Food & Drinks",
              style: TextStyle(color: AppUtils.blueColor, fontSize: 16,fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  "Deliver to",
                  style: TextStyle(
                      color: Colors.grey.withOpacity(0.7), fontSize: 14),
                ),
                Text(
                  " Muhammad Dist. Riyah",
                  style: TextStyle(color: Colors.red, fontSize: 16),
                ),
              ],
            )
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12.0, top: 10),
            child: Icon(
              Icons.search,
              color: Colors.grey.withOpacity(0.9),
            ),
          )
        ],
      ),
      body: Consumer<OtpCheckProvider>(
        builder: (context, ref, child) {
          return ref.listType == null || ref.listType!.isEmpty
              ?  Center(
                  child: CircularProgressIndicator(color: AppUtils.buttonColor),
                )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppUtils.sizedBox(12.0, 0.0),
                    Expanded(
                      child: GridView.builder(
                          itemCount: ref.listType!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  // crossAxisSpacing: ,
                                  mainAxisSpacing: 12.0,
                                  crossAxisSpacing: 12.0,
                                  childAspectRatio: 16 / 12),
                          itemBuilder: (context, int index) {
                            final data = ref.listType![index];
                            return Column(
                              children: [
                                Container(
                                  padding:const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
                                  width:double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18)
                                    ),
                                    child: Image.network(data.image,height: 90,width: 90,)),
                                AppUtils.sizedBox(4.0, 0.0),
                                Text(
                                  data.title,
                                  style:  TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14,
                                    color: AppUtils.darkGreen,
                                    overflow: TextOverflow.ellipsis
                                  ),
                                )
                              ],
                            );
                          }),
                    ),
                  ],
                );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: Colors.white,
          onPressed: () {},
          label: const Text(
            "Around Me",
            style: TextStyle(color: Color(0xff07052A)),
          ),
          icon: const Icon(
            Icons.compass_calibration,
            color: Color(0xff07052A),
          )),
    );
  }
}

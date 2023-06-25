import 'dart:convert';

import 'package:ecommerce/model/category_model_class.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class OtpCheckProvider extends ChangeNotifier {
  int count = 0;
  String countryCode = "93";
  var phoneNum = "";
  List<CategoryModelClass>? listType;
  // List<CategoryModelClass>? list;
  // CategoryModelClass? categoryModelClass;

  increment() {
    count++;
    notifyListeners();
  }

  changeCountryCode(String code) {
    countryCode = code;
    print("country code");
    print("country code");
    print("country code");
    print(countryCode);
    notifyListeners();
  }

  phoneNumber(String num) {
    phoneNum = num;
    print(phoneNum);
    notifyListeners();
  }

  Future getData() async {
    var url = "https://fakestoreapi.com/products";
    final res = await http.get(Uri.parse(url));

    if (res.statusCode == 200) {
      // List<CategoryModelClass> jsonList = jsonDecode(res.body);
      // list = jsonList;
      // jsonList.map((e) =>CategoryClass.)
      // notifyListeners();
      // List data = res.body
      // categoryModelClass = CategoryModelClass.
      // List<CategoryModelClass> jsonLi =
          // List<CategoryModelClass>.from(categoryModelClassFromJson(res.body));
      List<CategoryModelClass> list = categoryModelClassFromJson(res.body);
      listType = list;
      // notifyListeners();
      // return jsonLi;
      // categoryModelClass = jsonList.map((value) => categoryModelClassFromJson(value));
      // categoryModelClass = categoryModelClassFromJson(res.body);
      // categoryModelClass = jsonList.map((value) => CategoryModelClass.fromJson(value));
    }
  }
}

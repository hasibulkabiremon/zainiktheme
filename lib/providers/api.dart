import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as Http;
import 'package:zainikapi/model/product_list.dart';

class ProductProvider extends ChangeNotifier {

  ProductList products = ProductList();

  Future<void> getCurrentWeatherData() async {
    const urlString =
        'https://mocki.io/v1/02e91d9f-4d8c-4eb4-a4f9-bb4a60ffdaf9';
    final response = await Http.get(Uri.parse(urlString));
    final map = json.decode(response.body);
    if (response.statusCode == 200) {
      print('success');
      products  = ProductList.fromJson(map);
      notifyListeners();
    } else {
      print(map['message']);
    }
  }
}
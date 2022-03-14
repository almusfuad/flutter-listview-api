import 'dart:convert';

import 'package:flutter/material.dart';

// packages to use multi fuction
import 'package:http/http.dart' as http;

// other dart file to use in this file
import '../models/data.dart';


// declare class for all Api
class ProductsApi with ChangeNotifier {


  // Function future async to get data if response is okay
  Future<List<Data>> fetchData() async {
    final url = Uri.parse('https://picsum.photos/v2/list');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      // print(jsonResponse);

      return jsonResponse.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('An error occured!');
    }
  }
}

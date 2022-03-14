// package to view material icon
import 'package:flutter/material.dart';
import 'package:flutter_listview_api/providers/products_api.dart';

// packages for convert json
import 'dart:convert';

// other packages to help data
import 'package:http/http.dart' as http;

//other dartfiles
import '../models/data.dart';

class DetailsApi with ChangeNotifier {
  String? id;
  String? downloadUrl;
  String? url;
  String? author;

  // DetailsApi({
  //   this.id,
  //   this.author,
  //   this.download_url,
  //   this.url,
  // });

  // function to get
  Future<List<Data>> fetchSingleData(String id) async {
    final url = Uri.parse('https://picsum.photos/id/${id}/info');

    final response = await http.get(url);

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);

      return jsonResponse.map((data) => Data.fromJson(data)).toList();
    } else {
      throw Exception('An error occurred');
    }
  }
}

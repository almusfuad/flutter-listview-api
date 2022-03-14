// declare data class to get data
import 'package:flutter/material.dart';

class Data with ChangeNotifier {
  // declare non assign variable  name
  String? id;
  String? author;
  String? downloadUrl;
  String? url;
  int? height;
  int? width;

  Data({
    this.id,
    this.author,
    this.downloadUrl,
    this.url,
    this.height,
    this.width,
  });

  // function to get data via json and assign declared varible
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'],
      author: json['author'],
      downloadUrl: json['download_url'],
      url: json['url'],
      height: json['height'],
      width: json['width'],
    );
  }
}

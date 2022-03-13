class Data {
  int? id;
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

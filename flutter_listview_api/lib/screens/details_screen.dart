import 'package:flutter/material.dart';
import 'package:flutter_listview_api/models/data.dart';
import 'package:flutter_listview_api/providers/details_api.dart';

import 'package:provider/provider.dart';

// details Screen class to show a list details
class DetailsScreen extends StatefulWidget {
  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    // final productsId = ModalRoute.of(context)?.settings.arguments as String;
    final loadedProduct = Provider.of<DetailsApi>(
      context,
      listen: false,
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pushNamed('/listViewScreen');
            },
          ),
          title: Text('Details page'),
        ),
        body: Center(
          child: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              children: [
                Text(
                  loadedProduct.id.toString(),
                ),
                Text(
                  loadedProduct.author.toString(),
                ),
                Text(
                  loadedProduct.downloadUrl.toString(),
                ),
                Text(
                  loadedProduct.url.toString(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

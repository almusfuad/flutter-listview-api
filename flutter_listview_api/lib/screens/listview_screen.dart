// Import core packages to intialize app
import 'package:flutter/material.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.blue.shade50,
            child: const Text('Products List'),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.logout,
            ),
            onPressed: () {},
          ),
        ),
        body: Center(
          child: SingleChildScrollView(
              // child: ListView.builder(itemBuilder: ),
              ),
        ),
      ),
    );
  }
}

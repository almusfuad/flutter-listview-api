// Import core packages to intialize app
import 'package:flutter/material.dart';

// other making dart file
import '../models/data.dart';
import '../providers/products_api.dart';

class ListViewScreen extends StatefulWidget {
  @override
  State<ListViewScreen> createState() => _ListViewScreenState();
}

class _ListViewScreenState extends State<ListViewScreen> {
  // declare variable to use fetch data
  Future<List<Data>>? futureData;

  // set initial state as fetchdata
  @override
  void initState() {
    super.initState();
    futureData = ProductsApi().fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Title(
            color: Colors.blue.shade50,
            child: const Text('Authors List'),
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
          // data fetting from api and build a list to show data in list
          child: FutureBuilder<List<Data>>(
            future: futureData,
            builder: (BuildContext ctx, AsyncSnapshot<List<Data>> snapshot) {
              if (snapshot.hasData) {
                List<Data>? data = snapshot.data;
                return ListView.builder(
                  itemBuilder: ((BuildContext ctx, int index) {
                    return Container(
                      height: MediaQuery.of(context).size.height * 0.05,
                      color: Colors.white60,
                      child: Center(
                        child: Container(
                          // margin: const EdgeInsets.only(
                          //   bottom: 1.0,
                          // ),
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            border: Border.all(
                              color: Colors.black,
                              width: 1.0,
                              style: BorderStyle.solid,
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 10.0,
                                  right: 10.0,
                                ),
                                child: Container(
                                  height: 30.0,
                                  margin: const EdgeInsets.only(
                                    bottom: 2.0,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey[50],
                                        ),
                                        child: Text(
                                          data![index].id.toString(),
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 18.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blueGrey[50],
                                        ),
                                        child: Text(
                                          data[index].author.toString(),
                                          style: const TextStyle(
                                            color: Colors.black87,
                                            fontSize: 20.0,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed('/detailsScreen');
                                        },
                                        child: const Text(
                                          'Details',
                                          // style: TextStyle(
                                          //   fontSize: 12.0,
                                          // ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                  itemCount: data?.length,
                );
              } else {
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}

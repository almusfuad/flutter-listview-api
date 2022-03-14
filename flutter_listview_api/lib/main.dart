import 'package:flutter/material.dart';

// other packeges to help run the app
import 'package:provider/provider.dart';

// other dart file to reuse
import './screens/listview_screen.dart';
import './screens/details_screen.dart';
import './providers/products_api.dart';

// route file
import './routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // using providers to make data more flexible
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsApi(),
        )
      ],
      child: MaterialApp(
        title: 'Author list',
        debugShowCheckedModeBanner: false,

        // themes and fonts
        theme: ThemeData(
          primarySwatch: Colors.blue,
          colorScheme: ColorScheme.fromSwatch().copyWith(
            secondary: Colors.black87,
          ),
        ),

        // routing and initial stage screen
        home: ListViewScreen(),
        routes: {
          MyRoutes.listViewScreen: (context) => ListViewScreen(),
          MyRoutes.detailsScreen: (context) => DetailsScreen(),
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'home_page.dart';
import 'product_list_page.dart';
import 'product_details_page.dart';
import 'login_page.dart';
import 'cart_page.dart';
import 'cart_model.dart';
import 'product_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => Cart(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Motorcycle Shop',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      home: LoginPage(),
      routes: {
        '/home': (context) => HomePage(),
        '/product-list': (context) => ProductListPage(),
        '/cart': (context) => CartPage(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/product-details') {
          final product = settings.arguments as Product;
          return MaterialPageRoute(
            builder: (context) {
              return ProductDetailsPage(product: product);
            },
          );
        }
        return null;
      },
    );
  }
}

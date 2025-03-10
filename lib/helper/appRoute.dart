import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/views/screens/notFoundProduct.dart';
import 'package:celus_fe/core/views/screens/scanBarcodeOne.dart';
import 'package:flutter/material.dart';

import '../core/views/screens/addProductScreen.dart';
import '../core/views/screens/allProductsScreen.dart';
import '../core/views/screens/productInfo.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/allProductionScreen':
        return MaterialPageRoute(builder: (ctx) => AllProductsScreen());
      case '/productInfo':
      Product product = settings.arguments as Product;
       return MaterialPageRoute(builder:(context) => ProductInfo(product:product,),settings:settings );
      case '/scanBarcodeOne':
        return MaterialPageRoute(builder: (ctx) => ScanBarcodeOne());
      case '/notFoundProduct':
        return MaterialPageRoute(builder: (ctx) => NotFoundProduct());
      case '/addProductScreen':
        return MaterialPageRoute(builder: (ctx) => AddProductScreen());
    }
  }
}
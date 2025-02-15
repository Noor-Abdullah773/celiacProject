import 'package:celus_fe/core/models/product.dart';
import 'package:flutter/material.dart';

import '../core/views/screens/allProductsScreen.dart';
import '../core/views/screens/notSaveVoting.dart';

class RouteManager {
  static Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/allProductionScreen':
        return MaterialPageRoute(builder: (ctx) => AllProductsScreen());
      case '/infoProduct':
      Product product = settings.arguments as Product;
       return MaterialPageRoute(builder:(context) => NotSaveVoting(product:product,),settings:settings );
    }
  }
}
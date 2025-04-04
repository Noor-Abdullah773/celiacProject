import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/views/screens/scanBarcodeOne.dart';
import 'package:flutter/material.dart';
import '../core/models/productUploader.dart';
import '../core/views/screens/addProductScreen.dart';
import '../core/views/screens/allProductsScreen.dart';
import '../core/views/screens/doneAddProduc.dart';
import '../core/views/screens/productInfo.dart';
import '../core/views/screens/addProductImage.dart';

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
      case '/addProductScreen':
        return MaterialPageRoute(builder: (ctx) => AddProductScreen());
      case '/addProductImage':
       ProductUploader productUploader = settings.arguments as ProductUploader;
        return MaterialPageRoute(builder: (ctx) => AddProductImage(productUploader:productUploader,),settings:settings);
      case '/doneAddProduct':
        return MaterialPageRoute(builder: (ctx) => DoneAddProduct());
    }
  }
}
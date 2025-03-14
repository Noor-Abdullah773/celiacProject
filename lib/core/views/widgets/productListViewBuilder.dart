import 'package:flutter/widgets.dart';

import '../../models/product.dart';
import 'customProductUI.dart';

class ProductListViewBuilder extends StatelessWidget {
  const ProductListViewBuilder({super.key, required this.products});
final List<Product> products;
  @override
  Widget build(BuildContext context) {
    return Expanded(
                child: ListView.builder(
                  padding:EdgeInsets.only(bottom:70 ) ,
                  itemCount:products.length,
                  itemBuilder:(con,i){
                  return CustomProductUI(product:products[i],);
                            }),
              );
  }
}


import 'package:celus_fe/core/views/widgets/bigStack.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../constants/text_styles.dart';
import '../../models/product.dart';
import '../../view_model/productsVM.dart';
import '../widgets/customProductUI.dart';
import '../widgets/infoBar.dart';
import '../widgets/searchBox.dart';

class AllProductsScreen extends StatefulWidget {
   AllProductsScreen({super.key});
  @override
  State<AllProductsScreen> createState() => _AllProductsScreenState();

}

class _AllProductsScreenState extends State<AllProductsScreen> {

  List<Product> products = [];
  bool isLoading = true;
  String errorMessage = '';
  @override
  var future;
  void initState() {
    super.initState();
    future = ProductsVM(Dio()).get();
  }
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BigStuck(widget:Padding(
        padding:EdgeInsets.only(right: 27,left: 27,bottom: 40),
        child:Column(crossAxisAlignment:CrossAxisAlignment.start ,
          children: [
          SizedBox(height: 30,),
          Text (
              'المنتجات',
              style:AppTextStyle.mainWord
              ),
              SizedBox(height: 39,),
              InfoBar(),
              SizedBox(height: 32,),
          SearchBox(),
          SizedBox(height: 14,),
          FutureBuilder <List<dynamic>?>(
            future: future,
            builder:(context,snabshot){
             if(snabshot.hasData)
             {    
              return Expanded(
                child: ListView.builder(
                itemCount:snabshot.data!.length,
                itemBuilder:(con,i){
                return CustomProductUI(product:snabshot.data![i],);
                          }),
              );
             }
            else if(snabshot.hasError)
             return Text('error');
            else 
             return Center(child: CircularProgressIndicator());
      
            }
            )
          
        ],) ,
      )
      ),
    );
  }
}
import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class Product {
  int? id;
  String productName;
  String barcode;
  int positiveVotes;
  int negativeVotes;
  XFile? imageURL;
  XFile? imageIngredientsURL;
  int? alternatives;
  

  Product(
      {  this.id,
      required this.productName,
     required this.barcode,
      required this.positiveVotes,
      required  this.negativeVotes,
      this.imageURL,
      this.imageIngredientsURL,
      this.alternatives,
      });

 factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id:json['id'],
    productName:json['productName'],
    barcode: json['barcode'],
    positiveVotes: json['positiveVotes'],
    negativeVotes:  json['negativeVotes'],
    imageURL:XFile(json['imageURL']), 
    imageIngredientsURL: json['imageIngredientsURL'] != null ? XFile(json['imageIngredientsURL']) : null,
    alternatives: json['alternatives'],
    );
    
  }

  Future <Map<String, dynamic>> toJson()async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['barcode'] = this.barcode;
    data['positiveVotes'] = this.positiveVotes;
    data['negativeVotes'] = this.negativeVotes;
    data['imageURL'] = await MultipartFile.fromFile(imageURL!.path);
    if(imageIngredientsURL !=null)
    data['imageIngredientsURL'] = await MultipartFile.fromFile(imageIngredientsURL!.path);
    data['alternatives'] = this.alternatives;
    return data;
  }
}
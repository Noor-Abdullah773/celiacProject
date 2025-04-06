import 'package:dio/dio.dart';
import 'package:image_picker/image_picker.dart';

class ProductUploader{
  String productName;
  String barcode;
  String manufacturerCountry;
  String brandName;
  XFile? productImage;
  XFile? ingredientsImage;

  ProductUploader({required this.productName,required this.brandName,required this.manufacturerCountry,
  required this.barcode,this.ingredientsImage,this.productImage
  });
  factory ProductUploader.fromJson(Map<String, dynamic> json) {
    return ProductUploader(
      productName:json['productName'],
      brandName: json['brandName'],
      manufacturerCountry: json['manufacturerCountry'], 
      barcode: json['barcode'], 
      productImage:XFile(json['productImage']), 
      ingredientsImage:  XFile(json['ingredientsImage'])
      );
  }
  Future <Map<String, dynamic>> toJson()async {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['productName'] = this.productName;
    data['brandName'] = this.brandName;
    data['manufacturerCountry'] = this.manufacturerCountry;
    data['barcode'] = this.barcode;
    data['productImage'] =await MultipartFile.fromFile (productImage!.path);
    data['ingredientsImage'] =await MultipartFile.fromFile (ingredientsImage!.path);
    return data;
  }

}
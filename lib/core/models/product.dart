class Product {
  int id;
  String productName;
  String barcode;
  int? positiveVotes;
  int? negativeVotes;
  String? imageURL;
  int? alternatives;
  

  Product(
      { required this.id,
      required this.productName,
     required this.barcode,
      this.positiveVotes,
      this.negativeVotes,
      this.imageURL,
      this.alternatives,
      });

 factory Product.fromJson(Map<String, dynamic> json) {
  return Product(
    id:json['id'],
    productName:json['productName'],
    barcode: json['barcode'],
    positiveVotes: json['positiveVotes'],
    negativeVotes:  json['negativeVotes'],
    imageURL:json['imageURL'],
    alternatives: json['alternatives'],
    );
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productName'] = this.productName;
    data['barcode'] = this.barcode;
    data['positiveVotes'] = this.positiveVotes;
    data['negativeVotes'] = this.negativeVotes;
    data['imageURL'] = this.imageURL;
    data['alternatives'] = this.alternatives;;
    return data;
  }
}
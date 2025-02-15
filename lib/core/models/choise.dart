class ChoiseModel{
   int id;
   String text;
   ChoiseModel({required this.id,required this.text});
   factory ChoiseModel.fromJson(Map<String,dynamic> json){
    return ChoiseModel(id:json['id'], text:json['text']);
   }
}
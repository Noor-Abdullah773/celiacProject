
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/helper/cubits/search_product_cubit/search_product_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/view_model/searchByName.dart';

class SearchProductCubit extends Cubit <SearchProductState>{
  SearchProductCubit(super.initialState);
List<dynamic>? products;
searchProduct({required String name})async{
 try {
  products = await SearchByNameVM(Dio()).get(name: name);
 // emit(state)
} on Exception catch (e) {
  //emit(state)
}

}
}
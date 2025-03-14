
import 'package:celus_fe/core/view_model/productsVM.dart';
import 'package:celus_fe/helper/cubits/get_product_cubit/get_product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit():super(ProductInitialState());
  void gerProducts()async{
    emit(ProductLoadingState());
  final result = await ProductsVM(Dio()).get();//result maby product or fuilur
  result.fold((fuilur) =>{
    emit(ProductErrorState(errorMessage:fuilur.errorMessage))
  }, 
  (products) =>{
    if(products.isEmpty){
      emit(ProductState())
    }else{
      emit(ProductLoadedState(products:products))
    }

  }
  );
  
  }
}
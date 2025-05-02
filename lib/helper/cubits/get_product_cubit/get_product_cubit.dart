
import 'package:celus_fe/core/models/product.dart';
import 'package:celus_fe/core/view_model/productsVM.dart';
import 'package:celus_fe/helper/cubits/get_product_cubit/get_product_state.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState>{
  ProductCubit():super(ProductInitialState());
  final List<Product> _list=[];
  int page =1;
  void gerProducts({ bool fromLoading=false})async{
    if(fromLoading){
      emit(GetProductFromPaginationLoading());
    }
    else{
        emit(ProductLoadingState());
    }
  final result = await ProductsVM(Dio()).get(pageNumber:page);//result maby product or fuilur
  if(result == [])
  {
    print(result);
  }
  result.fold((fuilur) =>{
    emit(ProductErrorState(errorMessage:fuilur.errorMessage))
  }, 
  (products) =>{
    
    if(products.isEmpty){
      emit(ProductState())
    }
    else{
        page++,
      _list.addAll(products),
      emit(ProductLoadedState(products:_list))
    }

  }
  );
  
  }
}
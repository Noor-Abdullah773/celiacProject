
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
      emit(GetProductFromPaginationLoading()); // التي تظهر اسفل
    }
    else{
        emit(ProductLoadingState());
    }
  final result = await ProductsVM(Dio()).get(pageNumber:page);//result maby product or fuilur
  result.fold((fuilur) async =>{
    if(page !=1)
    emit(ProductErrorPaginationState(errorMessage: fuilur.errorMessage)),
    // emit(ProductErrorState(errorMessage:fuilur.errorMessage)),
    await Future.delayed(Duration(seconds: 2)),
    emit(ProductInitialState()),
    // page = 1,
  }, 
  (products) =>{
    if(products.isEmpty){
      emit(ProductState())
    }
    else{
        page++,
      _list.addAll(products),
      print('product Loaded'),
      emit(ProductLoadedState(products:_list))
    }

  }
  );
  
  }
}
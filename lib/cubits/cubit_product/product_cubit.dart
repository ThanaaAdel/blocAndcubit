import 'package:chnangebetweenblocandcubit/models/products_model.dart';
import 'package:chnangebetweenblocandcubit/reporistory/repo_product.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductLoading()){
    getProducts();
  }
  ProductRepo productRepo = ProductRepo() ;
  getProducts() async{
    try{
    final products =   await productRepo.fetchProducts();
    emit(ProductLoaded(products));
    }
    catch(e){
     emit( ProductError(e.toString()));
    }
  }
}

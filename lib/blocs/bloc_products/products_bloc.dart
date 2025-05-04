import 'package:chnangebetweenblocandcubit/models/products_model.dart';
import 'package:chnangebetweenblocandcubit/reporistory/repo_product.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'products_event.dart';
part 'products_state.dart';

class ProductsBloc extends HydratedBloc<ProductsEvent, ProductState> {
  ProductRepo productRepo = ProductRepo();

  ProductsBloc() : super(ProductLoading()) {
    on<FetchData>((event, emit) async {

      try {
          final products = await productRepo.fetchProducts();
          emit(ProductLoaded(products));
          print("the data $products");
      }
      catch (e) {
        emit(ProductError(e.toString()));
      }
    });
  }

  @override
  Map<String, dynamic> toJson(ProductState state) {
    if (state is ProductLoaded) {
      print('Saving products to storage...');
      return {
        'productList': state.products.map((e) => e.toJson()).toList(),
      };
    }
    return {};
  }

  @override
  ProductState? fromJson(Map<String, dynamic> json) {
    try {
      print('Restoring products from storage...');
      final productsJson = json['productList'] as List<dynamic>;
      final products = productsJson
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return ProductLoaded(products);
    } catch (e, s) {
      print('Error reading from storage: $e');
      return null;
    }
  }

}
part of 'product_cubit.dart';

@immutable
sealed class ProductState extends Equatable{}

final class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];

}
final class ProductLoaded extends ProductState {
  List<ProductModel> products;
  ProductLoaded(this.products);
  @override
  List<Object?> get props => [products];
}
final class ProductError extends ProductState {
  final String errorMessage;
  ProductError(this.errorMessage);
  @override
  List<Object?> get props => [errorMessage];
}

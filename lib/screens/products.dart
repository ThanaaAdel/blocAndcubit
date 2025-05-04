import 'package:cached_network_image/cached_network_image.dart';
import 'package:chnangebetweenblocandcubit/screens/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/bloc_products/products_bloc.dart';

class ProductStoreScreen extends StatefulWidget {
  const ProductStoreScreen({super.key});

  @override
  State<ProductStoreScreen> createState() => _ProductStoreScreenState();
}

class _ProductStoreScreenState extends State<ProductStoreScreen> {
  @override
  void initState() {
    final bloc = context.read<ProductsBloc>();
    if (bloc.state is! ProductLoaded) {
      bloc.add(FetchData());
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var cubit = context.read<ProductsBloc>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('المتجر'),
        centerTitle: true,
      ),
      body: BlocBuilder<ProductsBloc, ProductState>(
        builder: (context, state) {
          switch (state) {
            case ProductLoading():
              return const Center(child: CircularProgressIndicator());
            case ProductLoaded():
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: state.products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // 2 items per row
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    childAspectRatio: 0.7,
                  ),
                  itemBuilder: (context, index) {
                    final product = state.products[index];
                    return GestureDetector(
                      onTap: () {


                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProductDetailScreen(
                                product: product,
                              ),
                            ),
                          );
                        },

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 4,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Expanded(
                              child: ClipRRect(
                                borderRadius: const BorderRadius.vertical(
                                    top: Radius.circular(15)),
                                child:
                                CachedNetworkImage(
                                  imageUrl: product.image ?? "",
                                  placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product.title ?? "",
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 4),
                                  Text('${product.price} ر.س'),
                                  const SizedBox(height: 8),
                                  ElevatedButton(
                                    onPressed: () {
                                      // إضافة المنتج إلى السلة
                                    },
                                    child: const Text('أضف إلى السلة'),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            case ProductError():
              return Center(
                child: Text(state.errorMessage),
              );
          }
        },
      ),
    );
  }
}

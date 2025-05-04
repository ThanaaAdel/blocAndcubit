import 'package:chnangebetweenblocandcubit/blocs/bloc_products/products_bloc.dart';
import 'package:chnangebetweenblocandcubit/screens/products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  HydratedBloc.storage = storage;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      home: BlocProvider(
          create: (context) => ProductsBloc(),
          child: const ProductStoreScreen()),
      debugShowCheckedModeBanner: false,
    );
  }
}




import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/widgets/custom_app_bar.dart';
import 'bloc/product_bloc.dart';
import 'view/product_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({
    super.key,
    required this.category,
  });

  final String category;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ProductBloc()..add(ProductFetchEvent(category: category)),
      child: Scaffold(
        appBar: CustomAppBar(
          title: category.toUpperCase(),
        ),
        body: const Padding(
          padding: EdgeInsets.all(20.0),
          child: ProductView(),
        ),
      ),
    );
  }
}

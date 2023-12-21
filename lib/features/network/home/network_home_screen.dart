import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/widgets/custom_app_bar.dart';
import '../products/product_screen.dart';
import 'bloc/categories_bloc.dart';
import 'view/categories_view.dart';
import 'widgets/categories_card.dart';

class NetworkHomeScreen extends StatelessWidget {
  const NetworkHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CategoriesBloc>(
      create: (_) => CategoriesBloc()..add(const CategoriesFetchEvent()),
      child: Scaffold(
        appBar: const CustomAppBar(title: 'Network'),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SizedBox(
                height: 100,
                child: CategoryCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProductScreen(
                          category: 'All',
                        ),
                      ),
                    );
                  },
                  categoryName: "All",
                ),
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: CategoriesView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

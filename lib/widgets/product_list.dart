import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';
import 'package:shop_app/widgets/header.dart';
import 'package:shop_app/widgets/product_card.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  final List<String> filters = const ["All", "Adidas", "Nike", "Bata"];
  late String selectedFilter;

  @override
  void initState() {
    super.initState();
    selectedFilter = filters[0];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MyHeader(),
        SizedBox(
          height: 80,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: filters.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedFilter = filters[index];
                    });
                  },
                  child: Chip(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                      color: Color.fromRGBO(245, 247, 249, 1),
                    ),
                    backgroundColor: selectedFilter == filters[index]
                        ? Theme.of(context).primaryColor
                        : const Color.fromRGBO(245, 247, 249, 1),
                    label: Text(
                      filters[index],
                    ),
                    labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: selectedFilter == filters[index]
                            ? FontWeight.bold
                            : FontWeight.normal),
                  ),
                ),
              );
            },
          ),
        ),
        Expanded(
            child: ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 14,
                vertical: 4,
              ),
              child: ProductCard(
                id: int.parse(products[index]['id'].toString()),
                title: products[index]['title'].toString(),
                price: double.parse(products[index]['price'].toString()),
                imageUrl: products[index]['imageUrl'].toString(),
                sizes: products[index]['sizes'] as List<int>,
              ),
            );
          },
        ))
      ],
    );
  }
}

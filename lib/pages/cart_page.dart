import 'package:flutter/material.dart';
import 'package:shop_app/global_variables.dart';

class MyCart extends StatelessWidget {
  const MyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "My cart",
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: Colors.transparent,
        ),
        body: ListView.builder(
          itemCount: cart.length,
          itemBuilder: (context, index) {
            final cartItem = cart[index];
            return Card(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
              elevation: 1,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Container(
                padding: const EdgeInsets.all(4),
                color: Colors.white,
                child: ListTile(
                  leading: Image.network(
                    cartItem['imageUrl'].toString(),
                    height: 80,
                    width: 80,
                    fit: BoxFit.contain,
                  ),
                  title: Text(
                    cartItem['title'] as String,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text("size : ${cartItem['size']}"),
                  trailing: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

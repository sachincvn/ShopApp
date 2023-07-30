import 'package:flutter/material.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  final String title;
  final String imageUrl;
  final double price;
  final List<int> sizes;
  const ProductDetails({
    super.key,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.sizes,
    required this.id,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int selectedSize = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Details"),
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                widget.title,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
            const Spacer(),
            Hero(
                tag: widget.id,
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Image.network(widget.imageUrl))),
            const Spacer(),
            Container(
              height: 250,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: const Color.fromRGBO(245, 247, 249, 1),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "\$${widget.price}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(
                    height: 80,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.sizes.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = widget.sizes[index];
                              });
                            },
                            child: Chip(
                              backgroundColor:
                                  selectedSize == widget.sizes[index]
                                      ? Theme.of(context).primaryColor
                                      : const Color.fromRGBO(245, 247, 249, 1),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              label: Text(
                                widget.sizes[index].toString(),
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        "Add to card",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

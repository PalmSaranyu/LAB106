import 'package:flutter/material.dart';
import 'package:palm/Widget/product_listing_widget.dart';

class ProductListingScreen extends StatefulWidget {
  const ProductListingScreen({Key? key}) : super(key: key);

  @override
  State<ProductListingScreen> createState() => _ProductListingScreenState();
}

class _ProductListingScreenState extends State<ProductListingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Product Listing'),
        centerTitle: true,
      ),
      body: const ProductListingWidget(),
    );
  }
}

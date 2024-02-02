import 'package:flutter/material.dart';
import 'package:palm/Widget/product_detail_widget.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({Key? key, required this.productId})
      : super(key: key);

  final String productId;

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Text('Product Detail'),
        centerTitle: true,
      ),
      body: ProductDetailWidget(productId: widget.productId),
    );
  }
}

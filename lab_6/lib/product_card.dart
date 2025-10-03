import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget{
  final String productName;
  final double price;
  const ProductCard({super.key, required this.productName, required this.price}) ;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Text(productName),
        subtitle: Text('\$$price'),
      ),
    );
  }

}
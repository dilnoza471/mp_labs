import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  const Product({
    super.key,
    required this.productName,
    required this.desc,
    required this.price,
  });
  final String productName;
  final String desc;
  final double price;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 100,
            width: 100,
            child: Image(image: NetworkImage("../public/im1.jpg")),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                    productName,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    desc,
                    style: Theme.of(
                      context,
                    ).textTheme.bodyMedium?.copyWith(color: Colors.grey[700]),
                  ),
                  Text(
                    "\$$price",
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.green[700],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

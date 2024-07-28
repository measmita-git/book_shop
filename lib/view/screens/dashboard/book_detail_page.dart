import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';


class BookDetailPage extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;
  final double price;

  BookDetailPage({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          elevation: 5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(imagePath, height: 300, fit: BoxFit.cover),
                ),
                SizedBox(height: 16),
                Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('\$${price.toString()}', style: TextStyle(fontSize: 20, color: Colors.grey[700])),
                SizedBox(height: 16),
                ElevatedButton.icon(
                  onPressed: () {
                    cart.addItem(id, title, price);
                  },
                  icon: Icon(Icons.add_shopping_cart),
                  label: Text('Add to Cart'),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                    textStyle: TextStyle(fontSize: 16),
                  ),
                ),
                // Add more details here if needed
              ],
            ),
          ),
        ),
      ),
    );
  }
}


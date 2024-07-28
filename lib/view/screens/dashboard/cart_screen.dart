import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'cart_provider.dart';

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) => ListTile(
                title: Text(cart.items.values.toList()[i].title),
                subtitle: Text('Quantity: ${cart.items.values.toList()[i].quantity}'),
                trailing: Text('\$${cart.items.values.toList()[i].price * cart.items.values.toList()[i].quantity}'),
              ),
            ),
          ),
          Text('Total: \$${cart.totalAmount}'),
          ElevatedButton(
            child: Text('Checkout'),
            onPressed: () {
              // Implement checkout logic
            },
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../components/dt_button.dart';
import '../../../components/my_cart_tile.dart';
import '../../../model/book_store.dart';
import '../Payment/khalti_payment.dart';
import '../Payment/payment_screen.dart';


class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, bookstore, child) {
        // Check if the restaurant is null or its cart is not initialized
        if (bookstore == null) {
          return Scaffold(
            body: Center(child: Text('Restaurant not available')),
          );
        }

        final userCart = bookstore.cart ?? [];

        // Scaffold UI
        return Scaffold(
          appBar: AppBar(
            title: Text("Cart"),
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text("Are you sure you want to clear the cart?"),
                      actions: [
                        // Cancel button
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text("Cancel"),
                        ),
                        // Agree button
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                            bookstore.clearCart();
                          },
                          child: Text("Yes"),
                        ),
                      ],
                    ),
                  );
                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            children: [
              userCart.isEmpty
                  ? Center(child: Text("Cart is empty"))
                  : Expanded(
                child: ListView.builder(
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    // Debugging print statement
                    print('Cart item at index $index: $cartItem');

                    if (cartItem == null) {
                      return ListTile(
                        title: Text('Error: Cart item is null'),
                      );
                    }
                    return MyCartTile(cartItem: cartItem);
                  },
                ),
              ),

              MyButton(
                text: "Pay via khalti",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentViaKhalti()),
                  );
                },
              ),
              SizedBox(height: 15),
              MyButton(
                text: "Pay with Credit card",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PaymentPage()),
                  );
                },
              ),
              SizedBox(height: 25),
            ],
          ),
        );
      },
    );
  }
}

import 'package:book_bazaar/components/quantity_selector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/book_store.dart';
import '../model/cart_item.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({
    super.key,
    required this.cartItem,
  });

  @override
  Widget build(BuildContext context) {
    if (cartItem == null) {
      return ListTile(
        title: Text('Error: Cart item is null'),
      );
    }

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) =>
          Container(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Row(
              children: [
                // Food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    cartItem.book.imagePath,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 10),
                // Name, price, and quantity selector
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Food name
                      Text(
                        cartItem.book.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 4),
                      // Food price
                      Text(
                        '\$${cartItem.book.price.toStringAsFixed(2)}',
                        style: TextStyle(
                          color: Colors.grey[600],
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      // Quantity selector
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.book,
                        onDecrement: () {
                          restaurant.removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          restaurant.addToCart(
                              cartItem.book, cartItem.selectedAddons);
                        },
                      ),
                    ],
                  ),
                ),
                // Add-ons display

              ],
            ),
          ),
    );
  }
}
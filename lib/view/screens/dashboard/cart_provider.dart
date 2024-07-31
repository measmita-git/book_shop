// // providers/cart_provider.dart
// import 'package:flutter/material.dart';
// import '../../../model/cart_item.dart';
//
//
//
// class CartProvider with ChangeNotifier {
//   Map<String, CartItem> _items = {};
//
//   Map<String, CartItem> get items {
//     return {..._items};
//   }
//
//   int get itemCount {
//     return _items.length;
//   }
//
//   double get totalAmount {
//     double total = 0.0;
//     _items.forEach((key, cartItem) {
//       total += cartItem.price * cartItem.quantity;
//     });
//     return total;
//   }
//
//   void addItem(String productId, String title, double price) {
//     if (_items.containsKey(productId)) {
//       // update quantity
//       _items.update(
//         productId,
//             (existingCartItem) => CartItem(
//           id: existingCartItem.id,
//           title: existingCartItem.title,
//           price: existingCartItem.price,
//           quantity: existingCartItem.quantity + 1,
//         ),
//       );
//     } else {
//       _items.putIfAbsent(
//         productId,
//             () => CartItem(
//           id: DateTime.now().toString(),
//           title: title,
//           price: price,
//           quantity: 1,
//         ),
//       );
//     }
//     notifyListeners();
//   }
//
//   void removeItem(String productId) {
//     _items.remove(productId);
//     notifyListeners();
//   }
//
//   void clearCart() {
//     _items = {};
//     notifyListeners();
//   }
// }

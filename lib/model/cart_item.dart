import 'book.dart';

class CartItem {
  final Book book;
  final List<Addon> selectedAddons;
  int quantity;

  CartItem({
    required this.book,
    required this.selectedAddons,
    this.quantity = 1,
  });

  double get totalPrice {
    // Calculate the total price including addons
    double addonsPrice = selectedAddons.fold(0, (sum, addon) => sum + addon.price);
    return (book.price + addonsPrice) * quantity;
  }
}

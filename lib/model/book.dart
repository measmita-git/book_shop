// Define the FoodCategory enum
enum BookCategory {
  fiction,
  romance,
  education,
  adventure,
  history,
}

// Define the Addon class
class Addon {
  final String name;
  final double price;

  Addon({
    required this.name,
    required this.price,
  });
}

// Define the Food class
class Book {
  final String name;
  final String description;
  final String imagePath;
  final double price;
  final BookCategory category;
  final List<Addon> availableAddons;

  Book({
    required this.name,
    required this.description,
    required this.imagePath,
    required this.price,
    required this.category,
    required this.availableAddons,
  });
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'book_card.dart';

class RecommendedBooksGrid extends StatelessWidget {
  final List<Map<String, dynamic>> books;

  RecommendedBooksGrid({required this.books});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: GridView.builder(
        physics: NeverScrollableScrollPhysics(), // Prevent grid scrolling
        shrinkWrap: true, // Make grid take only the necessary height
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // Number of columns
          crossAxisSpacing: 10.0, // Spacing between columns
          mainAxisSpacing: 10.0, // Spacing between rows
          childAspectRatio: 0.75, // Aspect ratio of each item
        ),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return BookCard(
            id: book['id'],
            title: book['title'],
            imagePath: book['imagePath'],
            price: book['price'],
          );
        },
      ),
    );
  }
}




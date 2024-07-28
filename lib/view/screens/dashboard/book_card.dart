import 'package:flutter/material.dart';

import 'book_detail_page.dart';


class BookCard extends StatelessWidget {
  final String id;
  final String title;
  final String imagePath;
  final double price;

  BookCard({
    required this.id,
    required this.title,
    required this.imagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => BookDetailPage(
              id: id,
              title: title,
              imagePath: imagePath,
              price: price,
            ),
          ),
        );
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imagePath, height: 150, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Text('\$${price.toString()}', style: TextStyle(fontSize: 14, color: Colors.grey[700])),
        ],
      ),
    );
  }
}



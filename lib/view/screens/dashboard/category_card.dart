import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;

  CategoryCard({required this.category});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      margin: EdgeInsets.all(8.0),
      color: Colors.grey[300],
      child: Center(
        child: Text(category, textAlign: TextAlign.center),
      ),
    );
  }
}
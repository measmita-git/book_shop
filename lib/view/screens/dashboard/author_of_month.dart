import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AuthorOfTheMonth extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blueAccent,
          ),
          SizedBox(height: 8.0),
          Text('Author Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text('Brief bio of the author goes here.', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}

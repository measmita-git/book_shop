// import 'package:flutter/cupertino.dart';
//
// import '../../../util/dt_assets.dart';
// import 'book_card.dart';
// import 'home_screen.dart';
//
// class TrendingBooksGrid extends StatelessWidget {
//   TrendingBooksGrid({super.key});
//
//   final List<String> trendingBooks = [
//     DTImages.b6,
//     DTImages.b17,
//     DTImages.b8,
//     DTImages.b9,
//     DTImages.b10,
//   ];
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: trendingBooks.map((imagePath) => BookCard(imagePath: imagePath)).toList(),
//       ),
//     );
//   }
// }
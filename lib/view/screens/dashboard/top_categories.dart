//
// import 'package:flutter/cupertino.dart';
//
// import '../../../util/dt_assets.dart';
// import 'book_card.dart';
// import 'category_card.dart';
// import 'home_screen.dart';
//
// class TopCategories extends StatelessWidget {
//
//   final List<String> topCategoriesBooks = [
//     DTImages.b16,
//     DTImages.b15,
//     DTImages.b8,
//     DTImages.b9,
//     DTImages.b10,
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 150,
//       child: ListView(
//         scrollDirection: Axis.horizontal,
//         children: topCategoriesBooks.map((imagePath) => BookCard(imagePath: imagePath)).toList(),
//       ),
//     );
//   }
// }
// import 'package:flutter/material.dart';
// import '../../../../model/product.dart';
// import 'product_cart.dart';
// import 'search_bar.dart';
// import '../../../../model/category.dart';
// import 'home_app_bar.dart';
// import 'image_slider.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int currentSlider = 0;
//   int selectedIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     List<List<Product>> selectcategories = [
//       all,
//       fiction,
//       novel,
//     ];
//
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const SizedBox(height: 35),
//               // Custom app bar
//               const CustomAppBar(),
//               const SizedBox(height: 16),
//               // Search bar
//               const MySearchBAR(),
//               const SizedBox(height: 16),
//               // Image slider with page indicator
//               Stack(
//                 children: [
//                   ImageSlider(
//                     currentSlide: currentSlider,
//                     onChange: (value) {
//                       setState(() {
//                         currentSlider = value;
//                       });
//                     },
//                   ),
//                   Positioned(
//                     bottom: 10,
//                     left: 0,
//                     right: 0,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: List.generate(
//                         3, // Number of slides
//                             (index) => Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 4),
//                           width: 8,
//                           height: 8,
//                           decoration: BoxDecoration(
//                             color: currentSlider == index
//                                 ? Colors.blue
//                                 : Colors.grey,
//                             shape: BoxShape.circle,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 16),
//               // Category selection
//               categoryItems(),
//               const SizedBox(height: 16),
//               // Special for you header
//               if (selectedIndex == 0)
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       "Special For You",
//                       style: Theme.of(context).textTheme.headline6?.copyWith(
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     Text(
//                       "See all",
//                       style: TextStyle(
//                         fontWeight: FontWeight.w500,
//                         fontSize: 16,
//                         color: Colors.blue,
//                       ),
//                     ),
//                   ],
//                 ),
//               const SizedBox(height: 16),
//               // Shopping items
//               GridView.builder(
//                 padding: EdgeInsets.zero,
//                 physics: const NeverScrollableScrollPhysics(),
//                 shrinkWrap: true,
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   childAspectRatio: 0.7,
//                   crossAxisSpacing: 16,
//                   mainAxisSpacing: 16,
//                 ),
//                 itemCount: selectcategories[selectedIndex].length,
//                 itemBuilder: (context, index) {
//                   return ProductCard(
//                     product: selectcategories[selectedIndex][index],
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget categoryItems() {
//     return SizedBox(
//       height: 120,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categoriesList.length,
//         physics: const BouncingScrollPhysics(),
//         itemBuilder: (context, index) {
//           return GestureDetector(
//             onTap: () {
//               setState(() {
//                 selectedIndex = index;
//               });
//             },
//             child: Container(
//               margin: const EdgeInsets.symmetric(horizontal: 8),
//               padding: const EdgeInsets.all(10),
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//                 color: selectedIndex == index
//                     ? Colors.blue[100]
//                     : Colors.grey[200],
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.grey.withOpacity(0.3),
//                     spreadRadius: 2,
//                     blurRadius: 4,
//                     offset: Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     height: 65,
//                     width: 65,
//                     decoration: BoxDecoration(
//                       shape: BoxShape.circle,
//                       image: DecorationImage(
//                         image: AssetImage(categoriesList[index].image),
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Text(
//                     categoriesList[index].title,
//                     style: TextStyle(
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold,
//                       color: selectedIndex == index
//                           ? Colors.blue
//                           : Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:book_bazaar/view/screens/dashboard/book_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../components/current_location.dart';
import '../../../../components/drawer.dart';
import '../../../../components/dt_description_box.dart';
import '../../../../components/dt_sliver_app_bar.dart';
import '../../../../components/food_tile.dart';
import '../../../../components/tab_bar.dart';
import '../../../../model/book.dart';
import '../../../../model/book_store.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: BookCategory.values.length, vsync: this); // Adjust length as needed
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  // Filter menu by category and return a list of widgets
  List<Widget> getFoodInThisCategory(List<Book> menu) {
    final Map<BookCategory, List<Book>> categorizedFoods = {};

    // Categorize foods
    for (var food in menu) {
      if (!categorizedFoods.containsKey(food.category)) {
        categorizedFoods[food.category] = [];
      }
      categorizedFoods[food.category]!.add(food);
    }

    // Create widgets for each category
    return BookCategory.values.map((category) {
      final categoryMenu = categorizedFoods[category] ?? [];
      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
            food: food,
            onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> FoodPage(food: food))),
          );
        },
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      drawer: const MyDrawer(),
      body: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          MySliverAppBar(
            title: MyTabBar(tabController: _tabController),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(
                  indent: 25,
                  endIndent: 25,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                // Switch
               MyCurrentLocation(),
                // Description box
                const DescriptionBox(),
              ],
            ),
          ),
        ],
        body: Consumer<Restaurant>(
          builder: (context, restaurant, child) => TabBarView(
            controller: _tabController,
            children: getFoodInThisCategory(restaurant.menu),
          ),
        ),
      ),
    );
  }
}

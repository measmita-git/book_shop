import 'package:flutter/material.dart';
import '../model/book.dart';

class FoodTile extends StatelessWidget {
  final Book food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            children: [
              // Food image
             
              const SizedBox(width: 10), // Spacing between image and text
              // Food details
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      food.name,
                      style: Theme.of(context).textTheme.headline6, // Adjust text style as needed
                    ),
                    Text(
                      '\$${food.price.toStringAsFixed(2)}', // Format price to 2 decimal places
                      style: Theme.of(context).textTheme.subtitle1, // Adjust text style as needed
                    ),
                    Text(
                      food.description,
                      maxLines: 2, // Limit description to 2 lines
                      overflow: TextOverflow.ellipsis, // Add ellipsis if description is too long
                      style: Theme.of(context).textTheme.bodyText2, // Adjust text style as needed
                    ),
                  ],
                ),
              ),

              const SizedBox(width: 15,),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  food.imagePath,
                 
                  height: 100, 
                 
                ),
              ),
            ],
          ),
        ),
        Divider(color: Theme.of(context).colorScheme.tertiary),
      ],
    );
  }
}

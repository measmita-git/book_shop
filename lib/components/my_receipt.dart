import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/book_store.dart';

class MyReceipt extends StatelessWidget {
  const MyReceipt({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Thank you for your order!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 25),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Theme.of(context).colorScheme.secondary),
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: const EdgeInsets.all(25),
                child: Consumer<Restaurant>(
                  builder:(context, restaurant,child) =>
                      Text(restaurant.displayCartReceipt()),
                )
              ),
              SizedBox(height: 25,),
              DeliveryTimeWidget(), //time now + 10 hours
            ],
          ),
        ),
      );

  }
}




class DeliveryTimeWidget extends StatelessWidget {
  const DeliveryTimeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get the current time
    final now = DateTime.now();

    // Add 10 hours to the current time
    final estimatedDeliveryTime = now.add(const Duration(hours: 10));

    // Format the time to a readable string
    final formattedTime = _formatTime(estimatedDeliveryTime);

    return Text(
      'Estimated delivery time is: $formattedTime',
      style: TextStyle(fontSize: 16),
    );
  }

  // Helper method to format DateTime into a readable string
  String _formatTime(DateTime dateTime) {
    return '${_twoDigits(dateTime.hour)}:${_twoDigits(dateTime.minute)} ${dateTime.hour >= 12 ? 'PM' : 'AM'}';
  }

  // Helper method to ensure two-digit format
  String _twoDigits(int number) {
    return number.toString().padLeft(2, '0');
  }
}

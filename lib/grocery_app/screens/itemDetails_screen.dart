import 'package:flutter/material.dart';
import '../models/item.dart';

class ItemDetailsScreen extends StatelessWidget {
  final Item item;

  ItemDetailsScreen({required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name, style: const TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 187, 57, 243),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 80.0),
        child: Card(
          color: const Color.fromARGB(255, 187, 57, 243),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(item.imageUrl, height: 300),
                const SizedBox(height: 16),
                Text(
                  item.name,
                  style:  const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${item.price.toStringAsFixed(2)}",
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
                const SizedBox(height: 16),
                const Text(
                  "Description",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "This is a very fresh item. Buy it now!",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
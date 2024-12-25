import 'package:flutter/material.dart';
import 'cart_screen.dart';
import '../models/item.dart';
import '../providers/cart_provider.dart';
import 'package:provider/provider.dart';

class ItemListScreen extends StatelessWidget {
  final List<Item> items = [
    Item(name: "Avocado", price: 4.00, imageUrl: 'lib/assets/avocado.png'),
    Item(name: "Eggs", price: 3.30, imageUrl: 'lib/assets/egg.png'),
    Item(name: "Milk", price: 7.99, imageUrl: 'lib/assets/milk.png'),
    Item(name: "Kiwi", price: 8.99, imageUrl: 'lib/assets/kiwi.png'),
    Item(name: "Banana", price: 7.50, imageUrl: 'lib/assets/banana.png'),
    Item(name: "Fruit", price: 10.50, imageUrl: 'lib/assets/cherry.png'),
    Item(name: "Blueberry", price: 11.50, imageUrl: 'lib/assets/blue.png'),
    Item(name: "Bread", price: 4.99, imageUrl: 'lib/assets/bread.png'),
    Item(name: "Chicken", price: 15.60, imageUrl: 'lib/assets/chicken.png'),
    Item(name: "Fruit", price: 11.99, imageUrl: 'lib/assets/fruit.png'),
    Item(name: "Ketchup", price: 6.50, imageUrl: 'lib/assets/ketchup.png'),
    Item(name: "Cucumber", price: 3.55, imageUrl: 'lib/assets/cucumber.png'),
    Item(name: "Strawberry", price: 10.99, imageUrl: 'lib/assets/strawberry.png'),
    Item(name: "Vegetable", price: 4.50, imageUrl: 'lib/assets/veg.png'),
    Item(name: "Brocoli", price: 4.99, imageUrl: 'lib/assets/brocoli.png'),
    Item(name: "Yogurt", price: 2.50, imageUrl: 'lib/assets/yogurt.png'),
    Item(name: "Oil", price: 6.25, imageUrl: 'lib/assets/oil.png'),
    Item(name: "Mayo", price: 7.50, imageUrl: 'lib/assets/mayo.png'),
  ];
  ItemListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fresh Items", style: TextStyle(color: Colors.white)),
        backgroundColor:  const Color.fromARGB(255, 187, 57, 243),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 3 / 4,
        ),
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return Card(
            color: const Color.fromARGB(255, 187, 57, 243),
            elevation: 5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(item.imageUrl, height: 80),
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                Text("\$${item.price.toStringAsFixed(2)}", style: const TextStyle(color: Colors.white)),
                ElevatedButton(
                  onPressed: () {
                    Provider.of<CartProvider>(context, listen: false).addItem(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor:   Colors.green,
                        content: Text('${item.name} added to cart',
                        style: const TextStyle(
                        color: Colors.white),
                        ),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child:  const Text("Add to Cart", style: TextStyle(color: Colors.black)),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        child: const Icon(Icons.shopping_cart, color: Colors.black),
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) =>  const CartScreen()));
        },
      ),
    );
  }
}
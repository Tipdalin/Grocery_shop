import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart_provider.dart';
import 'itemDetails_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 187, 57, 243),
      ),
      body: cartProvider.cartItems.isEmpty
          ? Container(
              color: const Color.fromARGB(255, 187, 57, 243),
              child: const Center(
                  child: Text(
                "Cart is Empty...",
                style: TextStyle(color: Colors.white),
              )),
            )
          : Container(
              color: const Color.fromARGB(255, 255, 255, 255),
              child: ListView.builder(
                itemCount: cartProvider.cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartProvider.cartItems[index];
                  return Card(
                    color: const Color.fromARGB(255, 171, 62, 244),
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.asset(item.imageUrl, width: 50),
                      title: Text(
                        item.name,
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        "\$${item.price.toStringAsFixed(2)}",
                        style: const TextStyle(color: Colors.white),
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete, color: Colors.white),
                        onPressed: () {
                          Provider.of<CartProvider>(context, listen: false)
                              .removeItem(item);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('${item.name} removed from cart'),
                              backgroundColor: Colors.red,
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ItemDetailsScreen(item: item),
                          ),
                        );
                      },
                    ),
                  );
                },
              ),
            ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 187, 57, 243),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Total Price: \$${cartProvider.totalPrice.toStringAsFixed(2)}",
              style: const TextStyle(
                  color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              onPressed: () {
                if (cartProvider.cartItems.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Cart is empty'),
                      backgroundColor: Colors.red,
                      duration: Duration(seconds: 1),
                    ),
                  );
                } else {
            // Handle payment logic
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                backgroundColor: Colors.green,
                content:  Text(
                  'Payment successful',
                  style: TextStyle(color: Colors.white),
                ),
                duration:  Duration(seconds: 1),
              ),
            );
          }
              },
              child: const Text("Pay Now"),
            ),
          ],
        ),
      ),
    );
  }
}
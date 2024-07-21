import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_model.dart';
import 'cart_model.dart';

class ProductDetailsPage extends StatelessWidget {
  final Product product;

  ProductDetailsPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Image.asset(product.imageUrl, height: 200),
                ),
                SizedBox(height: 16),
                Text('Brand Name: ${product.name}',
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Text('Category: ${product.category}',
                    style: TextStyle(fontSize: 16)),
                Text('Price: ₱${product.price}',
                    style: TextStyle(fontSize: 16, color: Colors.green)),
                Text('Available Stocks: ${product.stock}',
                    style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Description:',
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text(product.description, style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<Cart>(context, listen: false).addProduct(
                          product, 1); // Add product with a quantity of 1
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Added to favorites!'),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueGrey,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Text('Add to favorites'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

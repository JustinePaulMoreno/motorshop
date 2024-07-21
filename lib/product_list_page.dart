import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'product_details_page.dart';
import 'product_model.dart';
import 'cart_model.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final List<Product> products = [
    Product(
      name: 'Tire 101 110/70/17',
      category: 'Tires',
      price: 4500.00,
      stock: 48,
      imageUrl: 'assets/tire.jpg',
      description: 'High-quality tire for motorcycles.',
    ),
    Product(
      name: 'Chain Lubricant',
      category: 'Lubricants',
      price: 350.00,
      stock: 120,
      imageUrl: 'assets/lubricant.jpg',
      description: 'Keep your chain running smoothly with this lubricant.',
    ),
    Product(
      name: 'Brake Pads',
      category: 'Brakes',
      price: 1500.00,
      stock: 60,
      imageUrl: 'assets/brake_pads.jpg',
      description: 'Reliable brake pads for enhanced safety.',
    ),
    Product(
      name: 'Engine Oil',
      category: 'Oil',
      price: 1200.00,
      stock: 200,
      imageUrl: 'assets/engine_oil.jpg',
      description: 'Premium engine oil for optimal performance.',
    ),
    Product(
      name: 'Spark Plug',
      category: 'Engine Parts',
      price: 300.00,
      stock: 150,
      imageUrl: 'assets/spark_plug.jpg',
      description: 'Efficient spark plugs for better ignition.',
    ),
    Product(
      name: 'Helmet',
      category: 'Safety',
      price: 2500.00,
      stock: 30,
      imageUrl: 'assets/helmet.jpg',
      description: 'Protective helmet for safe riding.',
    ),
    Product(
      name: 'Gloves',
      category: 'Apparel',
      price: 600.00,
      stock: 100,
      imageUrl: 'assets/gloves.jpg',
      description: 'Comfortable and durable riding gloves.',
    ),
    Product(
      name: 'Jacket',
      category: 'Apparel',
      price: 3500.00,
      stock: 50,
      imageUrl: 'assets/jacket.jpg',
      description: 'Stylish and protective riding jacket.',
    ),
    Product(
      name: 'Brake Fluid',
      category: 'Fluids',
      price: 400.00,
      stock: 80,
      imageUrl: 'assets/brake_fluid.jpg',
      description: 'High-performance brake fluid.',
    ),
    Product(
      name: 'Air Filter',
      category: 'Filters',
      price: 800.00,
      stock: 70,
      imageUrl: 'assets/air_filter.jpg',
      description: 'Keep your engine clean with this air filter.',
    ),
    Product(
      name: 'Oil Filter',
      category: 'Filters',
      price: 500.00,
      stock: 90,
      imageUrl: 'assets/oil_filter.jpg',
      description: 'Efficient oil filter for your engine.',
    ),
    Product(
      name: 'Chain Cleaner',
      category: 'Cleaners',
      price: 450.00,
      stock: 110,
      imageUrl: 'assets/chain_cleaner.jpg',
      description: 'Clean your chain effectively with this cleaner.',
    ),
    Product(
      name: 'Fuel Additive',
      category: 'Additives',
      price: 250.00,
      stock: 130,
      imageUrl: 'assets/fuel_additive.jpg',
      description: 'Enhance your fuel performance.',
    ),
    Product(
      name: 'Tool Kit',
      category: 'Tools',
      price: 1200.00,
      stock: 40,
      imageUrl: 'assets/tool_kit.jpg',
      description: 'Complete tool kit for your bike maintenance.',
    ),
    Product(
      name: 'Windshield',
      category: 'Accessories',
      price: 1800.00,
      stock: 25,
      imageUrl: 'assets/windshield.jpg',
      description: 'Durable windshield for better aerodynamics.',
    ),
  ];

  String searchQuery = '';

  @override
  Widget build(BuildContext context) {
    List<Product> filteredProducts = products.where((product) {
      return product.name.toLowerCase().contains(searchQuery.toLowerCase()) ||
          product.category.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
        backgroundColor: Colors.blueGrey,
        actions: [
          IconButton(
            icon: Icon(Icons.thumb_up),
            onPressed: () {
              Navigator.pushNamed(context, '/cart');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredProducts.length,
              itemBuilder: (context, index) {
                final product = filteredProducts[index];
                return Card(
                  margin: const EdgeInsets.all(10.0),
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: ListTile(
                    leading: Image.asset(product.imageUrl, width: 50),
                    title: Text(product.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product.category),
                        Text('₱${product.price.toStringAsFixed(2)}'),
                      ],
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.library_add),
                      onPressed: () {
                        Provider.of<Cart>(context, listen: false)
                            .addProduct(product, 1);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${product.name} added to cart'),
                          ),
                        );
                      },
                    ),
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/product-details',
                        arguments: product,
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

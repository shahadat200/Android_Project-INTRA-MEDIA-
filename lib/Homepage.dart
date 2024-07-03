import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:aust_intra_media/ProductDetailsPage.dart';
import 'package:aust_intra_media/Product.dart';
import 'package:aust_intra_media/Homepage.dart';
import 'package:aust_intra_media/BuyPage.dart';
import 'package:aust_intra_media/SellPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
/*class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _addProduct(Product product) {
    setState(() {
      _products.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sell & Buy App',
          style: TextStyle(
              color: Colors.white, // Set text color to white
              fontSize:20,
              fontStyle:FontStyle.italic
          ),
        ),
        backgroundColor: Colors.indigo[900], // Set background color to blue
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Sell'),
            Tab(text: 'Buy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SellPage(addProduct: _addProduct),
          BuyPage(products: _products),
        ],
      ),
    );
  }
}*/
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late Stream<List<Product>> _productsStream;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _fetchProducts();
  }

  void _fetchProducts() {
    _productsStream = FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Product(
      name: doc['name'],
      description: doc['description'],
      price: doc['price'].toDouble(),
      sellerName: doc['sellerName'],
      sellerContact: doc['sellerContact'],
      // image: File(doc['image']), // Assuming 'image' is stored as a file path in Firestore
    ))
        .toList());
  }

  void _addProduct(Product product) {
    FirebaseFirestore.instance.collection('products').add({
      'name': product.name,
      'description': product.description,
      'price': product.price,
      'sellerName': product.sellerName,
      'sellerContact': product.sellerContact,
      'image': product.image != null ? product.image!.path : null, // Store file path if image exists
    }).then((value) {
      // Successfully added product to Firestore
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added successfully!')),
      );
    }).catchError((error) {
      // Handle error adding product
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add product: $error')),
      );
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Sell & Buy Your Product',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontStyle: FontStyle.italic,
          ),
        ),
        backgroundColor: Colors.indigo[900],
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(text: 'Sell'),
            Tab(text: 'Buy'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          SellPage(addProduct: _addProduct),
          StreamBuilder<List<Product>>(
            stream: _productsStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No products available'));
              } else {
                return BuyPage(products: snapshot.data!);
              }
            },
          ),
        ],
      ),
    );
  }
}


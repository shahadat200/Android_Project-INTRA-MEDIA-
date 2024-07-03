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

/*class SellPage extends StatefulWidget {
  final Function(Product) addProduct;

  SellPage({required this.addProduct});

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController=TextEditingController();
  final _sellerNameController = TextEditingController();
  final _sellerContactController = TextEditingController();
  File? _selectedImage;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _sellerNameController.dispose();
    _sellerContactController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final product = Product(
        name: _nameController.text,
        description: _descriptionController.text,
        price: double.parse(_priceController.text),
        sellerName: _sellerNameController.text,
        sellerContact: _sellerContactController.text,
        image: _selectedImage,
      );
      widget.addProduct(product);
      // Clear the form
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _sellerNameController.clear();
      _sellerContactController.clear();
      _selectedImage = null;
      // Show success message (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10.0),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price of  Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price of your product';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _sellerNameController,
                decoration: InputDecoration(labelText: 'Name of the Seller'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _locationController,
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the loaction of your product';
                  }

                  return null;
                },
              ),
              SizedBox(height:10
              ),
              TextFormField(
                controller: _sellerContactController,
                decoration: InputDecoration(labelText: 'Seller Contact'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller contact';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _getImage,

                child: Text('Upload Image of Product'
                ),

              ),
              SizedBox(height: 10.0),
              if (_selectedImage != null)
                Image.file(
                  _selectedImage!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _submitForm,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}*/
class SellPage extends StatefulWidget {
  final Function(Product) addProduct;

  SellPage({required this.addProduct});

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController();
  final _locationController=TextEditingController();
  final _sellerNameController = TextEditingController();
  final _sellerContactController = TextEditingController();
  File? _selectedImage;

  Future<void> _getImage() async {
    final picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _descriptionController.dispose();
    _priceController.dispose();
    _sellerNameController.dispose();
    _sellerContactController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      if (_formKey.currentState!.validate()) {
        final product = {
          'name': _nameController.text,
          'description': _descriptionController.text,
          'price': double.parse(_priceController.text),
          'sellerName': _sellerNameController.text,
          'sellerContact': _sellerContactController.text,
          'image': _selectedImage,
          // Assuming _selectedImage is a String or URL
          'timestamp': FieldValue.serverTimestamp(),
          // Add timestamp for sorting or other uses
        };
        /* widget.addProduct(product);
      // Clear the form
      _nameController.clear();
      _descriptionController.clear();
      _priceController.clear();
      _sellerNameController.clear();
      _sellerContactController.clear();
      _selectedImage = null;
      // Show success message (optional)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Product added!')),
      );
    }*/
        FirebaseFirestore.instance
            .collection('products')
            .add(product)
            .then((value) {
          // Clear the form after successful submission
          _nameController.clear();
          _descriptionController.clear();
          _priceController.clear();
          _sellerNameController.clear();
          _sellerContactController.clear();
          _selectedImage = null;

          // Show success message (optional)
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Product added!')),
          );
        })
            .catchError((error) {
          // Handle errors, e.g., show an error Snackbar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to add product: $error')),
          );
        });
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child:SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Product Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter product name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a description';
                  }
                  return null;
                },
              ),

              SizedBox(height: 10.0),
              TextFormField(
                controller: _priceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Price of  Product'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the price of your product';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Please enter a valid number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _sellerNameController,
                decoration: InputDecoration(labelText: 'Name of the Seller'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller name';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: _locationController,
                // keyboardType: TextInputType.text,
                decoration: InputDecoration(labelText: 'Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the loaction of your product';
                  }

                  return null;
                },
              ),
              SizedBox(height:10
              ),
              TextFormField(
                controller: _sellerContactController,
                decoration: InputDecoration(labelText: 'Seller Contact'),
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter seller contact';
                  }
                  return null;
                },
              ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _getImage,

                child: Text('Upload Image of Product'
                ),

              ),
              SizedBox(height: 10.0),
              if (_selectedImage != null)
                Image.file(
                  _selectedImage!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              SizedBox(height: 10.0),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, // background
                  foregroundColor: Colors.white, // foreground
                ),
                onPressed: _submitForm,
                child: Text('Add Product'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


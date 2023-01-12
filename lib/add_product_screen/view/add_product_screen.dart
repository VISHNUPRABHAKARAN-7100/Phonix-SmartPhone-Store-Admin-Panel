import 'dart:developer';
import 'dart:io';
import 'package:admin_panel_of_phonix/add_product_screen/controller/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

/// This screen is for adding the product.
/// Admin can add the products.

class AddProduct extends StatefulWidget {
  AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  // File? image;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 248, 250, 250),
        elevation: 0,
        iconTheme: const IconThemeData(),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * .03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                child: Column(
                  children: [
                    // Textformfield for the name of the product.
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Product Name',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for the actual price of the product.
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Actual Price',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for the price of the product.
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Discounted Price',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for the brand of the product.
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Brand',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for category of the product.
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Category',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for the remaining stock of the product.
                    TextFormField(
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(
                          color: Colors.black,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.black,
                          ),
                        ),
                        labelText: 'Remaining Stock',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    Consumer<AddProductProvider>(
                      builder: (context, addProductProviderValue, child) =>
                          Column(
                        children: [
                          IconButton(
                            onPressed: () async {
                              // try {
                              //   var image = await ImagePicker()
                              //       .pickImage(source: ImageSource.gallery);
                              //   if (image == null) return;
                              //   final imageTemp = File(image.path);
                              //   setState(() {
                              //     this.image = imageTemp;
                              //   });
                              // } on PlatformException catch (e) {
                              //   log('Failed to pick : $e.tostring');
                              // }
                              addProductProviderValue.addImage();
                            },
                            icon: const Icon(
                              Icons.add_a_photo,
                              size: 30,
                            ),
                          ),
                          Container(
                            height: 100,
                            width: size.width - 20,
                            color: Colors.amber,
                            child: addProductProviderValue != null
                                ? Image.file(
                                    addProductProviderValue.image!,
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  )
                                : const Text('No Image picked'),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

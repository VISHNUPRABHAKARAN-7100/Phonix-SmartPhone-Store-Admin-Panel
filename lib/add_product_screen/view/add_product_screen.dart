import 'dart:io';

import 'package:admin_panel_of_phonix/add_product_screen/controller/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

/// This screen is for adding the product.
/// Admin can add the products.

class AddProduct extends StatefulWidget {
  const AddProduct({super.key});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
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
        child: ListView(
          children: [
            Consumer<AddProductProvider>(
              builder: (context, addProductProviderValue, child) => Form(
                child: Column(
                  children: [
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for the name of the product.
                    TextFormField(
                      controller: addProductProviderValue
                          .productNameTextEditingController,
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
                    TextFormField(
                      controller: addProductProviderValue
                          .descriptionTextEditingController,
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
                        labelText: 'Description',
                        focusColor: Colors.black,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .02,
                    ),
                    // Textformfield for the actual price of the product.
                    TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller:
                          addProductProviderValue.mrpTextEditingController,
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller:
                          addProductProviderValue.priceTextEditingController,
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
                      controller:
                          addProductProviderValue.brandTextEditingController,
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
                      controller:
                          addProductProviderValue.categoryTextEditingController,
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
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      controller:
                          addProductProviderValue.stockTextEditingController,
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

                    Column(
                      children: [
                        IconButton(
                          onPressed: () async {
                            addProductProviderValue.addImage();
                          },
                          icon: const Icon(
                            Icons.add_a_photo,
                            size: 30,
                          ),
                        ),
                        addProductProviderValue.imageFileList!.isEmpty
                            ? const Center(
                                child: Text('No Image picked'),
                              )
                            : GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: addProductProviderValue
                                    .imageFileList!.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  mainAxisExtent: size.width / 2,
                                  mainAxisSpacing: size.width * 0.01,
                                  crossAxisSpacing: size.width * 0.01,
                                ),
                                itemBuilder: (BuildContext context, int index) {
                                  return Image.file(
                                    File(addProductProviderValue
                                        .imageFileList![index].path),
                                    fit: BoxFit.contain,
                                  );
                                }),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            addProductProviderValue.addProduct(
                              addProductProviderValue
                                  .productNameTextEditingController.text,
                              addProductProviderValue
                                  .descriptionTextEditingController.text,
                              int.parse(addProductProviderValue
                                  .priceTextEditingController.text),
                              int.parse(addProductProviderValue
                                  .mrpTextEditingController.text),
                              addProductProviderValue
                                  .brandTextEditingController.text,
                              addProductProviderValue
                                  .categoryTextEditingController.text,
                              int.parse(addProductProviderValue
                                  .stockTextEditingController.text),
                                  addProductProviderValue.imageFileList!.toList()
                            );
                          },
                          child: const Text('Add Product'),
                        )
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}



// final product=     Product(
//                                 productname: addProductProviderValue.productNameTextEditingController.text,
//                                 price: int.parse(addProductProviderValue.priceTextEditingController.text),
//                                 mrp: int.parse(addProductProviderValue.mrpTextEditingController.text),
//                                 stock: int.parse(addProductProviderValue.stockTextEditingController.text),
//                                 brand: addProductProviderValue.brandTextEditingController.text,
//                                 category: addProductProviderValue.categoryTextEditingController.text,
//                                 description: addProductProviderValue.descriptionTextEditingController.text,
//                                 image: addProductProviderValue.imageFileList,);
// )
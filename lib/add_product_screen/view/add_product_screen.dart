import 'package:admin_panel_of_phonix/add_product_screen/controller/add_product_provider.dart';
import 'package:admin_panel_of_phonix/utils/constant_colors.dart';
import 'package:admin_panel_of_phonix/utils/constant_sized_boxs.dart';
import 'package:admin_panel_of_phonix/widgets/custom_textform_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import '../model/product_model.dart';

/// This screen is for adding the product.
/// Admin can add the products.

class AddProduct extends StatelessWidget {
  AddProduct({super.key});
  final formKeyForAddProduct = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
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
                    const ConstSizedBox(),
                    // Textformfield for the name of the product.
                    CustomTextFormField(
                      textEditingController: addProductProviderValue
                          .productNameTextEditingController,
                      labelText: 'Product Name',
                      ontap: () {
                        if (addProductProviderValue
                            .productNameTextEditingController.text.isEmpty) {
                          return "Product Name required";
                        } else if (addProductProviderValue
                                .productNameTextEditingController.text.length <
                            5) {
                          return "Product Name should be at least 5 characters";
                        }
                        return null;
                      },
                    ),
                    const ConstSizedBox(),

                    CustomTextFormField(
                      textEditingController: addProductProviderValue
                          .descriptionTextEditingController,
                      labelText: 'Description',
                      ontap: () {
                        if (addProductProviderValue
                            .descriptionTextEditingController.text.isEmpty) {
                          return "Product description required";
                        } else if (addProductProviderValue
                                .descriptionTextEditingController.text.length <
                            5) {
                          return "Product description must be at least 5 characters";
                        }
                        return null;
                      },
                    ),
                    const ConstSizedBox(),
                    // Textformfield for the actual price of the product.
                    CustomTextFormField(
                      textEditingController:
                          addProductProviderValue.mrpTextEditingController,
                      labelText: 'MRP price',
                      ontap: () {
                        if (addProductProviderValue
                            .mrpTextEditingController.text.isEmpty) {
                          return "MRP required";
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    const ConstSizedBox(),
                    // Textformfield for the price of the product.
                    CustomTextFormField(
                      textEditingController:
                          addProductProviderValue.priceTextEditingController,
                      labelText: 'Discounted Price',
                      keyboardType: TextInputType.number,
                      ontap: () {
                        if (addProductProviderValue
                            .priceTextEditingController.text.isEmpty) {
                          return "Discounted price required";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                    ),
                    const ConstSizedBox(),
                    // Textformfield for the brand of the product.
                    CustomTextFormField(
                      textEditingController:
                          addProductProviderValue.brandTextEditingController,
                      labelText: 'Brand',
                      ontap: () {
                        if (addProductProviderValue
                            .brandTextEditingController.text.isEmpty) {
                          return "Brand required";
                        }
                        return null;
                      },
                    ),
                    const ConstSizedBox(),
                    // Textformfield for category of the product.
                    CustomTextFormField(
                      textEditingController:
                          addProductProviderValue.categoryTextEditingController,
                      labelText: 'Category',
                      ontap: () {
                        if (addProductProviderValue
                            .categoryTextEditingController.text.isEmpty) {
                          return "Category required";
                        }
                        return null;
                      },
                    ),
                    const ConstSizedBox(),
                    // Textformfield for the remaining stock of the product.
                    CustomTextFormField(
                      textEditingController:
                          addProductProviderValue.stockTextEditingController,
                      labelText: 'Remaining Stock',
                      ontap: () {
                        if (addProductProviderValue
                            .stockTextEditingController.text.isEmpty) {
                          return "Remaining Stock required";
                        }
                        return null;
                      },
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      keyboardType: TextInputType.number,
                    ),
                    const ConstSizedBox(),
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
                                  return SizedBox();
                                  // return Image.file(
                                  //   File(
                                  //     addProductProviderValue
                                  //         .imageFileList![index].path,
                                  //   ),
                                  //   fit: BoxFit.contain,
                                  // );
                                },
                              ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            if (formKeyForAddProduct.currentState!.validate()) {
                              // final product = Product(
                              //   productname: addProductProviderValue
                              //       .productNameTextEditingController.text,
                              //   price: int.parse(addProductProviderValue
                              //       .priceTextEditingController.text),
                              //   mrp: int.parse(addProductProviderValue
                              //       .mrpTextEditingController.text),
                              //   stock: int.parse(addProductProviderValue
                              //       .stockTextEditingController.text),
                              //   brand: addProductProviderValue
                              //       .brandTextEditingController.text,
                              //   category: addProductProviderValue
                              //       .categoryTextEditingController.text,
                              //   description: addProductProviderValue
                              //       .descriptionTextEditingController.text,
                              //   image: addProductProviderValue.imageFileList,
                              // );
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
                                  addProductProviderValue.imageFileList!
                                      .toList());
                            }
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

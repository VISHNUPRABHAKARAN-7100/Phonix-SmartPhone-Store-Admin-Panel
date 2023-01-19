import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class AddProductProvider with ChangeNotifier {
  // TextformField variables
  final productNameTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final mrpTextEditingController = TextEditingController();
  final priceTextEditingController = TextEditingController();
  final brandTextEditingController = TextEditingController();
  final categoryTextEditingController = TextEditingController();
  final stockTextEditingController = TextEditingController();

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  // Function to add images to the product details.

  addImage() async {
    try {
      if (imageFileList == null) return;
      final List<XFile> selectedImages = await imagePicker.pickMultiImage();
      if (selectedImages.isNotEmpty) {
        imageFileList!.addAll(selectedImages);
        notifyListeners();
      }
    } on PlatformException catch (e) {
      log('Failed to pick : $e.tostring');
    }
  }

  // Function to add products to the database.

  addProduct(String productName, String description, int price, int mrp,
      String brand, String category, int stock, List images) async {
    try {
      imageFileList?.clear();
      var reponse = await http
          .post(Uri.parse('http://10.0.2.2:8000/admin/addproducts'), body: {
        "productname": productName,
        "price": price,
        "mrp": mrp,
        "stock": stock,
        "brand": brand,
        "category": category,
        "description": description,
      });
      if (reponse.statusCode == 200) {
        print('Successfully added');
      }
      notifyListeners();
    } catch (e) {
      log('Error while adding product');
      //  log($e.tostring);
    }
  }
}

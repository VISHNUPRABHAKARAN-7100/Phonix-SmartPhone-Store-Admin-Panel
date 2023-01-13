import 'dart:developer';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider with ChangeNotifier {
  final productNameTextEditingController = TextEditingController();
  final descriptionTextEditingController = TextEditingController();
  final actualPriceTextEditingController = TextEditingController();
  final discountedPriceTextEditingController = TextEditingController();
  final brandTextEditingController = TextEditingController();
  final categoryTextEditingController = TextEditingController();
  final remainigStockTextEditingController = TextEditingController(); 

  File? image;
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

  addProduct() async {
    imageFileList?.clear();
    notifyListeners();
  }
}

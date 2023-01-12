import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddProductProvider with ChangeNotifier {
  File? image;
  // Function to add images to the product details.

  addImage() async {
    try {
      var image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      this.image = imageTemp;
      notifyListeners();
    } on PlatformException catch (e) {
      log('Failed to pick : $e.tostring');
    }
  }
}

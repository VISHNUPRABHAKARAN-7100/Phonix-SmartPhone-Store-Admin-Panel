import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.textEditingController,
    required this.labelText,
    required this.ontap,
    this.inputFormatters,
    this.keyboardType,
  });

  final TextEditingController textEditingController;
  final String labelText;
  final String? Function() ontap;
  List<TextInputFormatter>? inputFormatters;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return TextFormField(
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      cursorColor: Colors.black,
      controller: textEditingController,
      decoration: InputDecoration(
        labelStyle: const TextStyle(
          color: Colors.black,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
          borderSide: const BorderSide(
            color: Colors.black,
          ),
        ),
        labelText: labelText,
        focusColor: Colors.black,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(size.width * 0.02),
        ),
      ),
      validator: (String? value) {
        return ontap();
      },
    );
  }
}

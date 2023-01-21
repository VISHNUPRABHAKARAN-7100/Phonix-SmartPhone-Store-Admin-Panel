import 'package:flutter/cupertino.dart';

class ConstSizedBox extends StatelessWidget {
  const ConstSizedBox({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * .02,
    );
  }
}

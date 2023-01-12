import 'package:admin_panel_of_phonix/add_product_screen/controller/add_product_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen/view/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => AddProductProvider(),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}

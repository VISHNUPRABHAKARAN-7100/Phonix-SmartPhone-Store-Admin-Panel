import 'package:admin_panel_of_phonix/add_product_screen/view/add_product_screen.dart';
import 'package:flutter/material.dart';

/// This screen shows the home screen and
/// if the admin wants to add products
/// then admin can add products and
/// there is an option for edit or delete
/// products.

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color.fromARGB(255, 248, 250, 250),
      body: ListView(
        children: [
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 20,
            itemBuilder: (context, index) {
              return Row(
                children: [
                  Container(
                    color: Colors.amber,
                    height: 200,
                    width: size.width,
                    child: Row(
                      children: [
                        Image(
                            fit: BoxFit.cover,
                            height: size.width / 2,
                            width: 100,
                            image: const NetworkImage(
                                'https://miro.medium.com/max/828/1*b68GAv4PcrJzZAq5Oh9RJA.webp')),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text('Name of the product'),
                            Text('Name of the product'),
                            Text('Name of the product'),
                            Text('Name of the product'),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () => Navigator.of(context).pop(),
              icon: const Icon(Icons.home),
            ),
            IconButton(
              onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                builder: (context) =>  AddProduct(),
              )),
              icon: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}

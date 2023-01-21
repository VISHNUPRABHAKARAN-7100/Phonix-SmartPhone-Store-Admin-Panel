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
                  SizedBox(
                    height: 200,
                    width: size.width,
                    child: Row(
                      children: [
                        Image(
                          // fit: BoxFit.cover,
                          height: size.width * .5,
                          width: 100,
                          image: const NetworkImage(
                            'https://m.media-amazon.com/images/I/61ahn9N38zL._SX679_.jpg',
                          ),
                        ),
                        SizedBox(
                          width: size.width * .02,
                        ),
                        SizedBox(
                          width: size.width * .45,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: const [
                              Text('Name of the product', maxLines: 1),
                              Text('Description of the product', maxLines: 1),
                              Text('price of the product', maxLines: 1),
                              Text('Stock of the product', maxLines: 1),
                            ],
                          ),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.delete),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        width: size.width / 3,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () => Navigator.of(context).push(MaterialPageRoute(
            builder: (context) =>  AddProduct(),
          )),
          icon: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

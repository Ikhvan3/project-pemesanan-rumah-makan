import 'package:provider/provider.dart';

import '../../providers/cart.dart';
import '../../widgets/badge.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets_makanan/makanan_grid.dart';
import '../cart_screen.dart';

class ProductsOverviewScreen extends StatefulWidget {
  static const routeName = '/minuman-overview';

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Cart>(context).initialDataGet();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Makanan'),
        backgroundColor: const Color.fromARGB(255, 199, 199, 199),
        actions: [
          Consumer<Cart>(
            builder: (context, value, ch) {
              return BadgeW(
                child: ch!,
                value: value.jumlah.toString(),
              );
            },
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pushNamed(
                  CartScreen.routeName,
                );
              },
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ],
      ),
      body: MakananGrid(),
    );
  }
}

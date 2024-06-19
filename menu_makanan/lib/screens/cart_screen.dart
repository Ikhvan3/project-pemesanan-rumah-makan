import 'package:flutter/material.dart';
import 'package:menu_makanan/providers/minuman/daftar_minuman.dart';

import 'package:provider/provider.dart';

import '../providers/cart.dart';
import '../providers/makanan/all_products.dart';

class CartScreen extends StatefulWidget {
  static const routeName = '/cart';

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<Cart>(context).initialDataGet();
      isInit = false;
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cardData = Provider.of<Cart>(context);
    final daftarMakanans = Provider.of<DaftarMakanans>(context);
    final daftarMinumans = Provider.of<DaftarMinumans>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
        backgroundColor: Colors.blueAccent,
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(20),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Text(
                "Total : \Rp ${cardData.totalHarga}",
                style: TextStyle(
                  fontSize: 35,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cardData.items.length,
              itemBuilder: (context, index) {
                final id = cardData.items.keys.toList()[index];
                final cartItem = cardData.items[id]!;

                return ListTile(
                  tileColor: const Color.fromARGB(255, 199, 199, 199),
                  title: Row(
                    children: [
                      Container(
                        width: 100,
                        height: 100,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.asset(
                            cartItem.imageUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(
                          width: 10.0), // Add spacing between image and text
                      // Text information
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment:
                            CrossAxisAlignment.start, // Align text to the left
                        children: [
                          Text(
                            cartItem.name ?? "Item name not found",
                            style: TextStyle(fontSize: 10),
                          ),
                          Text("${cardData.items.values.toList()[index].qty}"),
                          Text(
                            "\Rp  ${cardData.formatHarga(cardData.items.values.toList()[index].price * cardData.items.values.toList()[index].qty)}",
                          ),
                        ],
                      ),
                    ],
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () {
                          cardData.removeItem(id).then(
                            (_) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Berhasil dihapus"),
                                  duration: Duration(milliseconds: 500),
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

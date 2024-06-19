import 'package:flutter/material.dart';
import 'package:menu_makanan/providers/makanan/all_products.dart';
import 'package:menu_makanan/providers/cart.dart';
import 'package:menu_makanan/providers/minuman/daftar_minuman.dart';
import 'package:menu_makanan/screens/cart_screen.dart';
import 'package:menu_makanan/screens/makanan_screen/makanan_overview_screen.dart';
import 'package:menu_makanan/screens/minuman_screen/minuman_detail_screen.dart';
import 'package:menu_makanan/screens/minuman_screen/minuman_overview_screen.dart';
import 'package:menu_makanan/screens/splash_screen.dart';
import 'package:provider/provider.dart';

import 'screens/makanan_screen/makanan_detail_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Cart(),
        ),
        ChangeNotifierProvider(
          create: (context) => DaftarMakanans(),
        ),
        ChangeNotifierProvider(
          create: (context) => DaftarMinumans(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          hintColor: Colors.amber,
          fontFamily: 'Lato',
        ),
        home: const StartScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName: (ctx) => CartScreen(),
          MinumanDetailScreen.routeName: (cxt) => MinumanDetailScreen(),
          ProductsOverviewScreen.routeName: (ctx) => ProductsOverviewScreen(),
          MinumanOverviewScreen.routeName: (ctx) => MinumanOverviewScreen(),
        },
      ),
    );
  }
}

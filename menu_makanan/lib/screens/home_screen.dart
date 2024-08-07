import 'package:flutter/material.dart';
import 'package:menu_makanan/providers/auth.dart';
import 'package:menu_makanan/screens/makanan_screen/makanan_overview_screen.dart';
import 'package:menu_makanan/screens/minuman_screen/minuman_overview_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen(
      {super.key, required String StartScreen, required String UtamaScreen});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.10),
          ),
          color: Color.fromARGB(255, 255, 255, 255),
          elevation: 5,
          child: Container(
            height: 50.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.home_outlined),
                  iconSize: 30,
                  color: Color.fromARGB(255, 0, 212, 177),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  iconSize: 30,
                  color: const Color.fromARGB(255, 7, 7, 7),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.favorite_border),
                  color: Color.fromARGB(255, 10, 10, 10),
                  iconSize: 30,
                  onPressed: () {},
                ),
                IconButton(
                  onPressed: () =>
                      Provider.of<Authen>(context, listen: false).logout(),
                  icon: Icon(Icons.logout),
                ),
                // IconButton(
                //   icon: Icon(Icons.account_circle_outlined),
                //   iconSize: 30,
                //   color: const Color.fromARGB(255, 10, 10, 10),
                //   onPressed: () {},
                // ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
              Color.fromARGB(255, 126, 255, 242),
              Color.fromARGB(255, 238, 238, 238),
            ])),
        child: Column(
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Stack(
                      children: <Widget>[
                        Expanded(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            color: Color.fromARGB(255, 0, 212, 177),
                            elevation: 6,
                            child: Container(
                              child: Image.asset("images/bgtoko1.png"),
                            ),
                            // child: Column(
                            //   children: <Widget>[
                            //     Container(
                            //       width: 710,
                            //       height: 175,
                            //       decoration: BoxDecoration(
                            //         borderRadius: BorderRadius.circular(20),
                            //         // boxShadow: [
                            //         //   BoxShadow(
                            //         //     color:
                            //         //         Color.fromARGB(255, 177, 108, 43),
                            //         //     blurRadius: 10.0,
                            //         //     offset: Offset(0, 1),
                            //         //   ),
                            //         // ],
                            //       ),
                            //       child: Container(
                            //         height: 100,
                            //         child: Image.asset("images/bgtoko1.png"),
                            //         // child: Stack(
                            //         //   alignment: Alignment.topLeft,
                            //         //   children: [
                            //         //     Image.asset("images/bgtoko1.png"),
                            //         //     // Align(
                            //         //     //   alignment: Alignment.topLeft,
                            //         //     //   child: Padding(
                            //         //     //     padding: const EdgeInsets.all(10),
                            //         //     //     // child: Text(
                            //         //     //     //   "Pilih makanan kesukaanmu \n dan nikmatilah",
                            //         //     //     //   style: TextStyle(
                            //         //     //     //     fontFamily: 'Staatliches',
                            //         //     //     //     fontWeight: FontWeight.bold,
                            //         //     //     //     color: Color.fromARGB(
                            //         //     //     //         255, 250, 250, 250),
                            //         //     //     //     fontSize: 30,
                            //         //     //     //     shadows: <Shadow>[
                            //         //     //     //       Shadow(
                            //         //     //     //         offset: Offset(2, 2),
                            //         //     //     //         blurRadius: 3.0,
                            //         //     //     //         color: Color.fromARGB(
                            //         //     //     //             255, 151, 80, 32),
                            //         //     //     //       ),
                            //         //     //     //     ],
                            //         //     //     //   ),
                            //         //     //     // ),
                            //         //     //   ),
                            //         //     // ),
                            //         //   ],
                            //         // ),
                            //       ),
                            //     )
                            //   ],
                            // ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 30),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                ProductsOverviewScreen.routeName,
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 0, 212, 177),
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 252, 251, 251),
                                            blurRadius: 0.0,
                                            offset: Offset(0, 0),
                                          )
                                        ]),
                                    child: Image.asset("images/menu_makan.png"),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'MENU MAKAN',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 252, 251, 251),
                                      fontSize: 22,
                                      fontFamily: 'Staatliches',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(width: 18),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                MinumanOverviewScreen.routeName,
                              );
                            },
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              color: Color.fromARGB(255, 0, 212, 177),
                              elevation: 5,
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    width: 160,
                                    height: 160,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color.fromARGB(
                                                255, 248, 248, 248),
                                            blurRadius: 0.0,
                                            offset: Offset(0, 0),
                                          )
                                        ]),
                                    child: Image.asset(
                                      "images/menu_minum.png",
                                    ),
                                  ),
                                  SizedBox(height: 7),
                                  Text(
                                    'MENU MINUM',
                                    style: const TextStyle(
                                      color: Color.fromARGB(255, 255, 254, 253),
                                      fontSize: 22,
                                      fontFamily: 'Staatliches',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:hive/hive.dart';
import 'package:online_shop/views/shared/appstyle.dart';
import 'package:online_shop/views/shared/checkout_btn.dart';
import 'package:online_shop/views/ui/mainscreen.dart';
import 'package:provider/provider.dart';


 

class CartProvider with ChangeNotifier {
  final _cartBox = Hive.box('cart_box');
  List<dynamic> _cart = [];

  List<dynamic> get cart => _cart;

  set cart(List<dynamic> newCart) {
    _cart = newCart;
    notifyListeners();
  }

  getCart() {
    final cartData = _cartBox.keys.map((key) {
      final item = _cartBox.get(key);
      return {
        "key": key,
        "id": item['id'],
        "category": item['category'],
        "name": item['name'],
        "imageUrl": item['imageUrl'],
        "price": item['price'],
        "qty": item['qty'],
        "sizes": item['sizes']
      };
    }).toList();
    _cart = cartData.reversed.toList();
  }
  Future<void>deleteCart(int key) async {
    await _cartBox.delete(key);
  }
   Future<void>createCart(Map<String, dynamic> newCart) async {
    await _cartBox.add(newCart);
  }

  int _counter = 0;
  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    if (_counter >= 1) {
      _counter--;
      notifyListeners();
    }
  }
}



class MyCartPage extends StatefulWidget {
  MyCartPage({super.key});

  @override
  State<MyCartPage> createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  @override
  Widget build(BuildContext context) {
    var cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCart();
    return Scaffold(
      backgroundColor: const Color(0xffEEF7FF),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Ionicons.close,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "My Cart",
                  style: appstyle(35, Colors.black, FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: ListView.builder(
                      itemCount: cartProvider.cart.length,
                      padding: EdgeInsets.zero,
                      itemBuilder: (context, index) {
                        final data = cartProvider.cart[index];
                        return Padding(
                          padding: const EdgeInsets.all(8),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(12),
                            ),
                            child: Slidable(
                              key: const ValueKey(0),
                              endActionPane: const ActionPane(
                                motion: ScrollMotion(),
                                children: [
                                  SlidableAction(
                                    onPressed: null,
                                    backgroundColor: Color(0xFF000000),
                                    foregroundColor: Colors.white,
                                    icon: Icons.delete,
                                    label: 'Delete',
                                  ),
                                ],
                              ),
                              child: Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.11,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade100,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade500,
                                      spreadRadius: 5,
                                      blurRadius: 0,
                                      offset: const Offset(0, 1),
                                    ),
                                  ],
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Stack(children: [
                                          Padding(
                                            padding: const EdgeInsets.all(12),
                                            child: CachedNetworkImage(
                                              imageUrl: data['imageUrl'],
                                              width: 70,
                                              height: 70,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                          Positioned(
                                              bottom: -2,
                                              child: GestureDetector(
                                                onTap: () {
                                                  cartProvider
                                                      .deleteCart(data['key']);
                                                  Navigator.pushReplacement(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            MainScreen(),
                                                      ));
                                                },
                                                child: Container(
                                                  width: 40,
                                                  height: 30,
                                                  decoration: const BoxDecoration(
                                                      color: Colors.black,
                                                      borderRadius:
                                                          BorderRadius.only(
                                                              topRight: Radius
                                                                  .circular(
                                                                      12))),
                                                  child: const Icon(
                                                    Ionicons.trash,
                                                    size: 19,
                                                    color: Colors.white,
                                                  ),
                                                ),
                                              )),
                                        ]),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20, top: 12),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                data['name'],
                                                style: appstyle(
                                                    15,
                                                    Colors.black,
                                                    FontWeight.bold),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                data['category'],
                                                style: appstyle(14, Colors.grey,
                                                    FontWeight.w600),
                                              ),
                                              const SizedBox(
                                                height: 5,
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    data['price'],
                                                    style: appstyle(
                                                        18,
                                                        Colors.black,
                                                        FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    width: 40,
                                                  ),
                                                  Text(
                                                    "Size",
                                                    style: appstyle(
                                                        18,
                                                        Colors.grey,
                                                        FontWeight.w500),
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    data['sizes'],
                                                    style: appstyle(
                                                        18,
                                                        Colors.black,
                                                        FontWeight.w500),
                                                  ),
                                                ],
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(15))),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.minimize_rounded,
                                                    size: 20,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                Text(
                                                  data['qty'].toString(),
                                                  style: appstyle(
                                                      15,
                                                      Colors.black,
                                                      FontWeight.w700),
                                                ),
                                                InkWell(
                                                  onTap: () {},
                                                  child: const Icon(
                                                    Icons.add,
                                                    size: 20,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: CheckoutButton(label: "checkOut"),
            ),
          ],
        ),
      ),
    );
  }
}

// class CartPage extends StatelessWidget {
//   CartPage({super.key});

//   final _cartBox = Hive.box('cart_box');

//   @override
//   Widget build(BuildContext context) {
//     List<dynamic> cart = [];
//     final cartData = _cartBox.keys.map((key) {
//       final item = _cartBox.get(key);
//       return {
//         "key": key,
//         "id": item['id'],
//         "category": item['category'],
//         "name": item['name'],
//         "imageUrl": item['imageUrl'],
//         "price": item['price'],
//         "qty": item['qty'],
//         "sizes": item['sizes']
//       };
//     }).toList();

//     cart = cartData.reversed.toList();
//     return Scaffold(
//       backgroundColor: const Color(0xFFE2E2E2),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Stack(
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const SizedBox(
//                   height: 40,
//                 ),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: const Icon(
//                     AntDesign.close,
//                     color: Colors.black,
//                   ),
//                 ),
//                 Text(
//                   "My Cart",
//                   style: appstyle(36, Colors.black, FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20,
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.65,
//                   child: ListView.builder(
//                       itemCount: cart.length,
//                       padding: EdgeInsets.zero,
//                       itemBuilder: (context, index) {
//                         final data = cart[index];
//                         return Padding(
//                           padding: const EdgeInsets.all(8),
//                           child: ClipRRect(
//                             borderRadius:
//                                 const BorderRadius.all(Radius.circular(12)),
//                             child: Slidable(
//                               key: const ValueKey(0),
//                               endActionPane: ActionPane(
//                                 motion: const ScrollMotion(),
//                                 children: [
//                                   SlidableAction(
//                                     flex: 1,
//                                     onPressed: doNothing,
//                                     backgroundColor: const Color(0xFF000000),
//                                     foregroundColor: Colors.white,
//                                     icon: Icons.delete,
//                                     label: 'Delete',
//                                   ),
//                                 ],
//                               ),
//                               child: Container(
//                                 height:
//                                     MediaQuery.of(context).size.height * 0.11,
//                                 width: MediaQuery.of(context).size.width,
//                                 decoration: BoxDecoration(
//                                     color: Colors.grey.shade100,
//                                     boxShadow: [
//                                       BoxShadow(
//                                           color: Colors.grey.shade500,
//                                           spreadRadius: 5,
//                                           blurRadius: 0.3,
//                                           offset: const Offset(0, 1)),
//                                     ]),
//                                 child: Row(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(12),
//                                           child: CachedNetworkImage(
//                                             imageUrl: data['imageUrl'],
//                                             width: 70,
//                                             height: 70,
//                                             fit: BoxFit.fill,
//                                           ),
//                                         ),
//                                         Padding(
//                                           padding: const EdgeInsets.only(
//                                               top: 12, left: 20),
//                                           child: Column(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.start,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 data['name'],
//                                                 style: appstyle(
//                                                     16,
//                                                     Colors.black,
//                                                     FontWeight.bold),
//                                               ),
//                                               const SizedBox(
//                                                 height: 5,
//                                               ),
//                                               Text(
//                                                 data['category'],
//                                                 style: appstyle(14, Colors.grey,
//                                                     FontWeight.w600),
//                                               ),
//                                               const SizedBox(
//                                                 height: 5,
//                                               ),
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     data['price'],
//                                                     style: appstyle(
//                                                         18,
//                                                         Colors.black,
//                                                         FontWeight.w600),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 40,
//                                                   ),
//                                                   Text(
//                                                     "Size",
//                                                     style: appstyle(
//                                                         18,
//                                                         Colors.grey,
//                                                         FontWeight.w600),
//                                                   ),
//                                                   const SizedBox(
//                                                     width: 15,
//                                                   ),
//                                                   Text(
//                                                     data['sizes'],
//                                                     style: appstyle(
//                                                         18,
//                                                         Colors.grey,
//                                                         FontWeight.w600),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         )
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         Padding(
//                                           padding: const EdgeInsets.all(8.0),
//                                           child: Container(
//                                             decoration: const BoxDecoration(
//                                                 color: Colors.white,
//                                                 borderRadius: BorderRadius.all(
//                                                     Radius.circular(16))),
//                                             child: Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment
//                                                       .spaceBetween,
//                                               children: [
//                                                 InkWell(
//                                                     onTap: () {
//                                                       // cartProvider.increment();
//                                                     },
//                                                     child: const Icon(
//                                                       AntDesign.minussquare,
//                                                       size: 20,
//                                                       color: Colors.grey,
//                                                     )),
//                                                 Text(
//                                                   data['qty'].toString(),
//                                                   style: appstyle(
//                                                     16,
//                                                     Colors.black,
//                                                     FontWeight.w600,
//                                                   ),
//                                                 ),
//                                                 InkWell(
//                                                     onTap: () {
//                                                       // cartProvider.decrement();
//                                                     },
//                                                     child: const Icon(
//                                                       AntDesign.plussquare,
//                                                       size: 20,
//                                                       color: Colors.black,
//                                                     )),
//                                               ],
//                                             ),
//                                           ),
//                                         ),

//                                         // ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         );
//                       }),
//                 )
//               ],
//             ),
//             const Align(alignment: Alignment.bottomCenter,
//             child: CheckoutButton(label: "Proceed to Checkout"),),
//           ],
//         ),
//       ),
//     );
//   }

//   void doNothing(BuildContext context) {}
// }

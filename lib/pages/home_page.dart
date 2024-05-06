import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app/pages/cart_page.dart';
import 'package:shop_app/widgets/product_card.dart';
import 'package:shop_app/pages/product_details_page.dart';
import 'package:shop_app/pages/product_list.dart';

import '../global_variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentPage=0;

  List<Widget> pages=[
    ProductList(),CartPage()
  ];

  @override
  Widget build(BuildContext context) {
    const border=OutlineInputBorder(
        borderSide: BorderSide(
            color: Color.fromRGBO(225, 225, 225, 1)
        ),
        borderRadius: BorderRadius.horizontal(left: Radius.circular(50))
    );
    return Scaffold(
      body: IndexedStack(
        children: pages,
        index: currentPage,
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        onTap:(value) {
        setState(() {
          currentPage=value;
        });
      },items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),
        label: ''),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),
        label: '')
      ],
      currentIndex: currentPage,),
    );
  }
}

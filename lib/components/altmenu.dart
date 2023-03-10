import 'package:flutter/material.dart';

Widget altmenuBar(String page){

  return Align(
                alignment: Alignment.bottomCenter,
                child: Container(                  
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  color: Color(0xFFEFF5FB),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      altmenu(IconData: Icons.home_outlined, active: page=="home"),
                      altmenu(IconData: Icons.search, active: page=="search"),
                      altmenu(IconData: Icons.shopping_cart_outlined, active: page=="cart"),
                      altmenu(IconData: Icons.person, active: page=="profile"),                                                    
                    ],
                  ),
                ),
              );
}

Widget altmenu({required IconData,required bool active}){
  return Icon(
    IconData,
    size: 22,
    color: Color(active? 0xFF0001FC : 0xFF0A1034),
    );
}
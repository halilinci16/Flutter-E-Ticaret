import 'package:flutter/material.dart';

Widget label(String text){
  return Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2),
                          color: Color.fromARGB(255, 228, 228, 228)),
                          child: Text(
                            text,
                            style: TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                      );
}
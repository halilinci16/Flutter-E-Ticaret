import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:tekno_trend/components/altmenu.dart';
import 'package:tekno_trend/kategori.dart';

class CategoriesPage extends StatelessWidget {


 final List<String> Kategoriler=[
  "Tüm Ürünler",
  "Akıllı Telefonlar",
  "Laptoplar",
  "Mouselar",
  "Kulaklıklar",
  "Şarj Aletleri",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Color.fromARGB(255, 0, 0, 0),
                        size: 35,
                      ),
                    ),
                    SizedBox(height: 24,),
                    Text(
                      "Kategoriler",
                      style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF0A1034),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 20,),
                  
                  Expanded(
                    child: ListView(
                      children: Kategoriler.map((String title) => kategoriler(title, context))
                      .toList(),
                    ),
                  ),
                  SizedBox(height: 50,),           
                  ],
                ),
              ),
              altmenuBar("search"),
            ],
            
          ),
        ),
      );
  }
}

Widget kategoriler(
  String title,
  BuildContext context,
  ){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return Kategori(title);
      }));
    },
    child: Container(    
           margin: EdgeInsets.only(bottom: 16),          
           padding: EdgeInsets.all(24),
           width: double.infinity,
          decoration: BoxDecoration(
              color: Color.fromARGB(255, 255, 255, 255),
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
               BoxShadow(
                color: Colors.black.withOpacity(0.25),
                blurRadius: 4,
                offset: Offset(0,4),
            )]
          ),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Color.fromARGB(255, 0, 0, 0),
              ),
            ),
         ),
  );           
}
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:tekno_trend/components/altmenu.dart';
import 'package:tekno_trend/urundetay.dart';

class Kategori extends StatelessWidget {
  
  String kategoriBaslik;
  
  Kategori(this.kategoriBaslik);


List<Map> products = [
  {"isim":"İphone 12 ","fotograf":"assets/images/iphone12a.png","fiyat":"25.349,00"},
  {"isim":"İphone 13 Pro ","fotograf":"assets/images/i13p.png","fiyat":"42.470,00"},
  {"isim":"Samsung S22 Ultra ","fotograf":"assets/images/s22ultra.jpg","fiyat":"32.299,00"},
  {"isim":"Samsung M21 ","fotograf":"assets/images/sm21.png","fiyat":"8.250,00"},
  {"isim":"Xiaomi Mi 11 Lite ","fotograf":"assets/images/mi11lite.png","fiyat":"9.810,00"},
  {"isim":"Redmi Note 11 Pro ","fotograf":"assets/images/rnote11pro.png","fiyat":"8.395,00"},
  {"isim":"Oppo A73 ","fotograf":"assets/images/oa73.png","fiyat":"7.900,00"},
];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 25,),
                    //BAŞLIK VE GERİ BUTONU
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
                      kategoriBaslik,
                      style: TextStyle(
                      fontSize: 26,
                      color: Color(0xFF0A1034),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 40,),
                  //İÇERİK
                  Expanded(
                    child: GridView.count(
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      crossAxisCount: 2,
                      children: products.map((Map product) {
                      return kategori(
                        product["isim"], 
                        product["fotograf"], 
                        product["fiyat"],
                        context);
                    }).toList(),
                    ),
                  ),
                  SizedBox(height: 55,),
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

Widget kategori( String title, String photoUrl, String price,context){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return UrunDetay(title);
      }));
    },
    child: Container(
                      
                      padding: EdgeInsets.symmetric(horizontal: 1,vertical: 2),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(6),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 24,
                            offset: Offset(0,16),
                          ),
                        ],
                      ),
                    child: Column(
                      children: [
                        SizedBox(height: 16,),
                        Image.asset(photoUrl),
                        SizedBox(height: 16,),
                        Column(
                          children: [
                            Text(title,style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0A1034),
                              fontSize: 16,
                            ),),
                            Text("${price} ₺",style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF0001FC),
                              fontSize: 15,
                            ),),
                          ],
                        )
                      ],
                    ),
                    ),
  );
}
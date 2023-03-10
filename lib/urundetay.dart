import 'package:flutter/material.dart';
import 'package:tekno_trend/components/altmenu.dart';
import 'package:tekno_trend/components/label.dart';

class UrunDetay extends StatefulWidget {
String urunBaslik;
UrunDetay(this.urunBaslik);

  @override
  State<UrunDetay> createState() => _UrunDetay();
}

class _UrunDetay extends State<UrunDetay> {

  List<Color> colors = [
   Color.fromARGB(255, 0, 0, 0),
   Color.fromARGB(255, 230, 230, 230),
   Color.fromARGB(255, 255, 0, 0),
   Color.fromARGB(255, 0, 0, 255),


  ];

  List<int> capacities=[128,256,512];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:14.0),
                child: Expanded(
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
                        widget.urunBaslik,
                        style: TextStyle(
                        fontSize: 26,
                        color: Color(0xFF0A1034),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 30,),
                
                    Expanded(
                      child: ListView(
                        
                        children: [            
                          // Ürün Detay Resmi
                          Center(child: Image.asset("assets/images/i13pro.png")),
                          SizedBox(height:20,),
                                    
                          // Ürün Renk Seçenekleri              
                           Center(
                             child: Text(
                              "Renk",           
                              style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFF0A1034),
                              fontWeight: FontWeight.bold,
                        ),
                      ),
                           ),
                          
                        SizedBox(height:16 ,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                            colors.map((Color color) => renkSec(color: color,onTap: (){
                              setState(() {
                                
                              });
                            }))
                            .toList(),
                        ),
                        SizedBox(height: 32,),
                                    
                        Center(
                             child: Text(
                              "Hafıza",           
                              style: TextStyle(
                              fontSize: 22,
                              color: Color(0xFF0A1034),
                              fontWeight: FontWeight.bold,
                        ),
                      ),
                                      ),
                                      SizedBox(height: 16,),
                                      Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: capacities.map((int number) => kapasiteSec(number)).toList(),
                                      ),
                                      SizedBox(height: 32,),
                                    
                                      Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: Color(0xFF1F53E4),
                      ),
                      child: Center(
                        child: Text(
                              "Sepete Ekle",
                              
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                              ),
                      ),
                                      ),
                                    SizedBox(height: 50,),
                        ],
                      ),
                    )
                    
                    ]
                  ),
                )
              ),
              altmenuBar("cart"),
            ]
           ),
          ),
       ); 

  }
}

Widget renkSec({required Color color,required Function onTap}){
  return GestureDetector(
    onTap: () {
      
    },
    child: Container(
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
                ),
                width: 23,
                height: 23,
    ),
  );
}

Widget kapasiteSec(int kapasite){
  return Container(
    margin: EdgeInsets.only(right: 23),
    child: Text(
      "$kapasite GB",
      style: TextStyle(color: Color.fromARGB(255, 0, 0, 0),fontSize: 16),
    ),
  );
}
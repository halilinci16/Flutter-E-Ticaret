import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:tekno_trend/components/altmenu.dart';
import 'package:tekno_trend/components/label.dart';
import 'package:tekno_trend/kategoriler.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth=MediaQuery.of(context).size.width;

    return Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:16.0),
                child: Expanded(
                  child: ListView(                   
                    children: [
                      SizedBox(height: 25,),
                      // ANA MENÜ BAŞLIK
                      Anamenubaslik(),
                      SizedBox(height: 14,),
                      // LOGO AFİŞ
                      logoAfis(),
                      // BUTONLAR
                      Padding(
                        padding: EdgeInsets.only(top: 36),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AnaSayfaButonlar(text: "Kategoriler", icon: Icons.menu,widget: CategoriesPage(),context: context),
                            AnaSayfaButonlar(text: "İkinci El Eşya", icon: Icons.card_giftcard,widget: Scaffold(),context: context),
                            AnaSayfaButonlar(text: "Favoriler", icon: Icons.star_border,widget: Scaffold(),context: context),
                            AnaSayfaButonlar(text: "En Çok Satanlar", icon: Icons.people,widget: Scaffold(),context: context),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 70,),
                      //ÖNE ÇIKANLAR BAŞLIK
                      Text(
                        "Öne Çıkanlar",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                          color: Color(0xFF0A1034),
                        ),
                      ),
                      SizedBox(height: 16),
                      //ÖNE ÇIKANLAR BÖLÜMÜ
                      Row(
                        children: [
                          buildOneCikan(
                            text: "İphone 13 128GB",
                            photoUrl: "assets/images/iphone13m.png",
                            discount: "%10 İndirimli",
                            screenWidth: screenWidth,
                          ),
                          buildOneCikan(
                            text: "MSI GL 75 Gaming Laptop",
                            photoUrl: "assets/images/msigl75.png",
                            discount: "%15 İndirimli",
                            screenWidth: screenWidth,
                          ),
                        ],
                      ),
                      Row(
                        children: [                       
                          buildOneCikan(
                            text: "Razer Viper Mini",
                            photoUrl: "assets/images/razerviper.jpg",
                            discount: "%20 İndirimli",
                            screenWidth: screenWidth,
                          ),                
                        ],
                      ),
                      
                      SizedBox(height: 50,),
                                      
                    ],
                    
                  ),
                ),
              ),
              altmenuBar("home"), 
            ],
          ),
        ),
      );
  }
}

Widget Anamenubaslik(){
  return Padding(
            padding: const EdgeInsets.only(top: 24.0),
            child: Text(
              "Ana Menü",
              style: TextStyle(
                fontSize: 25,
                color: Color(0xFF0A1034),
                fontWeight: FontWeight.bold,
                    ),
                  ),
                );
}

Widget logoAfis(){
return Padding(
                  padding: EdgeInsets.only(top: 24),
                  child: Container(                
                    width: double.infinity,
                    padding: EdgeInsets.only(
                      left: 16,right: 16, top: 35,bottom: 35,),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 102, 255),
                        borderRadius: BorderRadius.circular(6),   
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Column(
                          children: [
                            Text("TeknoTrend",
                            style: TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize: 28,
                              fontWeight: FontWeight.w600,
                              
                              ),
                              
                            ),
                          ],
                        ),
                        Image.asset("assets/images/teknotrend1.jpg")

                    ],),
                  ),
                );

}

Widget AnaSayfaButonlar({
  required String text,
  required IconData icon,
  required Widget widget,
  required BuildContext context,
  }){
  return GestureDetector(
    onTap: (){
      Navigator.push(context, MaterialPageRoute(builder: (context){
        return widget;
      }));
    },
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal:18,vertical: 22 ),  
          decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color.fromARGB(255, 199, 198, 198)),
          child: Icon(
            icon,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 25,
          ),
        ),
        SizedBox(height: 4,),
        Text(
          text,
          style: TextStyle(
            color: Color.fromARGB(255, 0, 0, 0),
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    ),
  );
}

Widget buildOneCikan({
required String text,
required String photoUrl,
required String discount,
required double screenWidth}){
 return Container(
                  width: (screenWidth-60)*0.5,
                  padding: EdgeInsets.only(left: 5,right: 5,top: 12,bottom: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      label(discount),
                      SizedBox(height: 22,),
                      Center(child: Image.asset(photoUrl)),
                      SizedBox(height: 22,),
                      Center(
                        child: Text(
                          text,
                          style: TextStyle(
                            fontSize: 16,
                            color: Color.fromARGB(250, 0, 0, 0),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  ),
                );
}


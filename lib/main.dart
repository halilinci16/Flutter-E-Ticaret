import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:tekno_trend/home.dart';
import 'package:quickalert/quickalert.dart';


void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  

Future<FirebaseApp> _initializeFirebase() async {
  FirebaseApp firebaseApp = await Firebase.initializeApp();
  return firebaseApp;
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState==ConnectionState.done){
            return LoginScreen();
          }
          return Center(
            child: CircularProgressIndicator(),
            );
        } ,
      )
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  void showAlert(){
    QuickAlert.show(
      context: context,
      text: "Kullanıcı adı veya şifre yanlış!!", 
      type: QuickAlertType.error);
  }
  void showAlertSucces(){
    QuickAlert.show(
      context: context,
      text: "Giriş Başarılı", 
      type: QuickAlertType.success);
  }


 Future<User?>loginUsingEmailPassword({required String email,required String password,required BuildContext context})async{
  FirebaseAuth auth= FirebaseAuth.instance;
  User? user;
  try{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    user=userCredential.user;
  }on FirebaseAuthException catch (e){
    if(e.code=="Kullanıcı Bulunamadı"){
      print("Bu E-posta için kullanıcı bulunamadı");
    }
    else{
       showAlert();
    }
    
  }

  return user;
}




  @override
  Widget build(BuildContext context) {

  TextEditingController _emailController=TextEditingController();
  TextEditingController _passwordController=TextEditingController();



    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(top: 100),
        child: Column(   
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage(
                    'https://kobilerim.com/userimages/th_teknotrendlogo8.png'
                  ),
                ),
              ),
              SizedBox(height: 44,),
    
              Padding(
                padding: const EdgeInsets.only(right:30.0,left: 30.0,),
                child: TextField(
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "Kullanıcı Adı",
                    prefixIcon: Icon(Icons.mail_outline,color: Colors.black,),
                  ),
                ),
              ),
              SizedBox(height: 35,),
    
              Padding(
                padding: const EdgeInsets.only(right:30.0,left: 30.0,),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Şifre",
                      prefixIcon: Icon(Icons.key,color: Colors.black,),
                    ),
                ),
              ),
              SizedBox(height: 12,),
              Padding(
                padding: const EdgeInsets.only(left: 200),
                child: Text(
                  "Şifrenizi mi unuttunuz ?",
                  style: TextStyle(
                    color: Colors.blue[600],
                  ),
                  ),
              ),
              SizedBox(height: 60,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Colors.blue,
                    elevation: 0.0,
                    onPressed: ()async{
                      User? user =await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
                      print(user);
                      if (user != null) {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage(),));
                      }
    
                    },
                    padding: EdgeInsets.symmetric(vertical: 20,),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(12),
                      
                      ),
                      child: Text(
                        "Giriş",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                  ),
                ),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 25,right: 25),
                child: Container(
                  width: double.infinity,
                  child: RawMaterialButton(
                    fillColor: Colors.blue,
                    elevation: 0.0,
                    onPressed: (){
    
                    },
                    padding: EdgeInsets.symmetric(vertical: 20,),
                    shape: RoundedRectangleBorder(
                      borderRadius:BorderRadius.circular(12),
                      
                      ),
                      child: Text(
                        "Kayıt Ol",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                  ),
                ),
              ),
            ],
          
        ),
      ),
    );
  }
}















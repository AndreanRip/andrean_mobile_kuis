import 'package:flutter/material.dart';
import 'Home/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage ({Key? key}) : super (key:key);

  @override
  State<LoginPage>createState()=> _LoginPageState(); 
}



class _LoginPageState extends State<LoginPage> {
  String _username='';
  String _password='';
  bool isClicked = false;

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 3), (){});
    Navigator.push(
       context, MaterialPageRoute(builder: (context)=>
      HomePage(username: _username)));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea (
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Selamat Datang Kembali"),
        ),
        body: Column (
          children:[_usernameField(),
          _passwordField(),
          _LoginButton(context),
          ],
        )
      )
    );
  }


Widget _usernameField() {
  return Container(
    child: 
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          _username=value;
        },
        decoration: InputDecoration(
          hintText: "Nama username",
          hintStyle: TextStyle (
            color: Colors.purple
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide:  BorderSide(
              width: 100,
              color: Colors.purple
            ),
          ),
        ),
      ),
      ),
  );
}

Widget _passwordField() {
  return Container(
    child: 
    Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextFormField(
        enabled: true,
        onChanged: (value){
          _password=value;
        },
        decoration: InputDecoration(
          hintText: "Nama username",
          hintStyle: TextStyle (
            color: Colors.purple
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide:  BorderSide(
              width: 100,
              color: Colors.purple
            ),
          ),
        ),
      ),
      ),
  );
}

Widget _LoginButton(BuildContext context) {
  return Container(
    width:double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: ElevatedButton(
      style: ButtonStyle(
        backgroundColor: isClicked == true? WidgetStatePropertyAll(Colors.white): WidgetStatePropertyAll(Colors.purple),), 
        onPressed:() {
          if (_username=="123" && _password=="123") {
            _navigateToHome();
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Login Berhasil"),),);
            setState((){
              isClicked = !isClicked;
              print(isClicked);

            });
          }
        },
        child: Text("Login"),
      ),
    );
  }
}
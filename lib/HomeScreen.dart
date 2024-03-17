import 'dart:async';

import 'package:flutter/material.dart';
import 'package:multiroleapp/LoginScreen.dart';
import 'package:multiroleapp/MainScreen.dart';
import 'package:multiroleapp/secondScreen.dart';
import 'package:multiroleapp/studentscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLogin();

  }



  void isLogin()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
bool isLogin = sp.getBool('isLogin') ?? false;
String userType = sp.getString('userType') ?? '' ;
if(isLogin)
{
  if(userType == 'student'){
    Timer(Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => StudentScreen()));});
  }
  else if(userType == 'teacher'){
    Timer(Duration(seconds: 5), () {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => teach erview()));});

  }
}
else{
  Timer(Duration(seconds: 5), () {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => Login()));});
}
  }

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
      body:  Image(
        height: double.infinity,
        fit: BoxFit.fitHeight,
        image: NetworkImage('https://images.pexels.com/photos/13830246/pexels-photo-13830246.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),

      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multiroleapp/HomeScreen.dart';
import 'package:multiroleapp/MainScreen.dart';
import 'package:multiroleapp/studentscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final ageController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             TextFormField(
               controller: emailController,
               decoration: InputDecoration(
                 hintText: 'email',
               ),
             ),
            SizedBox(height: 20,),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: 'password',
              ),
            ),
            SizedBox(height: 20,),
            TextFormField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Age',
              ),
            ),
            SizedBox(height: 40,),
            InkWell(

              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.setString('email', emailController.text.toString());
                sp.setString('age', ageController.text.toString());
                sp.setString('userType', 'teacher');

                sp.setBool('isLogin', true);
                if(sp.getString('userType') == 'teacher'){}
                else if(
                  sp.getString('userType') == 'student'){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));
                }
                else{
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => StudentScreen()));

                }
                Navigator.push(context,
                MaterialPageRoute(builder: (context) => StudentScreen()));


},

              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color:Colors.pink,borderRadius:BorderRadius.circular(20),shape: BoxShape.rectangle),

                child: Center(child: Text('Log in')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multiroleapp/HomeScreen.dart';
import 'package:multiroleapp/LoginScreen.dart';
import 'package:shared_preferences/shared_preferences.dart';


class teacherview extends StatefulWidget {
  const teacherview({Key? key}) : super(key: key);

  @override
  State<teacherview> createState() => _teacherviewState();
}

class _teacherviewState extends State<teacherview> {
  String email ='', age = '' , type='';
  @override
  void initState(){
    super.initState();
    loadData();
  }
  loadData()async{
    SharedPreferences sp = await SharedPreferences.getInstance();
    email = sp.getString('email')?? '';
    age = sp.getString('age')?? '';
    type = sp.getString('userType') ?? '';
    setState(() {

    });
  }

  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Teacher View'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Home Screen'),
            Row(
              children: [
                Text('email'),
                Text(email.toString()),
              ],
            ),
            Row(
              children: [
                Text('age'),
                Text(age.toString()),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              children: [
                Text('user type '),
                Text(type.toString()),
              ],
            ),
            InkWell(

              onTap: ()async{
                SharedPreferences sp=await SharedPreferences.getInstance();
                sp.clear();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Login()));


              },

              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(color:Colors.pink,borderRadius:BorderRadius.circular(20),shape: BoxShape.rectangle),

                child: Center(child: Text('Log out')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

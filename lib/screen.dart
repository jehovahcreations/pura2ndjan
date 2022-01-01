import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pura/DashBoard.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'constant.dart';
import 'login.dart';

class Screen extends StatefulWidget {
  Screen({Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
 @override
  void initState(){
    super.initState();
     shared();
     
            
  }
  shared()async{
    sp = await SharedPreferences.getInstance();
    var phone = sp.getString('name');
    
    Timer(
        Duration(seconds: 6),
        () => phone== null?  Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Login())):Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Dashboard(pageIndex: 0,))));
   // sp.setString('pageindex', '0');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:[ 
              Image.asset('assets/logo/logo.png',height:500),
              Shimmer.fromColors(
                 baseColor: Colors.white,
                 highlightColor: Colors.grey,
                 child: Column(
                   children: [
                     Text('PURA',style: TextStyle(color: Colors.white, fontSize:130,fontWeight: FontWeight.w700),),
                     Text('SOCIAL JUSTICE MOVEMENT',style: TextStyle(color: Colors.white, fontSize:25,fontWeight: FontWeight.w700),),
                   ],
                 ))
              ]),
        ),
      ),
    );
  }
}
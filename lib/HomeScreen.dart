import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:pura/DashBoard.dart';
import 'package:pura/Payment.dart';
import 'package:pura/UserData.dart';
import 'package:pura/dash.dart';
import 'package:pura/idcard.dart';
import 'package:pura/learn.dart';
import 'package:pura/mainmenu.dart';
import 'package:pura/profile.dart';
import 'package:pura/team.dart';
import 'package:pura/view.dart';
import 'package:pura/webview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Details.dart';
import 'offer.dart';
import 'paan.dart';
import 'src/curved_navigation_bar.dart';
//import 'package:pura/bottom.dart';
import 'package:pura/constant.dart';

class HomeScreen extends StatefulWidget {
  final title;
  final controller;
  final pageIndex;
  final param;
  HomeScreen({Key? key,required this.title, this.pageIndex, this.controller, this.param}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
var _opening = '0';
int _index = 0;
@override
  void initState(){
    super.initState();
   if(widget.pageIndex !=null){
      setState(() {
    _index = widget.pageIndex;
  });

   }
 
   
    //_logout();
  }
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(backgroundColor:Colors.teal,leading:InkWell(
            onTap:(){widget.controller.toggle();
            //print(widget.title.stateNotifier);
            setState(() {
              if(_opening == '0'){
              _opening = '1';
            }else{
              _opening = '0';
            }
            print(_opening);
            });
            },
           
              child:_opening == '0'?Icon(Icons.menu):Icon(Icons.arrow_back_ios_new),),

              

              title:_index==0?Text('Dashboard'):_index==1?Text('MainMenu'):_index==2?Text('Learning'):_index==3?Text('Team'):_index==4?Text('Profile'):_index==6?Text('Sub Menu'):_index==7?Text('Details'):Text('PURA'),
        
      ),
      bottomNavigationBar: CurvedNavigationBar(
    backgroundColor: Colors.blueAccent,
    items: <Widget>[
      Icon(Icons.home_outlined, size: 30,color: Colors.white,),
      Icon(Icons.work_outline, size: 30,color: Colors.white,),
      Icon(Icons.book_outlined,size: 30,color: Colors.white,),
      Icon(Icons.network_cell_outlined,size: 30,color: Colors.white,),
      Icon(Icons.account_circle_outlined, size: 30,color: Colors.white,),
                ],
                   onTap: (index)async {
                     setState(() {
                       _index = index;
                     });
                   },
                 )
                ,
      body: SingleChildScrollView(
        
        child: Column(
          children: [
_index ==0?Dash():
_index ==1?MainMenu():
_index ==2?Learn():
_index ==3?Team():
_index ==4?Profile():
_index ==5?Paan(title: widget.title,param:widget.param):
_index==6?Details(title: 'Banking Jobs',param:widget.param):
_index==7?View(param:widget.param):
_index==8?UserData(param:widget.param, title:widget.title,):
_index == 9? Payment(param: widget.param,title: widget.title,):
_index==10?Idcard():
_index==11?Offer():
_index == 12? Webview(param: widget.param,title: widget.title,): Text('77')
            
        
          ],
        )),
    );
  }
}
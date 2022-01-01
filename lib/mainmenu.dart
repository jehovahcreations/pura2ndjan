import 'package:flutter/material.dart';
import 'package:pura/DashBoard.dart';
import 'package:pura/Details.dart';
import 'package:pura/HomeScreen.dart';
import 'package:pura/constant.dart';

import 'dash.dart';

class MainMenu extends StatefulWidget {
  MainMenu({Key? key}) : super(key: key);

  @override
  _MainMenuState createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  String? _status;
  List<dynamic> data = [];
  bool isLoading = true;
  _menuFetch()async{
   await db.open();
   var coll = db.collection('menus');
   var res =await coll.find({"isActive":1}).toList();
   if(res == null){
    _status = 'No data';
   }else{
     setState(() {
       data = res;
       isLoading = false;
     });
    
    print(res);
   }
   await db.close();

  }
  @override
  void initState() {
    super.initState();
    // _getFirebaseUser();
    _menuFetch();
    }
  @override
   Widget build(BuildContext context) {
    return 
    isLoading == true ? Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.teal,),
        ],
      )):
    Padding(
      padding: EdgeInsets.all(15),
      //child: ListView.builder(itemBuilder: itemBuilder)
      child:Center(
    child: Container(
      //color: Colors.white,
      height: MediaQuery.of(context).size.height *0.7, // card height
      child: GridView.builder(
  itemCount: data.length,
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount:  3),
        itemBuilder: (BuildContext ctxt, int Index) {
          return  Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: 100,
              color: Colors.teal,
              child: InkWell(
                             onTap: (){
                              
                              
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(pageIndex:6,param:data[Index]['menuID'])));
                              
                             },
                             child: Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Container(
                                 
                                 decoration: BoxDecoration(
                                   borderRadius: BorderRadius.circular(7),
                                   boxShadow: [BoxShadow(
                                     color: Colors.grey,
                                     spreadRadius: 3,blurRadius: 10
                                   )],
                                   color: Colors.teal,
                                 ),
                                 
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(top: 25,bottom: 10),
                                       child: Icon(IconData(data[Index]['image'],fontFamily: 'MaterialIcons'),color: Colors.white,size: 50,),
                                       
                                     ),
                                     Flexible(
                                       child: Text(data[Index]['menuName'], textAlign: TextAlign.center,style: TextStyle(fontSize: 15,color: Colors.white,fontWeight:FontWeight.w900 ),)),
                                     //Text(' Details',style: TextStyle(fontSize: 14,color: Colors.grey,fontWeight:FontWeight.w900 ),)
                                   ],
                                 ),
                               ),
                             ),
                           ),
            ),
          );
        },
      ),
    ),
      ),
      );
    
    
  }
}
import 'package:flutter/material.dart';
import 'package:pura/HomeScreen.dart';
import 'package:pura/Payment.dart';

import 'DashBoard.dart';
import 'constant.dart';

class Details extends StatefulWidget {
  final String title;
  final param;
  Details({Key? key,required this.title, this.param}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  String? _status;
  List<dynamic> data = [];
  bool isLoading = true;
  
  _menuFetch()async{
   await db.open();
   var coll = db.collection('submenus');
   var res =await coll.find({'mainmenu':widget.param,"isActive":1}).toList();
   if(res == null){
    _status = 'No data';
   }else{
    // print(data[Index]['menuID']);
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
    print(widget.title);
    print(widget.param);
    // _getFirebaseUser();
    _menuFetch();
    }
  @override
   Widget build(BuildContext context) {
    return 
    isLoading == true?Center(child: CircularProgressIndicator(color: Colors.teal,)):
   
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
              //height: MediaQuery.of(context).size.height * 0.30,
             // width: 100,
              child: InkWell(
                             onTap: (){
                              if(data[Index]['menuID']=='paan'){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(pageIndex:5,param:data[Index]['menuID'])));;

                              }else{
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(pageIndex:7,param:data[Index]['menuID'])));;

                              }
                             },
                             child: Padding(
                               padding: const EdgeInsets.all(5.0),
                               child: Container(
                                 height: 500,
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
                                       padding: const EdgeInsets.only(bottom: 4),
                                       child: isLoading == true?CircularProgressIndicator(color:Colors.white): Image.network(data[Index]['image'],
                                       width: MediaQuery.of(context).size.width,
                                       height: 90,
                                       fit: BoxFit.fill,
       
                                 alignment: Alignment.center,)
                                       
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
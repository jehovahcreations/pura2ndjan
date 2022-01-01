import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'DashBoard.dart';
import 'HomeScreen.dart';
import 'constant.dart';
import 'idcard.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:swipe_image_gallery/swipe_image_gallery.dart';

class Dash extends StatefulWidget {
  Dash({Key? key}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {

  int _index = 0; 
String? _status;
  List<dynamic> data = [];
  bool isLoading = false;
  String? image;
  int? point;
  String? description;
  String? specifications;
  String? target_Audience;
  String? url;
  String? work;
  String? condition;
  String? terms;
  String? dataval;
  int? statusD;
  String? name;
  String? date;
  int? monthtarget;
  int? todaytarget;
  int? mtarget;
  int? network;
  int? pending;
  int? approved;
  List<dynamic> _update = [];
  List<int> pointt = [];
  List<int> result = [];
 TextEditingController _dataval = TextEditingController();
 List<dynamic> banner1 = [];
 bool Loading = true;
   
    
  void _menuFetch123()async{
   // print('objectcharan');
   //print('namee ${sp.getString('phone')}');
  await db.open();
   var coll88 = db.collection('users');
   var res88 =await coll88.findOne({'phone':sp.getString('phone'),'isActive':1});
   
   if(res88 == null){
    _status = 'No data';
   }else{
   //  print(res);
     setState(() {
       name = res88['name'];
       date = res88['Date'].toString().substring(0, 10);
       monthtarget =res88['target'];
       sp.setString('pname', name!);
       sp.setString('img', res88['photo']);
       sp.setString('address', res88['address']);
       sp.setString('datee', res88['Date'].toString().substring(0, 10));
       sp.setString('sign', res88['signature']);
      
       
     });
    
   // print(monthtarget.toString());
   }
    var coll = db.collection('banners');
     var res = await coll.find({'isActive':1}).toList();
     setState(() {
       banner1 = res;
     });
     print('banner1 ${res}');
  
   
 //  DateTime date = DateTime.now();
//DateTime formattedDate = "${date.year}-${date.month}-${date.day}";
  DateTime now = DateTime.now();
   var coll1 = db.collection('banks');
   var res1 =await coll1.find({'user':sp.getString('phone'),'date': {r'$gt': DateTime(now.year, now.month, now.day).toUtc()}}).toList();
   if(res1 == null){
    _status = 'No data';
   }else{
    
    var sum = 0;
  //ar given_list = [1, 2, 3, 4, 5];

  for (var i = 0; i < res1.length; i++) {
    sum += res1[i]['point'] as int;
  }
   setState(() {
     todaytarget = sum;
   });
   }
  // DateTime now = DateTime.now();
   var coll2 = db.collection('banks');
   var res2 =await coll2.find({'user':sp.getString('phone'),'date': {r'$gt': DateTime(now.year, now.month,01).toUtc()}}).toList();
   print(res2);
   if(res2 == null){
    _status = 'No data';
   }else{
    
    var sum1 = 0;
  //ar given_list = [1, 2, 3, 4, 5];

  for (var i = 0; i < res2.length; i++) {
    sum1 += res2[i]['point'] as int;
  }
  print(sum1);
   setState(() {
     mtarget = sum1;
   });
   }
   var coll3 = db.collection('networks');
   var res3 =await coll3.find({'parent':sp.getString('phone'),'date': {r'$gt': DateTime(now.year, now.month,01).toUtc()}}).toList();
   print(DateTime(now.year, now.month,01).toUtc());
   if(res3 == null){
    _status = 'No data';
   }else{
    
    var sum2 = 0;
  //ar given_list = [1, 2, 3, 4, 5];

  for (var i = 0; i < res3.length; i++) {
    sum2 += res2[i]['point'] as int;
  }
   setState(() {
     network = sum2;
   });
   }
   var coll5 = db.collection('banks');
   var res5 =await coll5.find({'parent':sp.getString('phone'),'point':{r'$lt':4}}).toList();
  // print(DateTime(now.year, now.month,01).toUtc());
   if(res5 == null){
    _status = 'No data';
   }else{
    
    var sum5 = 0;
  //ar given_list = [1, 2, 3, 4, 5];

  for (var i = 0; i < res5.length; i++) {
    sum5 += res5[i]['point'] as int;
  }
   setState(() {
     pending = sum5;
   });
   }
    var coll6 = db.collection('banks');
   var res6 =await coll6.find({'parent':sp.getString('phone'),'point':{r'$gt':3}}).toList();
  // print(DateTime(now.year, now.month,01).toUtc());
   if(res6 == null){
    _status = 'No data';
   }else{
    
    var sum6 = 0;
  //ar given_list = [1, 2, 3, 4, 5];

  for (var i = 0; i < res6.length; i++) {
    sum6 += res6[i]['point'] as int;
  }
   setState(() {
     approved = sum6;
   });
   }
    var coll4 = db.collection('updates');
   var res4 =await coll4.find({'isActive':1}).toList();
  // print(DateTime(now.year, now.month,01).toUtc());
  print(res4);
   if(res4 == null){
    _status = 'No data';
   }else{
   
   setState(() {
     _update = res4;
     Loading = false;
   });
   }


  // print(res1);
await db.close();
  
  }
  @override
  void initState() {
    super.initState();
    
    _menuFetch123();
  // _bannerr();
    }
  int _inde = 0;
  @override
  Widget build(BuildContext context) {
    return 
    Loading == true?
    Center(child: CircularProgressIndicator()):
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height*0.25,
            
            decoration: BoxDecoration(
              color:Colors.teal,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
              boxShadow: [BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, 0),
                  spreadRadius: 5,
                  blurRadius: 10
                )]
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CircleAvatar(
                                    radius: 52,
                                    backgroundColor: Colors.white,
                                    child: CircleAvatar(
                                    radius: 45,
                                    
                                    backgroundImage: Image.memory(
                                    base64Decode(sp.getString('img').toString()),
                                     fit: BoxFit.cover,
                                     ).image,)),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.account_circle,color:Colors.white),
                        SizedBox(width:10),
                        Text(name ?? '',
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                       softWrap: false,
                        style:TextStyle(fontSize: 18,color:Colors.white))
                      ],
                    ),
                    SizedBox(height: 15,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Icon(Icons.description,color:Colors.white),
                        SizedBox(width:10),
                        Text('Field Executive',
                        overflow: TextOverflow.clip,
                        maxLines: 1,
                       softWrap: false,
                        style:TextStyle(fontSize: 18,color:Colors.white))
                      ],
                    ),

                  ],
                )
              ],
            ),
          ),
           Padding(
            padding: const EdgeInsets.only(top:15.0,left:15,right: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width *.35,
                    child: RaisedButton(
                      color: Colors.grey[200],
                      onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:10)));
                      },
                      child: Text('IDCARD',style: TextStyle(color: Colors.teal),)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width *.35,
                    child: RaisedButton(
                      color: Colors.grey[200],
                      onPressed: (){
                         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:11)));
                      },
                      child: Text('Offer letter',style: TextStyle(color: Colors.teal),)),
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('My Achivements.:',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey,fontSize: 20),),
              ],
            ),
          ),
          SizedBox(
          height: 130, // card height
          child: PageView.builder(
            itemCount: 6,
            controller: PageController(viewportFraction: 0.7),
            onPageChanged: (int index) => setState(() => _inde = index),
            itemBuilder: (_, i) {
              return Transform.scale(
                scale: i == _inde ? 1 : 0.9,
                child: 
                    Card(
                      elevation: 8,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child:_inde==0?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.add_alarm,color:Colors.grey[200],size: 80,),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Monthly Target',style:TextStyle(fontSize: 10,color:Colors.teal[300])),
                                    Text(monthtarget.toString(),style:TextStyle(fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))
              
                                  ],
                                ),
                              )
                            ],
                          ),
                        ):
                        _inde==1?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.today,color:Colors.grey[200],size: 80,),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Todays Achivement',style:TextStyle(fontSize: 10,color:Colors.teal[300])),
                                    Text(todaytarget.toString(),style:TextStyle(fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))
              
                                  ],
                                ),
                              )
                            ],
                          ),
                        ):_inde==2?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.monetization_on,color:Colors.grey[200],size: 80,),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Month Achivement',style:TextStyle(fontSize: 10,color:Colors.teal[300])),
                                    Text(mtarget.toString(),style:TextStyle(fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))
              
                                  ],
                                ),
                              )
                            ],
                          ),
                        )
                        
                        :_inde==3?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.pending,color:Colors.grey[200],size: 80,),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Approval Pending',style:TextStyle(fontSize: 10,color:Colors.teal[300])),
                                    Text(pending.toString(),style:TextStyle(fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))
              
                                  ],
                                ),
                              )
                            ],
                          ),
                        ):_inde==4?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.approval,color:Colors.grey[200],size: 80,),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Approved',style:TextStyle(fontSize: 10,color:Colors.teal[300])),
                                    Text(approved.toString(),style:TextStyle(fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))
              
                                  ],
                                ),
                              )
                            ],
                          ),
                        ):_inde==5?Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.network_cell,color:Colors.grey[200],size: 80,),
                              Padding(
                                padding: const EdgeInsets.only(left:15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text('Network Earning',style:TextStyle(fontSize: 10,color:Colors.teal[300])),
                                    Text(network.toString(),style:TextStyle(fontSize: 40,color:Colors.teal,fontWeight: FontWeight.bold))
              
                                  ],
                                ),
                              )
                            ],
                          ),
                        ):null
                      ),
                    )
                 
              );
            },
          ),
        ),
        Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('Latest Updates.:',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey,fontSize: 20),),
              ],
            ),
          ),
      
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
               // height: MediaQuery.of(context).size.height * 0.3,
                decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    spreadRadius: 5,
                    blurRadius: 10
                  )]
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: _update.length,
                        itemBuilder: (BuildContext ctxt, int Index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(_update[Index]['update']),
                            );
                        })
                    ],
                  ),
                ),
            ),
          ),

          Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: banner1.length,
                        itemBuilder: (BuildContext ctxt, int Index) {
                            return Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                children: [
                                  Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(banner1[Index]['link'],textAlign: TextAlign.start, style: TextStyle(color: Colors.grey,fontSize: 20),),
              ],
            ),
          ),

                                  Container(
                                    decoration: BoxDecoration(
                  color:Colors.white,
                  borderRadius:BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    spreadRadius: 5,
                    blurRadius: 10
                  )]
                ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Image.memory(base64Decode(banner1[Index]['image'])),
                                    )),
                                ],
                              )
                            );
                        })
                    ],
                  ),
                ),
         
          SizedBox(height: 50,)
        ],
      )
    );
  }
}
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'DashBoard.dart';
import 'constant.dart';

class Menu extends StatefulWidget {
  Menu({Key? key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String? _image;
  String? _name;
  bool isLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return 
    isLoading == true ?CircularProgressIndicator.adaptive():
    Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
      
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DrawerHeader(
              child: Column(
              children: [
                CircleAvatar(
                                  radius: 52,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                  radius: 45,
                                  
                                  backgroundImage: Image.memory(
                                  base64Decode(sp.getString('img').toString()),
                                   fit: BoxFit.cover,
                                   ).image,)),
                                                                  Expanded(child: Text(sp.getString('pname').toString(),style:TextStyle(color: Colors.white,fontSize: 20))),
                        
              ],
                        ),),

                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:0)));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.home,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Home',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:4)));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.account_box,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Profile',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:2)));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.model_training,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Training',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:10)));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.photo,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('ID Card',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:11)));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.emoji_people,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Offer Letter',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                                                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Dashboard(title: null,pageIndex:3)));

                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.network_cell,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('My Network',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.call,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Enquirey',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.white,height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,top: 8,bottom: 8),
                          child: InkWell(
                            onTap: (){
                              logout(context);
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.logout,color: Colors.white,),
                                SizedBox(width: 10,),
                                Text('Logout',style:TextStyle(color: Colors.white,fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                        Divider(color: Colors.white,height: 3,),
                        
                               //SizedBox(height: 10,),
                               
          ],
        )
        
        ),
    );
  }
}
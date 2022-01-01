import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pura/terms.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class Confirm extends StatefulWidget {
  Confirm({Key? key}) : super(key: key);

  @override
  _ConfirmState createState() => _ConfirmState();
}

class _ConfirmState extends State<Confirm> {
   var _status = '';
   String? _referal;
   String? _name;
   String? _email;
   String? _address;
   String? _bank;
   String? _account;
   String? _ifsc;
   String? _addressid;
   String? _idid;
   String? _adressproof;
   String? _idproof;
   String? _photo;

   

  _register()async{
     final perfs = await SharedPreferences.getInstance();
     setState(() {
       _referal = perfs.getString('referal');
       _name = perfs.getString('name');
       _email = perfs.getString('email');
       _address = perfs.getString('address');
       _bank = perfs.getString('bankname');
       _account = perfs.getString('account');
       _ifsc = perfs.getString('ifsc');
       _adressproof = perfs.getString('addressproof');
       _idproof = perfs.getString('idproof');
       _photo = perfs.getString('photo');
       _addressid = perfs.getString('adressid');
       _idid = perfs.getString('idid');
       
       
     });
    
  }
  @override
  void initState() {
    super.initState();
    _register();
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children:[ 
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ 
                    Image.asset('assets/logo/logo.png',height:100),
                    
                    Text('PURA',style: TextStyle(color: Colors.white, fontSize:60,fontWeight: FontWeight.w700),),
                    ])),
              
              Padding(padding: EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      mainAxisSize: MainAxisSize.max,
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Text('Confirm details',style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Text('Name : ${_name}')),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Text('Email : ${_email}')),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Text('Address : ${_address}')),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Text('Bank : ${_bank}')),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Text('Account No : ${_account}')),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Text('IFSC : ${_ifsc}')),),),
                        Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(
                            title: Column(
                              children: [
                                Text('Address Proof : ${_addressid}'),
                                Container(
                                  height: 250,
                                  child: Image.memory(base64Decode(_adressproof!),))
                              ],
                            )
                            
                            ),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Column(
                            children: [
                              Text('ID proof : ${_idid}'),
                              Container(
                                height: 250,
                                child: Image.memory(base64Decode(_idproof!)))
                            ],
                          )),),),
                          Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                        child: Card(
                          color: Colors.grey[200],
                          child: ListTile(title: Column(
                            children: [
                              Text('Photo : '),
                              Container(
                                height: 250,
                                child: Image.memory(base64Decode(_photo!)))
                            ],
                          )),),),
                        
                        
                          Center(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('I confirm the above mentioned Details are correct as per my Knowledge'),
                            )
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Terms()));
    
                            },
                            color: Colors.teal,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Next',style: TextStyle(color: Colors.white),),
                                  Icon(Icons.skip_next,color: Colors.white,)
                                ],
                              ),
                            ),),
                          )
                          
                          
                      ],
                    ),
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
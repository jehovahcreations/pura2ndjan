import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pura/terms.dart';

import 'constant.dart';

class Profile extends StatefulWidget {
  Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
   bool isLoading = true;

   

  _register()async{
    await db.open();
    var coll = db.collection('users');
    var res = await coll.findOne({'phone':sp.getString('phone')});
    if(res == null){
      
    }else{
    setState(() {
     
       _referal = res['referal'];
       _name = res['name'];
       _email = res['email'];
       _address = res['address'];
       _bank = res['bankname'];
       _account = res['account'];
       _ifsc = res['ifsc'];
       _adressproof = res['adressproof'];
       _idproof = res['idproof'];
       _photo = res['photo'];
       _addressid = res['adressid'];
       _idid = res['idid'];
       isLoading = false;
       
       
     });
    
  }
  }
  @override
  void initState() {
    super.initState();
    _register();
  }
  @override
  Widget build(BuildContext context) {
   return isLoading == true?Center(child: CircularProgressIndicator(color: Colors.teal,)): SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children:[ 
            
            
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
                          child: Text('My Profile',style: TextStyle(color: Colors.teal,fontSize: 20,fontWeight: FontWeight.bold),),
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
                              Image.memory(base64Decode(_adressproof.toString()))
                            ],
                          )
                          
                          ),),),
                        Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                      child: Card(
                        color: Colors.grey[200],
                        child: ListTile(title: Column(
                          children: [
                            Text('ID proof : ${_idid}'),
                            Image.memory(base64Decode(_idproof.toString( )))
                          ],
                        )),),),
                        Padding(padding: EdgeInsets.only(left:8,right: 8,top: 8),
                      child: Card(
                        color: Colors.grey[200],
                        child: ListTile(title: Column(
                          children: [
                            Text('Photo : '),
                            Image.memory(base64Decode(_photo!))
                          ],
                        )),),),
                      
                      
                        

                      
                        
                    ],
                  ),
                ),
              ))
            ]),
      
    );
  }
}
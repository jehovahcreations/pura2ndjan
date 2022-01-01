import 'dart:convert';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:flutter/material.dart';
import 'package:pura/parent.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'dart:ui' as ui;

import 'constant.dart';
import 'login.dart';
class Signature extends StatefulWidget {
  Signature({Key? key}) : super(key: key);

  @override
  _SignatureState createState() => _SignatureState();
}

class _SignatureState extends State<Signature> {
   var _status = '';
   String? _signature;
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
   String? _password;
   bool isLoading = false;

final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
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
       _password = perfs.getString('password');
       
       
     });
    
  }
  @override
  void initState() {
    super.initState();
    _register();
  }
  _submit()async{

    setState(() {
      isLoading = true;
    });
     final perfs = await SharedPreferences.getInstance();
   // var plainPassword = _password;
  //  var hashedPassword = new DBCrypt().hashpw(plainPassword!, new DBCrypt().gensalt());
    await db.open();
    var coll = db.collection('users');
    var res = await coll.insertOne({'role':'Emp','phone':perfs.getString('phone'),'parent':_referal,'name':_name,'email':_email,'address':_address,'bank':_bank,'account':_account,'ifsc':_ifsc,'addType':_addressid,'idType':_idid,'adressproof':_adressproof,'idproof':_idproof,'photo':_photo,'signature':_signature,'isActive':1,'balance':0,'pending':0,'paid':0,'points':0,'Date':DateTime.now().toUtc(),'target':300});
    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
    await db.close();
    setState(() {
      isLoading = false;
    });

}

  
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.teal[800],
      body:isLoading == true?Center(
        child: CircularProgressIndicator(color: Colors.white,),
      ): Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children:[ 
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[ 
                    Image.asset('assets/logo/logo.png',height:100),
                    
                    Text('PURA',style: TextStyle(color: Colors.white, fontSize:60,fontWeight: FontWeight.w700),),
                    ])),

                    SizedBox(height: 50,),
                    Center(
                      child: Container(
                        padding: EdgeInsets.only(left:80,right: 50),
                        child: Text('Please sign using your finger an the white box',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize:18, ),),
                      ),
                    ),
                    SizedBox(height: 50,),

                    
              
              Padding(padding: EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                       Container(
          child: SfSignaturePad(
            key: _signaturePadKey,
            backgroundColor: Colors.grey[200],
          ),
          height: 200,
          width: 300,
        ),
        SizedBox(height: 40,),
        RaisedButton(
          color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Save Signature",style:TextStyle(color:Colors.teal,fontSize: 20,fontWeight: FontWeight.bold)),
            ),
            onPressed: () async {
            final data =
        await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
       final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
       final b64 = bytes!.buffer.asUint8List();
       final rr = base64Encode(b64);
       setState(() {
         _signature =rr;
       });

       _submit();
            }),
                     
                    ],
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
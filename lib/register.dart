import 'package:flutter/material.dart';
import 'package:dbcrypt/dbcrypt.dart';
import 'package:pura/Bank.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';
import 'login.dart';

class Register extends StatefulWidget {
  Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _address = TextEditingController();
 // TextEditingController _cpassword = TextEditingController();
  var _status = '';

  _register()async{
    final perfs = await SharedPreferences.getInstance();
    if(_name.text == '' || _email.text == '' || _address.text == '' ){
      setState(() {
        _status = 'Please fill all fields';
        
      });
    } 
      else{
        perfs.setString('name', _name.text);
        perfs.setString('email', _email.text);
        perfs.setString('address', _address.text);

       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Bank()));
      }
    
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('-------- Register --------',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Text(_status,style:TextStyle(color:Colors.white)),
                    SizedBox(height: 40,),
                    TextField(
                      controller: _name,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Name',
                        labelText: 'Enter Name'
                        ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _email,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Email',
                        labelText: 'Enter Email'
                        ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _address,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Address',
                        labelText: 'Enter Address'
                        ),
                    ),
                    
                    SizedBox(height: 20,),
                    FlatButton(
                      onPressed: (){
                        _register();
                      }, 
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Next',style: TextStyle(fontSize: 20,color: Colors.teal),),
                            SizedBox(width: 20,),
                            Icon(Icons.skip_next,color: Colors.teal,)
                          ],
                        ),
                      ),
                      color: Colors.white,
                      minWidth: 400,),
                      SizedBox(height: 20,),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
        
                            Text(
                                   'Alredy have account | ',
                                   style: TextStyle(fontSize: 18),
                                 ),
                            
                            TextButton(
                                 onPressed: () {
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Login()));
                                 },
                                 style: TextButton.styleFrom(
                                   primary: Colors.white,
                                 ),
                                 child: Text(
                                   'Signin',
                                   style: TextStyle(fontSize: 18),
                                 ),
                               )
        
                          ]
                        ),
                      )
        
        
                  ],
                ))
              ]),
        ),
      ),
    );
  }
}
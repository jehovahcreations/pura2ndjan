import 'package:flutter/material.dart';
import 'package:pura/Proof.dart';
import 'package:pura/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Bank extends StatefulWidget {
  Bank({Key? key}) : super(key: key);

  @override
  _BankState createState() => _BankState();
}

class _BankState extends State<Bank> {
    TextEditingController _bankname = TextEditingController();
  TextEditingController _account = TextEditingController();
  TextEditingController _ifsc = TextEditingController();
 // TextEditingController _cpassword = TextEditingController();
  var _status = '';

  _register()async{
    final perfs = await SharedPreferences.getInstance();
    if(_bankname.text == '' || _account.text == '' || _ifsc.text == '' ){
      setState(() {
        _status = 'Please fill all fields';
        
      });
    } 
      else{
        perfs.setString('bankname', _bankname.text);
        perfs.setString('account', _account.text);
        perfs.setString('ifsc', _ifsc.text);

       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Proof()));
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
                    Text('-------- Bank Details --------',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Text(_status,style:TextStyle(color:Colors.white)),
                    SizedBox(height: 40,),
                    TextField(
                      controller: _bankname,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Bank Name',
                        labelText: 'Enter Bank Name'
                        ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _account,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter Account Number',
                        labelText: 'Enter Account Number'
                        ),
                    ),
                    SizedBox(height: 20,),
                    TextField(
                      controller: _ifsc,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter IFSC Code',
                        labelText: 'Enter IFSC Code'
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
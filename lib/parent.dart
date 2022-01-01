import 'package:flutter/material.dart';
import 'package:pura/constant.dart';
import 'package:pura/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Proof.dart';
import 'login.dart';

class Parent extends StatefulWidget {
  Parent({Key? key}) : super(key: key);

  @override
  _ParentState createState() => _ParentState();
}

class _ParentState extends State<Parent> {
    TextEditingController _refferal = TextEditingController();
  
  var _status = '';
  bool isLoading = false;

  _register()async{
    setState(() {
      isLoading = true;
    });
    final perfs = await SharedPreferences.getInstance();
    if(_refferal.text == ''){
      setState(() {
        _status = 'Please fill all fields';
        
      });
       setState(() {
      isLoading = false;
    });
    } 
      else{
       if(_refferal.text =='PURA'){
         perfs.setString('referal', '8862024123');
         Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));
       }else{
         await db.open();
         var coll = db.collection('users');
         var res = await coll.findOne({'phone':_refferal.text});
         if(res !=null){
                     perfs.setString('referal', _refferal.text);
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));

          
         }else{
           setState(() {
             _status = 'Wrong Referal, Try again !!';
           });
         }
         await db.close();

       }
        
     //  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Proof()));
      }
       setState(() {
      isLoading = false;
    });
    
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.teal[800],
      body:isLoading == true? Center(
        child: CircularProgressIndicator(color: Colors.teal,),
      ): Center(
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
                    Text('-------- Referal --------',style: TextStyle(fontSize: 20),),
                    SizedBox(height: 20,),
                    Text(_status,style:TextStyle(color:Colors.white)),
                    SizedBox(height: 40,),
                    Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:[
        
                            Text(
                                   'If you dont have a referal ID use | ',
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
                                   'PURA',
                                   style: TextStyle(fontSize: 18),
                                 ),
                               )
        
                          ]
                        ),
                      ),
                      SizedBox(height: 40,),
                    TextField(
                      controller: _refferal,
                      autofocus: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Enter your referal ID',
                        labelText: 'Enter your referal ID'
                        ),
                    ),
                    
                    
                    SizedBox(height: 50,),
                    
                      SizedBox(height: 40,),
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
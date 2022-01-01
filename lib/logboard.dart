import 'package:flutter/material.dart';
import 'package:pura/parent.dart';
import 'package:pura/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'login.dart';

class LogBoard extends StatefulWidget {
  LogBoard({Key? key}) : super(key: key);

  @override
  _LogBoardState createState() => _LogBoardState();
}

class _LogBoardState extends State<LogBoard> {
   var _status = '';

  _register()async{
     final perfs = await SharedPreferences.getInstance();
    // if(_bankname.text == '' || _account.text == '' || _ifsc.text == '' ){
    //   setState(() {
    //     _status = 'Please fill all fields';
        
    //   });
    // } 
    //   else{
    //     perfs.setString('name', _bankname.text);
    //     perfs.setString('email', _account.text);
    //     perfs.setString('address', _ifsc.text);

    //    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Proof()));
    //   }
    
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
      backgroundColor: Colors.teal[800],
      body: Center(
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
              
              Padding(padding: EdgeInsets.all(25),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Parent()));
                                },
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: MediaQuery.of(context).size.height*0.20,
                                  
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:15),
                                        child: Icon(Icons.work_rounded,size: 70,color: Colors.teal,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Employment',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                          
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: MediaQuery.of(context).size.height*0.20,
                                  
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:15),
                                        child: Icon(Icons.home_work_rounded,size: 70,color: Colors.teal,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Freelancer',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                          
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: MediaQuery.of(context).size.height*0.20,
                                  
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:15),
                                        child: Icon(Icons.business_center_rounded,size: 70,color: Colors.teal,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('B2B',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                          
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: InkWell(
                                onTap: (){},
                                child: Container(
                                  width: MediaQuery.of(context).size.width*0.4,
                                  height: MediaQuery.of(context).size.height*0.20,
                                  
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8)
                                  ),
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top:15),
                                        child: Icon(Icons.add_business,size: 70,color: Colors.teal,),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Franchisee',style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight: FontWeight.bold),),
                                      )
                                    ],
                                  ),
                          
                                ),
                              ),
                            ),
                          ),
                        ],
                      )      
                    ],
                  ),
                ))
              ]),
        ),
      ),
    );
  }
}
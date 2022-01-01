import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pura/constant.dart';
import 'package:pura/signature.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Terms extends StatefulWidget {
  Terms({Key? key}) : super(key: key);

  @override
  _TermsState createState() => _TermsState();
}

class _TermsState extends State<Terms> {
 List<dynamic> data=[];
  int _index = 0;
  bool _isLoading = true;
  var heading = '';


  @override
  _newupdate()async{
   // print(widget.title);
    await db.open();
    var coll = db.collection('terms');
    var res = await coll.find().toList();
   
    setState(() {
      data = res;
    });
    print(data);
    await db.close();

  }
  
  @override
  void initState() {
    super.initState();
    // _getFirebaseUser();
    _newupdate();
    
    
  }

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

                    SizedBox(height: 20,),
     // drawer: drawercode(),
     // appBar: myAppBar(context,heading,'images/CELogo.jpeg'),
      //backgroundColor: Colors.teal,
      Padding(
        padding: EdgeInsets.all(25),
        //child: ListView.builder(itemBuilder: itemBuilder)
        child:SingleChildScrollView(
          child: Container(
             decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.white,
                       ),
            //color: Colors.white,
            child: Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                          itemCount: data.length,
                  //         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  // crossAxisCount:  1,),
                 //  childAspectRatio: MediaQuery.of(context).size.width /
                 //   (MediaQuery.of(context).size.height / 4),),
                  
                  itemBuilder: (BuildContext ctxt, int Index) {
                     return SingleChildScrollView(
                       child: IntrinsicHeight(
                         child: Container(
                           
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             color: Colors.white,
                           ),
                           //height: 200,
                       
                          
                           child: Column(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             children: [
                               SizedBox(height:30),
                               Container(
                                      //height: MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width*0.8,
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20))),
                                      child: Padding(
                                        padding: const EdgeInsets.only(top:8.0,bottom: 8,left: 30),
                                        child: Text(data[Index]['name'],style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold),),
                                      )),
                            
                                  
                                  
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Text(data[Index]['text'],style: TextStyle(color: Colors.grey,fontSize: 16,fontStyle: FontStyle.italic),),
                                  ),  
                                   ],
                           ),
                           ),
                       ),
                       
                     ); 
                  },
                ),
                SizedBox(height: 20,),
                Center(
                            child:Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('By clicking next button, I agree the above mentioned Terms & Conditions',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.teal),),
                            )
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: RaisedButton(onPressed: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Signature()));
    
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
        ),
        ),]))
          )
    );
  }
}

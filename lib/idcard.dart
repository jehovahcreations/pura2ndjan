import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:pdfdownload/pdfdownload.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

import 'constant.dart';

class Idcard extends StatefulWidget {
  Idcard({Key? key}) : super(key: key);

  @override
  _IdcardState createState() => _IdcardState();
}

class _IdcardState extends State<Idcard> {
 String? urll='0';
 var url = '';
  ScreenshotController screenshotController = ScreenshotController(); 
  final _id ='SJM'+sp.getString('phone')!.substring(5, 10);
 
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Screenshot(
    controller: screenshotController,
            child: Stack(
              children: [
               Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height *.75,
                decoration:BoxDecoration(
                  color:Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 3,
                    blurRadius: 3
                  )],
                  borderRadius: BorderRadius.circular(10)
                ),
                
                child: Column(
                  children: [
                    Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height *0.3,
                    decoration:BoxDecoration(
                      color:Colors.teal,
                      boxShadow: [BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 3,
                        blurRadius: 3
                      )],
                      borderRadius: BorderRadius.only(
                        topLeft:Radius.circular(10.0),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50)),
                    ),
                    
                    child: Column(
                      children: [
                        Text('PURA',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize:80,fontWeight: FontWeight.w700)),
                        
                        Text('SOCIAL JUSTICE MOVEMENT',textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize:15,fontWeight: FontWeight.w700),),
                        Padding(
                          padding: const EdgeInsets.only(left:130.0),
                          child: Text('BK/4/17/2021',textAlign: TextAlign.right, style:TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize:10)),
                        ),
          
                             ],
                    ),
                    
                    ),
              
              
                  ],
                ),
              ),
              
              Column(
                children: [
                  new Container(
                      alignment: Alignment.topCenter,
                      padding: new EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * .15,
                          right: 20.0,
                          left: 20.0),
                          decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                      child: new Container(
                        height: 200.0,
                        width: MediaQuery.of(context).size.width *0.4,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle
                        ),
                        
                        child:  CircleAvatar(
                                            radius: 80,
                                            backgroundColor: Colors.white,
                                            child: CircleAvatar(
                                            radius: 70,
                                            
                                            backgroundImage: Image.memory(
                                            base64Decode(sp.getString('img').toString()),
                                             fit: BoxFit.cover,
                                             ).image,)),
                      ),
                    ),
          
                    Center(child: Text('ID CARD',style:TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize:18)),),
                    
                ],
              ),
              
              Padding(
                padding: const EdgeInsets.only(left: 40,right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.5,),
                    Text('ID No.: ${_id.toString()}',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:15)),
                    SizedBox(height: 8,),
                    Text('Name.: ${sp.getString('name')}',textAlign: TextAlign.start,style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:15)),
                    SizedBox(height: 8,),
                    Text('Phone.: ${sp.getString('phone')}',style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:15)),
                    SizedBox(height: 8,),
                    Text('Address.: ${sp.getString('address')}',style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:15)),
                  ],
                ),
              ),
              ]
            ),
            
          ),
          SizedBox(height: 40),
          urll =='0'?
          Container(
            width: MediaQuery.of(context).size.width,
            child: RaisedButton(
              color: Colors.teal,
              child: Text('Download',style: TextStyle(color: Colors.white),),
              onPressed: (){
            //  _capture();
              screenshotController
                    .capture(delay: Duration(milliseconds: 10))
                    .then((capturedImage) async {
                  //ShowCapturedWidget(context, capturedImage!);
                  setState(() {
        //_imageFile = capturedImage!;
    });
     final pdf = pw.Document();
   final image = pw.MemoryImage(
capturedImage!
);

pdf.addPage(pw.Page(build: (pw.Context context) {
  return pw.Center(
    child: pw.Image(image),
  ); // Center
}));
Directory tempDir = await getTemporaryDirectory();
String tempPath = tempDir.path;
final file = File('/storage/emulated/0/Android/data/com.example.pura/files/idcard.pdf');
print(file);
  await file.writeAsBytes(await pdf.save()); 
  setState(() {
    urll = '1';
    url = file.toString();
  });
 
 
    
                }).catchError((onError) {
                  print(onError);
                });
              
                
            }
            )):Container(
              decoration: BoxDecoration(
                  color:Colors.grey[200],
                  borderRadius:BorderRadius.circular(20),
                  boxShadow: [BoxShadow(
                    color: Color.fromRGBO(0, 0, 0, 0.16),
                    spreadRadius: 5,
                    blurRadius: 10
                  )]
                ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text('PDF Downloaded @ ${url}',style: TextStyle(color: Colors.teal),),
              )),
        ],
      ),
    );
  }
}
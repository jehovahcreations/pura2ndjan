import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:pdf/widgets.dart' as pw;
import 'constant.dart';

class Offer extends StatefulWidget {
  Offer({Key? key}) : super(key: key);

  @override
  _OfferState createState() => _OfferState();
}

class _OfferState extends State<Offer> {
  final _id ='SJM'+sp.getString('phone')!.substring(5, 10);
   String? urll='0';
 var url = '';
  ScreenshotController screenshotController = ScreenshotController(); 
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Screenshot(
          controller: screenshotController,
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text('PURA', style: TextStyle(color: Colors.teal, fontSize:40,fontWeight: FontWeight.w700)),
                                    
                                    Text('SOCIAL JUSTICE MOVEMENT',textAlign: TextAlign.end, style: TextStyle(color: Colors.teal, fontSize:8,fontWeight: FontWeight.w700),),
                                    Padding(
                                      padding: const EdgeInsets.only(left:130.0),
                                      child: Text('BK/4/17/2021',textAlign: TextAlign.end, style:TextStyle(color: Colors.teal,fontWeight: FontWeight.bold,fontSize:9)),
                                    ),
                      
                                         ],
                                ),
                    ),
          
                    SizedBox(height: 19,),
          
                    Center(child: Text('Offer Letter',textAlign: TextAlign.center, style: TextStyle(color: Colors.grey, fontSize:18,fontWeight: FontWeight.w700),)),
                    SizedBox(height: 25,),
                    Text('We SOCIAL JUSTICE MOVEMENT is happy to hire you Mr.${sp.getString('name')} as a Field Executive',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    SizedBox(height: 15,),
                    Text('Your employe code.: ${_id.toString()}',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                    Text('Your joining date.: ${sp.getString('datee')}',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                    Text('Your Desigination.: Field Executive',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                    Text('Your Salary.: 15000 INR + Incentives',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                    SizedBox(height: 10,),
                    Text('Role & Responsibilities.:',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                    SizedBox(height: 5,),
                    Text('1. Primary responsibility is to drive sales on PURA partner brands',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
          
                    Text('2. Suggest our partner brand products & Services in the market',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('3. Answers questions from customers about product and service benefits',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('4. Maintains excellent relationships with customers through superior customer service',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('5. Implements and adheres to company policies and procedures',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('6. Should have knowledge on all PURA partner brand product & services',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('7. Finds ways to sell sell partner brand products the market',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('8. Researches client base to find new types of customers and sells them accordingly',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('9. Implementation of Promotions & Campaigning',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('10. Show your eadership qualities while pitching sales on our partner brands',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('11. New initiatives',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    SizedBox(height: 10,),
                    Text('Terms and conditions.:',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                    SizedBox(height: 5,),
                    Text('1. You shall be hired on a Target basis',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('2. Payment will be made based on the number of sales performed and incentive if any, shall be paid as per the policy of the Company',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('3. Company will not be liable for any contingency arising during sales',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('4. If you recognizes any fraud can result in the termination of this contract On behalf of Vistas',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                    Text('4. The slaries will be paid in between 1st and 5th of every month, If u fail to achive your targets the salaries will be calculated on averaging aginst your achivements, Incentive will be calculated as 50 INR agaist each points more than ur targets',textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize:8,fontWeight: FontWeight.w700),),
                     SizedBox(height: 10,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Thanks & Regards',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                              Text('Benet B Antony',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                              Text('President',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                              Text('Social Justice Movement',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
          
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text('Acknowledged by,',textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                              Text(sp.getString('name').toString(),textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                              Image.memory(base64Decode(sp.getString('sign').toString()),height: MediaQuery.of(context).size.height*0.08,),
                              Text(sp.getString('phone').toString(),textAlign: TextAlign.start, style:TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize:10)),
                              
          
                            ],
                          )
          
                        ],
                      ),
                    )
          
          
          
                  ],
                ),
              ),
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
final file = File('/storage/emulated/0/Android/data/com.example.pura/files/offerletter.pdf');
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
              SizedBox(height: 30,)
               ],
      ),
    );
  }
}
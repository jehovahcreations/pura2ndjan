import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

import 'constant.dart';

class Learn extends StatefulWidget {
  Learn({Key? key}) : super(key: key);

  @override
  _LearnState createState() => _LearnState();
}

class _LearnState extends State<Learn> {
  List<dynamic> lurn =[];
  _learn()async{
    await db.open();
    var coll = db.collection('learns');
    var res = await coll.find({'isActive':1}).toList();
    if(res == null){
      
    }else{
    setState(() {
      lurn = res;
    });
    }

  }
  @override
  void initState(){
    super.initState();
  _learn();
  }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(25.0),
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: lurn.length,
          itemBuilder: (BuildContext ctxt, int Index){
            return 
              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Column(
                                  children: [
                                    
                                    Container(
                                      decoration: BoxDecoration(
                    color:Colors.white,
                    borderRadius:BorderRadius.circular(20),
                    boxShadow: [BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.16),
                      spreadRadius: 5,
                      blurRadius: 10
                    )]
                  ),
                                      child: Column(
                                        children: [
                                           Text(lurn[Index]['name'],textAlign: TextAlign.start, style: TextStyle(color: Colors.grey,fontSize: 20),),
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: YoutubePlayerIFrame(
                     controller: YoutubePlayerController(
                     initialVideoId:lurn[Index]['video'],
                     params: YoutubePlayerParams(
                  playlist: [], // Defining custom playlist
                  startAt: Duration(seconds: 0),
                  showControls: true,
                  showFullscreenButton: true,
                     ),
                     ),
                     aspectRatio: 16 / 9,
              ),),
                                        ],
                                      ),
                                      ),
                                  ],
                                )
                              );
              
            
          }),
      ),
    );
  }
}
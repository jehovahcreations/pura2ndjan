import 'package:flutter/material.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';

import 'constant.dart';

class Team extends StatefulWidget {
  Team({Key? key}) : super(key: key);

  @override
  _TeamState createState() => _TeamState();
}

class _TeamState extends State<Team> {
  List<dynamic> lurn =[];
  _learn()async{
    await db.open();
    var coll = db.collection('users');
    var res = await coll.find({'parent':sp.getString('phone')}).toList();
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
    return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: lurn.length,
        itemBuilder: (BuildContext ctxt, int Index){
          return Card(
            child: ListTile(
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.account_circle,size: 15,color: Colors.teal,),
                    SizedBox(width: 5,),
                    Text(lurn[Index]['name'],style: TextStyle(color: Colors.teal,fontSize: 15),),
                  ],
                ),
              ),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Icon(Icons.phone,size: 15,color: Colors.teal,),
                    SizedBox(width: 5,),
                    Text(lurn[Index]['phone'],style: TextStyle(color: Colors.teal,fontSize: 15),),
                  ],
                ),
              ),
              
              ),
          );
        }),
    );
  }
}
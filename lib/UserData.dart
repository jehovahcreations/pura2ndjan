import 'package:flutter/material.dart';
import 'package:pura/DashBoard.dart';
import 'package:pura/Payment.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Proof.dart';
import 'constant.dart';
import 'login.dart';

class UserData extends StatefulWidget {
  final String title;
  final String param;
  UserData({Key? key, required this.title, required this.param})
      : super(key: key);

  @override
  _UserDataState createState() => _UserDataState();
}

class _UserDataState extends State<UserData> {
  TextEditingController _username = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  // TextEditingController _cpassword = TextEditingController();
  var _status = '';
  bool isLoading = false;
  data() async {
    //print('2');
    final perfs = await SharedPreferences.getInstance();

    await db.open();
    var coll = db.collection('banks');
    var coll1 = db.collection('users');
    var coll2 = db.collection('submenus');
    var res = await coll1.findOne({'phone': perfs.getString('phone')});
    if (res == null) {
      setState(() {
        _status = 'Please Login again';
      });
    } else {
      //print(res);
      //print(widget.title);
      var res1 = await coll2.findOne({'menuID': widget.title});
      if (res1 == null) {
        _status = 'Server Down';
      } else {
        //print(res1);
        var res2 = await coll.insertOne({
          "user": perfs.getString('phone'),
          "parent": res['parent'],
          "name": _username.text.toString(),
          "phone": _phone.text.toString(),
          "email": _email.text.toString(),
          "url": res1['url'],
          "isActive": 1,
          "status": 1,
          "point": res1['points'],
          "mainMenu": res1['mainmenu'],
          "subMenu": res1['menuID'],
          "date": DateTime.now()
        });
        //print('done');
        //print(res2);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Dashboard(
                title: widget.title,
                pageIndex: 9,
                param: _phone.text.toString())));
      }
      setState(() {
        isLoading = false;
      });
    }
  }

  _register() async {
    setState(() {
      isLoading = true;
    });
    final perfs = await SharedPreferences.getInstance();
    if (_username.text == '' || _phone.text == '' || _email.text == '') {
      setState(() {
        _status = 'Please fill all fields';
      });
    } else {
      //print('object1');
      data();
      // Navigator.of(context)
      //     .push(MaterialPageRoute(builder: (context) => Proof()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:isLoading ==true?CircularProgressIndicator.adaptive(): Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text(
                      '-------- Customer Details --------',
                      style: TextStyle(fontSize: 20),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(_status, style: TextStyle(color: Colors.teal)),
                    SizedBox(
                      height: 40,
                    ),
                    TextField(
                      controller: _username,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Name',
                          labelText: 'Enter Name'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _phone,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Phone Number',
                          labelText: 'Enter Phone Number'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextField(
                      controller: _email,
                      autofocus: true,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Enter Email',
                          labelText: 'Enter Email'),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    FlatButton(
                      onPressed: () {
                        _register();
                      },
                      child: Container(
                        color: Colors.teal,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Next',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.skip_next,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                      ),
                      color: Colors.white,
                      minWidth: 400,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ))
          ]),
    );
  }
}

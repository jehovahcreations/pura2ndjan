import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:pura/DashBoard.dart';
import 'package:pura/Payment.dart';

import 'Proof.dart';
import 'constant.dart';
import 'login.dart';

class Ploan extends StatefulWidget {
  String title;
  String param;
  Ploan({
    Key? key,
    required this.title,
    required this.param,
  }) : super(key: key);

  @override
  _PloanState createState() => _PloanState();
}

class _PloanState extends State<Ploan> {
  TextEditingController _father = TextEditingController();
  TextEditingController _mother = TextEditingController();
  TextEditingController _dob = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _ref1 = TextEditingController();
  TextEditingController _ref1num = TextEditingController();
  TextEditingController _ref2 = TextEditingController();
  TextEditingController _ref2num = TextEditingController();
  // TextEditingController _dob = TextEditingController();
  // TextEditingController _cpassword = TextEditingController();
  int _radioSelected = 1;
  String? _radioVal = 'Salaried';
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
      print(widget.param);
      print(widget.title);

      var v1 =
          await coll.findOne({"phone": widget.param, "subMenu": widget.title});
      print(v1!);
      if (v1 != null) {
        v1["father"] = _father.text;
        v1["mother"] = _mother.text;
        v1["dob"] = _dob.text;
        v1["address"] = _address.text;
        v1["ref1"] = _ref1.text;
        v1["ref1num"] = _ref1num.text;
        v1["ref2"] = _ref2.text;
        v1["ref2num"] = _ref2num.text;
        v1["salary"] = _radioVal;

        await coll.save(v1);
        if (_radioSelected == 1) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Dashboard(
                    title: widget.title,
                    pageIndex: 16,
                    param: widget.param,
                  )));
        }else{
          if(_radioSelected == 2){

            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Dashboard(
                      title: widget.title,
                      pageIndex: 17,
                      param: widget.param,
                    )));

          }
        }
      }
      // v1["value"] = 31;
      // await coll.save(v1);r
      //print(res1);
      // var res2 = await coll.insertOne({
      //   "user": perfs.getString('phone'),
      //   "parent": res['parent'],
      //   "name": _username.text.toString(),
      //   "phone": _phone.text.toString(),
      //   "email": _email.text.toString(),
      //   "url": res1['url'],
      //   "isActive": 1,
      //   "status": 1,
      //   "point": res1['points'],
      //   "mainMenu": res1['mainmenu'],
      //   "subMenu": res1['menuID'],
      //   "date": DateTime.now()
      // });
      //print('done');
      //print(res2);

      // Navigator.of(context).push(MaterialPageRoute(
      //     builder: (context) => Dashboard(
      //         title: widget.title,
      //         pageIndex: 9,
      //         param: _phone.text.toString())));

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
    if (_father.text == '' || _mother.text == '' || _dob.text == '') {
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
      child: isLoading == true
          ? CircularProgressIndicator.adaptive()
          : Column(
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
                            controller: _father,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Fathername',
                                labelText: 'Father Name'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _mother,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Mother name',
                                labelText: 'Mother name'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _dob,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'DOD: (DD/MM/YYYY)',
                                labelText: 'DOD: (DD/MM/YYYY)'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _address,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Address',
                                labelText: 'Address'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _ref1,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Reference 1 Name',
                                labelText: 'Reference 1 Name'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _ref1num,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Reference 1 Number',
                                labelText: 'Reference 1 Number'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _ref2,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Reference 2 Name',
                                labelText: 'Reference 2 Name'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          TextField(
                            controller: _ref2num,
                            autofocus: false,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                filled: true,
                                fillColor: Colors.white,
                                hintText: 'Reference 2 Number',
                                labelText: 'Reference 2 Number'),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            children: [
                              Text('Salaried'),
                              Radio(
                                value: 1,
                                groupValue: _radioSelected,
                                activeColor: Colors.blue,
                                onChanged: (value) {
                                  setState(() {
                                    _radioSelected = 1;
                                    _radioVal = 'Salaried';
                                  });
                                },
                              ),
                              Text('Self-employed'),
                              Radio(
                                value: 2,
                                groupValue: _radioSelected,
                                activeColor: Colors.pink,
                                onChanged: (value) {
                                  setState(() {
                                    _radioSelected = 2;
                                    _radioVal = 'Self-employed';
                                  });
                                },
                              ),
                            ],
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

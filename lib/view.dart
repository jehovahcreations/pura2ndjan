import 'dart:async';

import 'package:flutter/material.dart';
import 'package:metro_appbar/metro_appbar.dart';
import 'package:flutter_share/flutter_share.dart';
//import 'package:mongo_dart/mongo_dart.dart';
import 'constant.dart';
import 'package:youtube_plyr_iframe/youtube_plyr_iframe.dart';
import 'package:status_change/status_change.dart';

import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';

import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:pura/DashBoard.dart';

import 'package:pura/dash.dart';

class View extends StatefulWidget {
  final param;
  View({Key? key, this.param}) : super(key: key);

  @override
  _ViewState createState() => _ViewState();
}

class _ViewState extends State<View> {
  late Timer _timer;
  int _index = 0;
  String? _status;
  List<dynamic> data = [];
  bool isLoading = true;
  String? image;
  int? point;
  String? description;
  String? specifications;
  String? target_Audience;
  String? url;
  String? work;
  String? condition;
  String? terms;
  String? dataval;
  String? videoo;
  int? statusD;
  bool _enabled = false;
  // var clickid;
  bool isloaded = false;
  var result1;
  List<dynamic> video = [];
  List<dynamic> worki = [];
  TextEditingController _refNum = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pass = TextEditingController();
  TextEditingController _aadhar = TextEditingController();
  TextEditingController _pan = TextEditingController();
  ScrollController _controller = new ScrollController();
  File? _image;
  final picker = ImagePicker();
  bool ref = false;
  bool afront = false;
  bool aback = false;
  bool pfront = false;

  Future<void> share() async {
    await FlutterShare.share(
        title: 'PURA',
        text: 'Click the link',
        linkUrl: url! + sp.getString('phone').toString(),
        chooserTitle: 'PURA');
  }

  Future<void> getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  upload(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload10");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = clickid!.toHexString();

    // send
    var response = await request.send();
    // print(response);
    // if (response.statusCode == 200) {
    //   setState(() {
    //     //imgstatus = true;
    //   });
    // }
    await db.open();
    var coll = db.collection('banks');
    var res = await coll.findOne({"_id": clickid});
    // print(res);
    if (res != null) {
      print('res');
      print(res);

      setState(() {
        afront = true;
        isloaded = false;
        result1 = res;
      });
      // print(result1);
    }

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      // print(value);
    });
  }

  upload1(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload11");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = clickid!.toHexString();

    // send
    var response = await request.send();
    // print(response.statusCode);
    await db.open();
    var coll = db.collection('banks');
    var res = await coll.findOne({"_id": clickid});
    // print(res);
    if (res != null) {
      print('res');
      print(res);

      setState(() {
        aback = true;
        isloaded = false;
        result1 = res;
      });
      // print(result1);
    }

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  upload2(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload12");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = clickid!.toHexString();

    // send
    var response = await request.send();
    // print(response.statusCode);
    await db.open();
    var coll = db.collection('banks');
    var res = await coll.findOne({"_id": clickid});
    // print(res);
    if (res != null) {
      print('res');
      print(res);

      setState(() {
        pfront = true;
        isloaded = false;
        result1 = res;
      });
      // print(result1);
    }

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    // fetch1();
  }

  upload9(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload9");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = clickid!.toHexString();

    // send
    var response = await request.send();
    //print(response.statusCode);
    await db.open();
    var coll = db.collection('banks');
    var res = await coll.findOne({"_id": clickid});
    // print(res);
    if (res != null) {
      print('res');
      print(res);

      setState(() {
        ref = true;
        isloaded = false;
        result1 = res;
      });
      // print(result1);
    }

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  _statusD() async {
    setState(() {
      isLoading = true;
    });
    print(clickid);
    await db.open();
    var coll = db.collection('banks');
    var res = await coll.findOne({"_id": clickid});
    if (res == null) {
      _status = 'Something went Wrong';
    } else {
      setState(() {
        statusD = res['status'];
        isLoading = false;
      });
      print(statusD);
    }
    await db.close();
  }

  _nextpage() async {
    setState(() {
      isLoading = true;
    });
    print(clickid);
    await db.open();
    var coll = db.collection('banks');
    var v1 = await coll.findOne({"_id": clickid});
    print(v1);
    if (v1 == null) {
    } else {
      v1["refNum"] = _refNum.text;
      v1["email"] = _email.text;
      v1["aadhar"] = _aadhar.text;
      v1["pass"] = _pass.text;
      v1["pan"] = _pan.text;
      v1["status"] = 2;
      await coll.save(v1);
      print(v1);
      //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>View()));
      setState(() {
        isLoading = false;
        _index = 3;
      });
      _menuFetch();
    }
    await db.close();
  }

  _menuFetch() async {
    await db.open();
    var coll = db.collection('submenus');
    var res = await coll.findOne({'menuID': widget.param, 'isActive': 1});
    if (res == null) {
      _status = 'No data';
    } else {
      setState(() {
        image = res['image'];
        point = res['points'];
        url = res['url'];
        dataval = res['data'];
        // isLoading = false;
      });

      // print(res);
    }
    var coll1 = db.collection('product_details');
    var res1 = await coll1.findOne({'menuID': widget.param, 'isActive': 1});
    if (res1 == null) {
      _status = 'No data';
    } else {
      setState(() {
        description = res1['Description'];
        specifications = res1['Specifications'];
        target_Audience = res1['Target_Audience'];
        videoo = res1['video'];
        //isLoading = false;
      });

      // print(specifications);
    }
    var coll2 = db.collection('p_executes');
    var res2 = await coll2.findOne({'menuID': widget.param, 'isActive': 1});
    if (res2 == null) {
      _status = 'No data';
    } else {
      setState(() {
        work = res2['work'];
        condition = res2['condition'];
        terms = res2['Terms'];
        // isLoading = false;
      });

      // print(specifications);
    }

    var coll3 = db.collection('shares');
    var res3 =
        await coll3.find({'menuID': widget.param, 'isActive': 1}).toList();
    if (res3 == null) {
      _status = 'No data';
    } else {
      setState(() {
        video = res3;
        // isLoading = false;
      });

      //  print(specifications);
    }
    var coll4 = db.collection('banks');
    var res4 = await coll4.find(
        {'subMenu': widget.param, 'user': sp.getString('phone')}).toList();
    if (res4 == null) {
      _status = 'No data';
    } else {
      setState(() {
        worki = res4;
        isLoading = false;
      });
      await db.close();

      // print(specifications);
    }
  }

  _blablaState() {
    _timer = new Timer(const Duration(seconds: 3), () {
      setState(() => _enabled = true);
    });
  }

  @override
  void initState() {
    super.initState();
    // _getFirebaseUser();
    _menuFetch();
    fetch1();
  }

  fetch1() async {
    setState(() {
      isLoading = true;
    });
    // print(widget.param);
    //print(widget.title);
    await db.open();
    var coll = db.collection('banks');
    var res = await coll.findOne({"_id": clickid});
    // print(res);
    if (res != null) {
      print('res');
      print(res);
      result1 = res;
      // print(result1['aadharback']);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    //RR fetch1();
    return isLoading == true
        ? CircularProgressIndicator(
            color: Colors.teal,
          )
        : Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.1,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey, spreadRadius: 4, blurRadius: 3)
                      ]),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 0;
                            });
                          },
                          child: Ink(
                            color: Colors.blue,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.access_time,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Details',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 1;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.work_outline,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Execute',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 2;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Material',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            setState(() {
                              _index = 3;
                            });
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.signal_wifi_statusbar_null,
                                color: Colors.white,
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Status',
                                style: TextStyle(color: Colors.white),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                _index == 0
                    ? SingleChildScrollView(
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 4,
                                          blurRadius: 3)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                          color: Colors.teal,
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Image.network(
                                              image!,
                                            ),
                                          )),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        color: Colors.teal,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              point.toString(),
                                              style: TextStyle(
                                                  fontSize: 80,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            ),
                                            Text(
                                              'Points',
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                //height: MediaQuery.of(context).size.height,

                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 4,
                                          blurRadius: 3)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Description',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        description ?? 'No DATA',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                //height: MediaQuery.of(context).size.height,

                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 4,
                                          blurRadius: 3)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Specifications',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        specifications ?? 'No DATA',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                //height: MediaQuery.of(context).size.height,

                                decoration: BoxDecoration(
                                    color: Colors.grey[200],
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.grey,
                                          spreadRadius: 4,
                                          blurRadius: 3)
                                    ]),
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        'Target Audience',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.teal,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        target_Audience ?? 'No DATA',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    : _index == 1
                        ? Container(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: MediaQuery.of(context).size.height,

                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 4,
                                            blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: YoutubePlayerIFrame(
                                      controller: YoutubePlayerController(
                                        initialVideoId: videoo.toString(),
                                        params: YoutubePlayerParams(
                                          playlist: [], // Defining custom playlist
                                          startAt: Duration(seconds: 30),
                                          showControls: false,
                                          showFullscreenButton: false,
                                        ),
                                      ),
                                      aspectRatio: 16 / 9,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: MediaQuery.of(context).size.height,

                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 4,
                                            blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'How to work',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          work ?? 'No DATA',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: MediaQuery.of(context).size.height,

                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 4,
                                            blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Rules',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          condition ?? 'No DATA',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  //height: MediaQuery.of(context).size.height,

                                  decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.circular(10),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey,
                                            spreadRadius: 4,
                                            blurRadius: 3)
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          'Terms & Conditions',
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          terms ?? 'No DATA',
                                          style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.grey),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : _index == 2
                            ? SingleChildScrollView(
                                child: Container(
                                  child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: video.length,
                                      itemBuilder:
                                          (BuildContext ctxt, int Index) {
                                        return Padding(
                                          padding: const EdgeInsets.all(20.0),
                                          child: InkWell(
                                            onTap: () {
                                              FlutterShare.share(
                                                  title: 'PURA',
                                                  text: 'Click the link',
                                                  linkUrl:
                                                      'https://www.youtube.com/watch?v=' +
                                                          video[Index]['video']
                                                              .toString(),
                                                  chooserTitle: 'PURA');
                                            },
                                            child: YoutubePlayerIFrame(
                                              controller:
                                                  YoutubePlayerController(
                                                initialVideoId: video[Index]
                                                    ['video'],
                                                params: YoutubePlayerParams(
                                                  playlist: [], // Defining custom playlist
                                                  startAt:
                                                      Duration(seconds: 30),
                                                  showControls: false,
                                                  showFullscreenButton: false,
                                                ),
                                              ),
                                              aspectRatio: 16 / 9,
                                            ),
                                          ),
                                        );
                                      }),
                                ),
                              )
                            : _index == 3
                                ? ListView.builder(
                                    physics: _enabled
                                        ? ClampingScrollPhysics()
                                        : NeverScrollableScrollPhysics(),
                                    controller: _controller,
                                    shrinkWrap: true,
                                    itemCount: worki.length,
                                    itemBuilder:
                                        (BuildContext ctxt, int Index) {
                                      return Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: InkWell(
                                              onTap: () {
                                                if (worki[Index]['status'] !=
                                                    1) {
                                                  setState(() {
                                                    _index = 6;
                                                    clickid =
                                                        worki[Index]['_id'];
                                                    _statusD();
                                                  });
                                                } else {
                                                  if (worki[Index]['status'] ==
                                                      1) {
                                                    // print(worki[Index]['status']);
                                                    setState(() {
                                                      _index = 9;
                                                      clickid =
                                                          worki[Index]['_id'];
                                                    });

                                                    //Navigator.of(context).push(MaterialPageRoute(builder: (context)=>View(param:widget.param)));

                                                  }
                                                }
                                              },
                                              child: Container(
                                                child: Card(
                                                  child: ListTile(
                                                      title: Column(
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .account_circle_outlined,
                                                                color:
                                                                    Colors.teal,
                                                                size: 16,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Text(
                                                                    worki[Index]
                                                                        [
                                                                        'name'],
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    maxLines: 1,
                                                                    softWrap:
                                                                        false,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.phone,
                                                                color:
                                                                    Colors.teal,
                                                                size: 16,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Text(
                                                                    worki[Index]
                                                                        [
                                                                        'phone'],
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    maxLines: 1,
                                                                    softWrap:
                                                                        false,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                Icons.email,
                                                                color:
                                                                    Colors.teal,
                                                                size: 16,
                                                              ),
                                                              Expanded(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left:
                                                                          8.0),
                                                                  child: Text(
                                                                    worki[Index]
                                                                        [
                                                                        'email'],
                                                                    overflow:
                                                                        TextOverflow
                                                                            .fade,
                                                                    maxLines: 1,
                                                                    softWrap:
                                                                        false,
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            14),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      leading: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: CircleAvatar(
                                                            radius: 25,
                                                            backgroundColor:
                                                                Colors.teal,
                                                            child: CircleAvatar(
                                                              radius: 23,
                                                              backgroundImage:
                                                                  Image.network(
                                                                image!,
                                                                fit:
                                                                    BoxFit.fill,
                                                              ).image,
                                                            )),
                                                      ),
                                                      trailing: worki[Index]
                                                                  ['status'] ==
                                                              1
                                                          ? Icon(
                                                              Icons.downloading,
                                                              color:
                                                                  Colors.amber,
                                                              size: 30)
                                                          : worki[Index]['status'] ==
                                                                  2
                                                              ? Icon(Icons.downloading,
                                                                  color: Colors
                                                                      .amber,
                                                                  size: 30)
                                                              : worki[Index]['status'] ==
                                                                      3
                                                                  ? Icon(Icons.done_all,
                                                                      color: Colors
                                                                          .green,
                                                                      size: 30)
                                                                  : worki[Index]['status'] ==
                                                                          4
                                                                      ? Icon(Icons.done_all,
                                                                          color: Colors
                                                                              .green,
                                                                          size:
                                                                              30)
                                                                      : Icon(
                                                                          Icons.cancel,
                                                                          color: Colors.red,
                                                                          size: 30)),
                                                ),
                                              )));
                                    })
                                : _index == 9
                                    ? Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: Colors.grey[200],
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey,
                                                    spreadRadius: 3,
                                                    blurRadius: 3)
                                              ]),
                                          child: Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                SizedBox(
                                                  height: 40,
                                                ),
                                                TextFormField(
                                                  controller: _refNum,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Enter Reference Number',
                                                    labelText:
                                                        'Enter Reference Number',
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: _email,
                                                  decoration: InputDecoration(
                                                    hintText: 'Enter Email',
                                                    labelText: 'Enter Email',
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: _pass,
                                                  decoration: InputDecoration(
                                                    hintText: 'Enter Password',
                                                    labelText: 'Enter Password',
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: _aadhar,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Enter Aadhar Number',
                                                    labelText:
                                                        'Enter Aadhar Number',
                                                  ),
                                                ),
                                                TextFormField(
                                                  controller: _pan,
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        'Enter Pan Number',
                                                    labelText:
                                                        'Enter Pan Number',
                                                  ),
                                                ),

                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Upload Adhard Card Front',
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Colors.teal),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      //Text("Select an image"),
                                                      FlatButton.icon(
                                                          onPressed: () async =>
                                                              await getImage(),
                                                          icon: Icon(Icons
                                                              .upload_file),
                                                          label:
                                                              Text("Browse")),

                                                      FlatButton.icon(
                                                          onPressed: () =>
                                                              upload(_image!),
                                                          icon: Icon(Icons
                                                              .upload_rounded),
                                                          label: Text(
                                                              "Upload now")),
                                                      Container(
                                                        height: 100,
                                                        width: 80,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: afront == false
                                                              ? Text('X')
                                                              : Image.network(
                                                                  imgserver +
                                                                      '${result1['aadhar']}',
                                                                  height: 100,
                                                                ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Upload Adhard Card Back',
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Colors.teal),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      //Text("Select an image"),
                                                      FlatButton.icon(
                                                          onPressed: () async =>
                                                              await getImage(),
                                                          icon: Icon(Icons
                                                              .upload_file),
                                                          label:
                                                              Text("Browse")),

                                                      FlatButton.icon(
                                                          onPressed: () =>
                                                              upload1(_image!),
                                                          icon: Icon(Icons
                                                              .upload_rounded),
                                                          label: Text(
                                                              "Upload now")),
                                                      Container(
                                                        height: 100,
                                                        width: 80,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: aback == false
                                                              ? Text('X')
                                                              : Image.network(
                                                                  imgserver +
                                                                      '${result1['aadharback']}',
                                                                  height: 100,
                                                                ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  'Upload Pan Card',
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Colors.teal),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      //Text("Select an image"),
                                                      FlatButton.icon(
                                                          onPressed: () async =>
                                                              await getImage(),
                                                          icon: Icon(Icons
                                                              .upload_file),
                                                          label:
                                                              Text("Browse")),

                                                      FlatButton.icon(
                                                          onPressed: () =>
                                                              upload2(_image!),
                                                          icon: Icon(Icons
                                                              .upload_rounded),
                                                          label: Text(
                                                              "Upload now")),
                                                      Container(
                                                        height: 100,
                                                        width: 80,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: pfront == false
                                                              ? Text('X')
                                                              : Image.network(
                                                                  imgserver +
                                                                      '${result1['pan']}',
                                                                  height: 100,
                                                                ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                // Text('Enter Reference Number',
                                                //     style: TextStyle(
                                                //         color: Colors.teal,
                                                //         fontSize: 20)),
                                                // SizedBox(
                                                //   height: 30,
                                                // ),

                                                Text(
                                                  'Upload Screen Shot',
                                                  style: TextStyle(
                                                      color: Colors.teal,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          width: 5,
                                                          color: Colors.teal),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    children: [
                                                      //Text("Select an image"),
                                                      FlatButton.icon(
                                                          onPressed: () async =>
                                                              await getImage(),
                                                          icon: Icon(Icons
                                                              .upload_file),
                                                          label:
                                                              Text("Browse")),

                                                      FlatButton.icon(
                                                          onPressed: () =>
                                                              upload9(_image!),
                                                          icon: Icon(Icons
                                                              .upload_rounded),
                                                          label: Text(
                                                              "Upload now")),
                                                      Container(
                                                        height: 100,
                                                        width: 80,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: ref == false
                                                              ? Text(
                                                                  'X',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .red),
                                                                )
                                                              : Image.network(
                                                                  imgserver +
                                                                      '${result1['refimg']}',
                                                                  height: 100,
                                                                ),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 30,
                                                ),
                                                Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: RaisedButton(
                                                      color: Colors.teal,
                                                      onPressed: () {
                                                        _nextpage();
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8.0),
                                                        child: Text('Submit',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white)),
                                                      ),
                                                    ))
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : _index == 6
                                        ? Padding(
                                            padding: const EdgeInsets.all(20.0),
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.grey[200],
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.grey,
                                                        spreadRadius: 3,
                                                        blurRadius: 3)
                                                  ]),
                                              child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      20.0),
                                                  child: Container(
                                                    child: Column(
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text('Customer'),
                                                              Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                      color: Colors
                                                                          .teal,
                                                                    ),
                                                                  )),
                                                              Text('Completed'),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 40,
                                                            child:
                                                                VerticalDivider(
                                                                    color: Colors
                                                                        .teal,
                                                                    thickness:
                                                                        3)),

                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                  'Data Entried'),
                                                              Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                      color: Colors
                                                                          .teal,
                                                                    ),
                                                                  )),
                                                              Text('Completed'),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 40,
                                                            child:
                                                                VerticalDivider(
                                                                    color: Colors
                                                                        .teal,
                                                                    thickness:
                                                                        3)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text(
                                                                  'Verification'),
                                                              Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                      color: statusD ==
                                                                              3
                                                                          ? Colors
                                                                              .teal
                                                                          : statusD == 4
                                                                              ? Colors.teal
                                                                              : Colors.grey,
                                                                    ),
                                                                  )),
                                                              statusD == 3
                                                                  ? Text(
                                                                      'Completed')
                                                                  : statusD == 4
                                                                      ? Text(
                                                                          'Completed')
                                                                      : Text(
                                                                          'Processing'),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                            height: 40,
                                                            child:
                                                                VerticalDivider(
                                                                    color: Colors
                                                                        .teal,
                                                                    thickness:
                                                                        3)),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .all(15.0),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Text('Approval'),
                                                              Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            50),
                                                                    color: Colors
                                                                        .red,
                                                                  ),
                                                                  child:
                                                                      Container(
                                                                    width: 20,
                                                                    height: 20,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              50),
                                                                      color: statusD == 4
                                                                          ? Colors
                                                                              .teal
                                                                          : Colors
                                                                              .grey,
                                                                    ),
                                                                  )),
                                                              statusD == 4
                                                                  ? Text(
                                                                      'Completed')
                                                                  : statusD == 5
                                                                      ? Text(
                                                                          'Rejected')
                                                                      : Text(
                                                                          'Processing'),
                                                            ],
                                                          ),
                                                        ),
                                                        // Container(height: 40, child: VerticalDivider(color: Colors.teal,thickness:3)),
                                                      ],
                                                    ),
                                                  )),
                                            ),
                                          )
                                        : Text('data'),
                SizedBox(
                  height: 30,
                ),
                Container(
                  // color:Colors.teal,
                  width: MediaQuery.of(context).size.width,

                  child: RaisedButton(
                    color: Colors.teal,
                    onPressed: () {
                      share();
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'SHARE LINK',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          );
  }
}

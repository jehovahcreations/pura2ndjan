import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:pura/DashBoard.dart';

import 'package:pura/dash.dart';

import 'constant.dart';
import 'mainmenu.dart';

class Loandoc extends StatefulWidget {
  String title;
  String param;
  
  Loandoc({
    Key? key,
    required this.title,
    required this.param,
    
  }) : super(key: key);

  @override
  _LoandocState createState() => _LoandocState();
}

class _LoandocState extends State<Loandoc> {
  File? _image;
  final picker = ImagePicker();

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
    var uri = Uri.parse(imgserver + "upload");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  upload1(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload1");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

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
    var uri = Uri.parse(imgserver + "upload2");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
    fetch1();
  }

  upload3(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload3");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  upload4(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload4");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  upload5(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload5");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  upload6(File imageFile) async {
    // open a bytestream
    var stream =
        new http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    // get file length
    var length = await imageFile.length();

    // string to uri
    var uri = Uri.parse(imgserver + "upload6");

    // create multipart request
    var request = new http.MultipartRequest("POST", uri);

    // multipart that takes file
    var multipartFile = new http.MultipartFile('myFile', stream, length,
        filename: basename(imageFile.path));

    // add file to multipart
    request.files.add(multipartFile);
    request.fields['phone'] = widget.param;

    // send
    var response = await request.send();
    print(response.statusCode);

    // listen for response
    response.stream.transform(utf8.decoder).listen((value) {
      print(value);
    });
  }

  bool isloaded = false;

  var result1;

  fetch1() async {
    print(widget.param);
    print(widget.title);
    await db.open();
    var coll = db.collection('banks');
    var res =
        await coll.findOne({"phone": widget.param, "subMenu": widget.title});
    // print(res);
    if (res != null) {
      print('res');
      print(res);
      result1 = res;
      print(result1['aadharback']);
    }
    setState(() {
      isloaded = true;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    // fetch();
    fetch1();
    // fetch2();
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Text(
            'Upload Adhard Card Front',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['aadhar'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['aadhar']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Upload Adhard Card Back',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload1(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['aadharback'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['aadharback']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Upload Pan Card',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload2(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['pan'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['pan']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Residence Proof',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '(Leave and License Agreement / Utility Bill (not more than 3 months old) / Passport)',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload3(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['rent'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['rent']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '3 Months Bank Statement',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '(where salary/income is credited)',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload4(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['bs'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['bs']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Salary Slip',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              '(Latest 3 Months SP)',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload5(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['sp'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['sp']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            'Upload Photo',
            style: TextStyle(color: Colors.teal, fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              //Text("Select an image"),
              FlatButton.icon(
                  onPressed: () async => await getImage(),
                  icon: Icon(Icons.upload_file),
                  label: Text("Browse")),

              FlatButton.icon(
                  onPressed: () => upload6(_image!),
                  icon: Icon(Icons.upload_rounded),
                  label: Text("Upload now")),
              isloaded
                  ? Container(
                      height: 100,
                      width: 80,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: result1['photo'] == null
                            ? Text('X')
                            : Image.network(
                                imgserver + '${result1['photo']}',
                                height: 100,
                              ),
                      ),
                    )
                  : CircularProgressIndicator(),
            ],
          ),
          SizedBox(
            height: 40,
          ),
          RaisedButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Dashboard(pageIndex: 1,)));
            },
            color: Colors.teal,
            child: Text('Submit'),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pura/constant.dart';

class Email extends StatefulWidget {
  Email({Key? key}) : super(key: key);

  @override
  _EmailState createState() => _EmailState();
}

class _EmailState extends State<Email> {
  String email = '';
  bool isLoading = false;
  _emails() async {
    setState(() {
      isLoading = true;
    });
    await db.open();
    var coll = db.collection('dummys');
    var res = await coll.findOne({"noos": 1});
    print(res);
    if (res != null) {
      setState(() {
        email = res['emails'];
      });
    }
    setState(() {
      isLoading = false;
    });
  }

  _update() async {
    setState(() {
      isLoading = true;
    });
    await db.open();
    var coll = db.collection('dummys');
    var res = await coll.findOne({"emails": email});

    print(res);
    if (res != null) {
      res["noos"] = 2;
      await coll.save(res);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _emails();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading == true
        ? CircularProgressIndicator()
        : Container(
            child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 150,
                ),
                Card(
                    child: InkWell(
                        onTap: () {
                          Clipboard.setData(
                                  new ClipboardData(text: email))
                                  
                              .then((_) {
                            _update();
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                content: Text('Copied to your clipboard !')));
                          });
                          // Function is executed on tap.
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(email,
                              style: TextStyle(
                                  color: Colors.teal,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold)),
                        ))),
              ],
            ),
          ));
  }
}

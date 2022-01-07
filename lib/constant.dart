import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'login.dart';

//var serverip = "http://34.93.244.100:3000";
var db = Db("mongodb://pura:123456@34.93.244.100/pura?authSource=pura");
var imgserver = 'http://34.93.244.100:3001/';
ObjectId? clickid;
const kTextColor = Color(0xFFFAFAFA);
const deeporange = Colors.deepOrange;
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);
const merchantId = 'NBXLHA89674602386110';
const merchantKey = '@9c3YZKKTvIbWbAa';

FirebaseUser? _firebaseUser;
late SharedPreferences sp;

void logout(BuildContext context) async {
  /// Method to Logout the `FirebaseUser` (`_firebaseUser`)
  try {
    // signout code

    await FirebaseAuth.instance.signOut();
    _firebaseUser = null;
    final perfs = await SharedPreferences.getInstance();
    perfs.clear();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => Login()));
  } catch (e) {
    // _handleError(e);
  }
}

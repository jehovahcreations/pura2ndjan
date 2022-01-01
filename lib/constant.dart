import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mongo_dart/mongo_dart.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'login.dart';
var serverip = "http://192.168.0.103:3000";
var db = Db("mongodb://pura:123456@15.207.216.233/pura?authSource=pura");
ObjectId? clickid;
const kTextColor = Color(0xFFFAFAFA);
const deeporange = Colors.deepOrange;
const kBestSellerColor = Color(0xFFFFD073);
const kGreenColor = Color(0xFF49CC96);

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






  

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:paytm/paytm.dart';
import 'package:pura/constant.dart';

import 'DashBoard.dart';

class Payment extends StatefulWidget {
  final String title;
  final String param;

  Payment({Key? key, required this.title, required this.param})
      : super(key: key);

  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? payment_response;

  //Live
  String mid = merchantId;
  String PAYTM_MERCHANT_KEY = merchantKey;
  String website = "DEFAULT";
  bool testing = false;
  String? status;
  bool isLoading = false;

  //Testing
  // String mid = "TEST_MID_HERE";
  // String PAYTM_MERCHANT_KEY = "TEST_KEY_HERE";
  // String website = "WEBSTAGING";
  // bool testing = true;

  double amount = 1;
  bool loading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(top: 50.0, bottom: 20, left: 20, right: 20),
        child: isLoading == true
            ? CircularProgressIndicator.adaptive()
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Make Payment',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 28, color: Colors.teal),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Make payment of Rs.150 to continue ...',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  // SizedBox(
                  //   height: 10,
                  // ),
                  // payment_response != null
                  //     ? //Text('Response: $payment_response\n')
                  //     : Container(),
//                loading
//                    ? Center(
//                        child: Container(
//                            width: 50,
//                            height: 50,
//                            child: CircularProgressIndicator()),
//                      )
//                    : Container(),
                  RaisedButton(
                    onPressed: () {
                      //Firstly Generate CheckSum bcoz Paytm Require this
                      generateTxnToken(0);
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              child: Image.asset('assets/logo/1657936.png',
                                  height: 50)),
                          Text(
                            "Pay using Wallet",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Firstly Generate CheckSum bcoz Paytm Require this
                      generateTxnToken(1);
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              child: Image.asset(
                                  'assets/logo/12-Reach-NetBanking.png',
                                  height: 50)),
                          Text(
                            "Pay using Net Banking",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Firstly Generate CheckSum bcoz Paytm Require this
                      generateTxnToken(2);
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              child: Image.asset('assets/logo/UPI1.jpeg',
                                  height: 50)),
                          Text(
                            "UPI",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  RaisedButton(
                    onPressed: () {
                      //Firstly Generate CheckSum bcoz Paytm Require this
                      generateTxnToken(3);
                    },
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                              height: 50,
                              child: Image.asset(
                                  'assets/logo/bank_card_logo__7_4x.jpeg',
                                  height: 50)),
                          Text(
                            "Credit Card",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 22,
                                color: Colors.teal,
                                fontWeight: FontWeight.bold),
                          ),
                          Icon(Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ),
                  Text(status ?? '')
                ],
              ),
      ),
    );
  }

  void generateTxnToken(int mode) async {
    print('benet${widget.param}');
    setState(() {
      isLoading = true;
    });
    String orderId = DateTime.now().millisecondsSinceEpoch.toString();

    String callBackUrl = (testing
            ? 'https://securegw-stage.paytm.in'
            : 'https://securegw.paytm.in') +
        '/theia/paytmCallback?ORDER_ID=' +
        orderId;

    //Host the Server Side Code on your Server and use your URL here. The following URL may or may not work. Because hosted on free server.
    //Server Side code url: https://github.com/mrdishant/Paytm-Plugin-Server

    var url = 'https://desolate-anchorage-29312.herokuapp.com/generateTxnToken';

    var body = json.encode({
      "mid": mid,
      "key_secret": PAYTM_MERCHANT_KEY,
      "website": website,
      "orderId": orderId,
      "amount": amount.toString(),
      "callbackUrl": callBackUrl,
      "custId": "122",
      "mode": mode.toString(),
      "testing": testing ? 0 : 1
    });

    try {
      final response = await http.post(
        Uri.parse(url),
        body: body,
        headers: {'Content-type': "application/json"},
      );

      print("Response is");
      print(response.body);
      String txnToken = response.body;
      setState(() {
        payment_response = txnToken;
      });

      var paytmResponse = Paytm.payWithPaytm(
          mId: mid,
          orderId: orderId,
          txnToken: txnToken,
          txnAmount: amount.toString(),
          callBackUrl: callBackUrl,
          staging: testing,
          appInvokeEnabled: false);

      paytmResponse.then((value) async {
        //print(value);
        setState(() {
          loading = false;
        });

        print("Value is ");
        print(value);
        if (value['error']) {
          // payment_response = value['errorMessage'];
          //  print(payment_response);
          setState(() {
            // status = value['response']['STATUS'];
          });
          await db.open();
          var coll = db.collection('banks');
          var v1 = await coll.findOne({"phone": widget.param});
          print('v1${v1}');
          if (v1 == null) {
          } else {
            v1["ORDERID"] = value['response']['ORDERID'].toString();
            v1["RESPCODE"] = value['response']['RESPCODE'].toString();
            v1["RESPMSG"] = value['response']['RESPMSG'].toString();
            v1["STATUS"] = value['response']['STATUS'].toString();
            v1["TXNAMOUNT"] = value['response']['TXNAMOUNT'].toString();
            v1["TXNID"] = value['response']['TXNID'].toString();
            await coll.save(v1);
            setState(() {
              isLoading = false;
            });
          }
        } else {
          if (value['response'] != null) {
            // payment_response = value['response']['STATUS'];
            // print(payment_response);
            await db.open();
            var coll = db.collection('banks');
            var v1 = await coll.findOne({"phone": widget.param.toString()});

            if (v1 == null) {
            } else {
              print('pattu');

              if (value['response'].containsKey('body')) {
                var json = jsonDecode(value['response']['body']);
                print(json);
                print('v3${v1}');
                v1["ORDERID"] = json['txnInfo']['ORDERID'].toString();
                v1["RESPCODE"] = json['txnInfo']['RESPCODE'].toString();
                v1["RESPMSG"] = json['txnInfo']['RESPMSG'].toString();
                v1["STATUS"] = json['txnInfo']['STATUS'].toString();
                v1["TXNAMOUNT"] = json['txnInfo']['TXNAMOUNT'].toString();
                v1["TXNID"] = json['txnInfo']['TXNID'].toString();
                await coll.save(v1);
                setState(() {
                  isLoading = false;
                  payment_response = 'Failed';
                });
                // print('v2${v1}');

              } else {
                print('ststus');
                print(value['response']['STATUS']);
                if (value['response']['STATUS'] == 'TXN_SUCCESS') {
                  v1["ORDERID"] = value['response']['ORDERID'].toString();
                  v1["RESPCODE"] = value['response']['RESPCODE'].toString();
                  v1["RESPMSG"] = value['response']['RESPMSG'].toString();
                  v1["STATUS"] = value['response']['STATUS'].toString();
                  v1["TXNAMOUNT"] = value['response']['TXNAMOUNT'].toString();
                  v1["TXNID"] = value['response']['TXNID'].toString();
                  await coll.save(v1);
                  setState(() {
                    isLoading = false;
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Dashboard(
                          title: widget.title,
                          pageIndex: 12,
                          param: widget.param)));
                }
              }
            }
          }
          setState(() {
            isLoading = false;
          });
          payment_response = "\n" + value.toString();
          // print(payment_response);
        }
      });
    } catch (e) {
      print(e);
      print('kusu');
    }
  }
}

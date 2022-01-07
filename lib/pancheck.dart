import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';
import 'package:webview_flutter_max/platform_interface.dart';
import 'package:webview_flutter_max/webview_flutter.dart';

import 'package:pura/DashBoard.dart';
import 'package:pura/constant.dart';
import 'package:pura/paan.dart';

const String kNavigationExamplePage = '''
<!DOCTYPE html><html>
<head><title>Navigation Delegate Example</title></head>
<body>
<p>
The navigation delegate is set to block navigation to the youtube website.
</p>
<ul>
<ul><a href="https://www.youtube.com/">https://www.youtube.com/</a></ul>
<ul><a href="https://www.google.com/">https://www.google.com/</a></ul>
</ul>
</body>
</html>
''';

class PanV extends StatefulWidget {
  String title;
  String param;
  PanV({
    Key? key,
    required this.title,
    required this.param,
  }) : super(key: key);

  @override
  _PanVState createState() => _PanVState();
}

class _PanVState extends State<PanV> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  String? submenu;
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
  }

  late Uint8List screenshotBytes;
  ScreenshotController screenshotController = ScreenshotController();
  TextEditingController _ref = TextEditingController();
  TextEditingController _aadhar = TextEditingController();
  bool isLoading = false;
  //Uint8List? bytes;
  // R
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Check Credit Score'),
        // This drop down menu demonstrates that Flutter widgets can be shown over the web view.
        actions: <Widget>[
          NavigationControls(_controller.future),
          SampleMenu(_controller.future),
        ],
      ),
      //
      // We're using a Builder here so we have a context that is below the Scaffold
      // to allow calling Scaffold.of(context) so we can show a snackbar.
      body: isLoading == true
          ? CircularProgressIndicator()
          : Container(
              child: Builder(builder: (BuildContext context) {
                return WebView(
                  initialUrl:
                      'https://consumer.experian.in/ECV-OLN/signIn?utm_source=exp_hp&utm_medium=FCRbutton&utm_campaign=FCR_web&_ga=2.251661449.1242189558.1641408380-1677272481.1641408380',
                  javascriptMode: JavascriptMode.unrestricted,
                  onWebViewCreated: (WebViewController webViewController) {
                    // webView = webViewController;
                    _controller.complete(webViewController);
                  },
                  onProgress: (int progress) {
                    print("WebView is loading (progress : $progress%)");
                  },
                  javascriptChannels: <JavascriptChannel>{
                    _toasterJavascriptChannel(context),
                  },
                  navigationDelegate: (NavigationRequest request) {
                    if (request.url.startsWith('https://www.youtube.com/')) {
                      print('blocking navigation to $request}');
                      return NavigationDecision.prevent;
                    }
                    print('allowing navigation to $request');
                    return NavigationDecision.navigate;
                  },
                  onPageStarted: (String url) {
                    print('Page started loading: $url');
                  },
                  onPageFinished: (String url) async {
                    print('Page finished loading: $url');
                    // screenshotBytes = await webView.takeScreenshot();
                  },
                  gestureNavigationEnabled: true,
                );
              }),
            ),
      floatingActionButton: favoriteButton(),
    );
  }

  JavascriptChannel _toasterJavascriptChannel(BuildContext context) {
    return JavascriptChannel(
        name: 'Toaster',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: deprecated_member_use
          Scaffold.of(context).showSnackBar(
            SnackBar(content: Text(message.message)),
          );
        });
  }

  Widget favoriteButton() {
    return FutureBuilder<WebViewController>(
        future: _controller.future,
        builder: (BuildContext context,
            AsyncSnapshot<WebViewController> controller) {
          if (controller.hasData) {
            return FloatingActionButton(
              onPressed: () async {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                        content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextFormField(
                          controller: _ref,
                          decoration: InputDecoration(
                              labelText: "Enter Credit Score",
                              hintText: "Enter Credit Score"),
                        ),
                        // TextFormField(
                        //   controller: _aadhar,
                        //   decoration: InputDecoration(
                        //       labelText: "Enter Aadhar Number",
                        //       hintText: "Aadhar Number"),
                        // ),
                        SizedBox(
                          height: 40,
                        ),
                        InkWell(
                          onTap: () async {
                            setState(() {
                              isLoading = true;
                            });
                            await db.open();
                            var coll = db.collection('banks');
                            var v1 = await coll.findOne({
                              "phone": widget.param,
                              "subMenu": widget.title
                            });
                            v1!["credit"] = _ref.text;
                            
                            
                            await coll.save(v1);
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => Dashboard(
                                    title: widget.title,
                                    pageIndex: 15,
                                    param: widget.param)));
                            setState(() {
                              isLoading = false;
                            });
                          },
                          child: Container(
                            height: 50,
                            width: 150,
                            color: Colors.teal,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 18.0),
                              child: Text(
                                'Confirm',
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
                  },

                  // final String url = (await controller.data!.currentUrl())!;
                  // // ignore: deprecated_member_use
                  // Scaffold.of(context).showSnackBar(
                  //   SnackBar(
                  //       content: Column(
                  //         mainAxisSize: MainAxisSize.min,
                  //         children: [
                  //           TextFormField(
                  //             decoration: InputDecoration(

                  //               labelText: "Enter Ref.No",
                  //               hintText: "Enter Ref No" ),
                  //           ),
                  //           TextFormField(
                  //         decoration: InputDecoration(
                  //             labelText: "Enter Aadhar Numvber",
                  //             hintText: "Aadhar Numvber"),
                  //       ),
                  //           InkWell(
                  //     onTap: () async {
                  //      // screenshotBytes = await webView.takeScreenshot();
                  //           // showDialog(
                  //           //   context: context,
                  //           //   builder: (context) {
                  //           //     return AlertDialog(
                  //           //       content: Image.memory(screenshotBytes),
                  //           //     );
                  //           //   },
                  //           // );
                  //           screenshotController.capture().then((Uint8List? image)async {
                  //             String base64String =
                  //                 base64Encode(image!); //Capture Done
                  //             setState(() {
                  //               _imageFile = base64String.toString();
                  //             });
                  //              print(_imageFile);
                  //             await db.open();
                  //             var coll = db.collection('banks');
                  //             var v1 = await coll.findOne({"phone": widget.param.toString(),"subMenu":widget.title});
                  //             v1!["SS"] = _imageFile.toString();
                  //             v1["Done"] = "Completed";
                  //             await coll.save(v1);
                  //           }).catchError((onError) {
                  //             print(onError);
                  //           });
                  //     },
                  //     child: Container(
                  //           height: 50,
                  //           color: Colors.teal,
                  //           child: Padding(
                  //             padding: const EdgeInsets.only(top: 20.0),
                  //             child: Text(
                  //               'Confirm',
                  //               textAlign: TextAlign.center,
                  //             ),
                  //           ),
                  //     ),
                  //   ),
                  //         ],
                  //       )),
                );
              },
              child: const Icon(Icons.add),
            );
          }
          return Container();
        });
  }
}

enum MenuOptions {
  showUserAgent,
  listCookies,
  clearCookies,
  addToCache,
  listCache,
  clearCache,
  navigationDelegate,
}

class SampleMenu extends StatelessWidget {
  SampleMenu(this.controller);

  final Future<WebViewController> controller;
  final CookieManager cookieManager = CookieManager();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: controller,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> controller) {
        return PopupMenuButton<MenuOptions>(
          onSelected: (MenuOptions value) {
            switch (value) {
              case MenuOptions.showUserAgent:
                _onShowUserAgent(controller.data!, context);
                break;
              case MenuOptions.listCookies:
                _onListCookies(controller.data!, context);
                break;
              case MenuOptions.clearCookies:
                _onClearCookies(context);
                break;
              case MenuOptions.addToCache:
                _onAddToCache(controller.data!, context);
                break;
              case MenuOptions.listCache:
                _onListCache(controller.data!, context);
                break;
              case MenuOptions.clearCache:
                _onClearCache(controller.data!, context);
                break;
              case MenuOptions.navigationDelegate:
                _onNavigationDelegateExample(controller.data!, context);
                break;
            }
          },
          itemBuilder: (BuildContext context) => <PopupMenuItem<MenuOptions>>[
            PopupMenuItem<MenuOptions>(
              value: MenuOptions.showUserAgent,
              child: const Text('Show user agent'),
              enabled: controller.hasData,
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCookies,
              child: Text('List cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCookies,
              child: Text('Clear cookies'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.addToCache,
              child: Text('Add to cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.listCache,
              child: Text('List cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.clearCache,
              child: Text('Clear cache'),
            ),
            const PopupMenuItem<MenuOptions>(
              value: MenuOptions.navigationDelegate,
              child: Text('Navigation Delegate example'),
            ),
          ],
        );
      },
    );
  }

  void _onShowUserAgent(
      WebViewController controller, BuildContext context) async {
    // Send a message with the user agent string to the Toaster JavaScript channel we registered
    // with the WebView.
    await controller.evaluateJavascript(
        'Toaster.postMessage("User Agent: " + navigator.userAgent);');
  }

  void _onListCookies(
      WebViewController controller, BuildContext context) async {
    final String cookies =
        await controller.evaluateJavascript('document.cookie');
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          const Text('Cookies:'),
          _getCookieList(cookies),
        ],
      ),
    ));
  }

  void _onAddToCache(WebViewController controller, BuildContext context) async {
    await controller.evaluateJavascript(
        'caches.open("test_caches_entry"); localStorage["test_localStorage"] = "dummy_entry";');
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(const SnackBar(
      content: Text('Added a test entry to cache.'),
    ));
  }

  void _onListCache(WebViewController controller, BuildContext context) async {
    await controller.evaluateJavascript('caches.keys()'
        '.then((cacheKeys) => JSON.stringify({"cacheKeys" : cacheKeys, "localStorage" : localStorage}))'
        '.then((caches) => Toaster.postMessage(caches))');
  }

  void _onClearCache(WebViewController controller, BuildContext context) async {
    await controller.clearCache();
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(const SnackBar(
      content: Text("Cache cleared."),
    ));
  }

  void _onClearCookies(BuildContext context) async {
    final bool hadCookies = await cookieManager.clearCookies();
    String message = 'There were cookies. Now, they are gone!';
    if (!hadCookies) {
      message = 'There are no cookies.';
    }
    // ignore: deprecated_member_use
    Scaffold.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }

  void _onNavigationDelegateExample(
      WebViewController controller, BuildContext context) async {
    final String contentBase64 =
        base64Encode(const Utf8Encoder().convert(kNavigationExamplePage));
    await controller.loadUrl('data:text/html;base64,$contentBase64');
  }

  Widget _getCookieList(String cookies) {
    if (cookies == null || cookies == '""') {
      return Container();
    }
    final List<String> cookieList = cookies.split(';');
    final Iterable<Text> cookieWidgets =
        cookieList.map((String cookie) => Text(cookie));
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: cookieWidgets.toList(),
    );
  }
}

class NavigationControls extends StatelessWidget {
  const NavigationControls(this._webViewControllerFuture)
      : assert(_webViewControllerFuture != null);

  final Future<WebViewController> _webViewControllerFuture;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<WebViewController>(
      future: _webViewControllerFuture,
      builder:
          (BuildContext context, AsyncSnapshot<WebViewController> snapshot) {
        final bool webViewReady =
            snapshot.connectionState == ConnectionState.done;
        final WebViewController controller = snapshot.data!;
        return Row(
          children: <Widget>[
            IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoBack()) {
                        await controller.goBack();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(content: Text("No back history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              onPressed: !webViewReady
                  ? null
                  : () async {
                      if (await controller.canGoForward()) {
                        await controller.goForward();
                      } else {
                        // ignore: deprecated_member_use
                        Scaffold.of(context).showSnackBar(
                          const SnackBar(
                              content: Text("No forward history item")),
                        );
                        return;
                      }
                    },
            ),
            IconButton(
              icon: const Icon(Icons.replay),
              onPressed: !webViewReady
                  ? null
                  : () {
                      controller.reload();
                    },
            ),
          ],
        );
      },
    );
  }
}

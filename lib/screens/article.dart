import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleScreen extends StatefulWidget {
  final String urlToWeb;


  ArticleScreen(this.urlToWeb);

  @override
  _ArticleScreenState createState() => _ArticleScreenState();
}

class _ArticleScreenState extends State<ArticleScreen> {
  final Completer<WebViewController> _completer=Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        centerTitle: true,
        title: RichText(text: TextSpan(
            children: [
              TextSpan(text: 'ABC',style: TextStyle(color: Colors.red,fontSize: 18.0,fontWeight: FontWeight.w500)),
              TextSpan(text: 'News',style: TextStyle(color: Colors.blue,fontSize: 18.0,fontWeight: FontWeight.w500)),
            ]
        )),
      ),
      body:WebView(
        initialUrl:widget.urlToWeb ,
        onWebViewCreated:((WebViewController webVeiwController){
          _completer.complete(webVeiwController);
        }) ,
      ) ,
    );
  }
}

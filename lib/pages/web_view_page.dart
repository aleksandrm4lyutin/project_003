import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//import '../controllers/start.dart';

class BlocView extends StatefulWidget {
  String bloc;
  BlocView({Key? key, required this.bloc}) : super(key: key);

  @override
  State<BlocView> createState() => _BlocViewState();
}

class _BlocViewState extends State<BlocView> {
  late InAppWebViewController _webViewController;


  Future<bool> onBackPressed() async {
    _webViewController.goBack();
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: WillPopScope(
          onWillPop: onBackPressed,
          child: Column(
            children: [
              Expanded(
                child: Stack(
                    children: [
                      InAppWebView(
                        initialUrlRequest: URLRequest(url: Uri.parse(widget.bloc)),
                        initialOptions: InAppWebViewGroupOptions(
                          crossPlatform: InAppWebViewOptions(
                            useShouldOverrideUrlLoading: true,
                            javaScriptCanOpenWindowsAutomatically: true,
                          ),
                        ),
                        onWebViewCreated: (controller) {
                          _webViewController = controller;
                        },


                      )
                    ]
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
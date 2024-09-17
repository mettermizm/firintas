import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QrConsoleRead extends StatefulWidget {
  const QrConsoleRead({super.key});

  @override
  State<QrConsoleRead> createState() => _QrConsoleReadState();
}

class _QrConsoleReadState extends State<QrConsoleRead> {
  late WebViewController _webViewController; // WebViewController
  String consoleMessage = ''; // Gelen mesajları saklamak için

  @override
  void initState() {
    super.initState();
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _webViewController.runJavaScript(
              """
              (function() {
                var oldLog = console.log;
                console.log = function (message) {
                  ConsoleLog.postMessage(message);
                  oldLog.apply(console, arguments);
                };
              })();
              """,
            );
          },
        ),
      )
      ..addJavaScriptChannel(
        'ConsoleLog', // JavaScript kanalını dinle
        onMessageReceived: (JavaScriptMessage message) {
          setState(() {
            consoleMessage =
                message.message; // Gelen mesajı kaydet ve ekranda göster
            print('JavaScript mesajı: ${message.message}');
          });
        },
      )
      ..loadRequest(Uri.parse('https://karenbilisim.com/demo2/firintas/'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("WebView Console Logger"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: WebViewWidget(controller: _webViewController),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                color: Colors.black,
                child: SingleChildScrollView(
                  child: Text(
                    "Console Message: \n$consoleMessage",
                    style: const TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

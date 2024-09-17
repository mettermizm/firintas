import 'dart:async'; // Zamanlayıcı için gerekli
import 'package:firintas/pages/qrcode_scaner.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QrConsoleRead extends StatefulWidget {
  const QrConsoleRead({super.key});

  @override
  State<QrConsoleRead> createState() => _QrConsoleReadState();
}

class _QrConsoleReadState extends State<QrConsoleRead> {
  late WebViewController _webViewController;
  String consoleMessage = '';
  Timer? _timer;
  String? cookies;

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
            _startCookieCheck();
          },
        ),
      )
      ..loadRequest(Uri.parse('https://karenbilisim.com/demo2/firintas?v=3'));
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCookieCheck() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _webViewController
          .runJavaScriptReturningResult('document.cookie')
          .then((result) {
        setState(() {
          //print(result);
          cookies = result.toString();
          if (result.toString().contains('qr_code')) {
            consoleMessage = 'qr_code çerezi mevcut';

            // Çerezi sil
            _webViewController
                .runJavaScript(
                    "document.cookie = 'qr_code=; expires=Thu, 01 Jan 1970 00:00:00 UTC; path=/;';")
                .then((_) {
              // Çerezi sildikten sonra sayfaya yönlendir
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const QRViewExample()));
            }).catchError((error) {
              print('Çerez silme hatası: $error');
            });
          } else {
            consoleMessage = 'qr_code çerezi bulunamadı';
          }
        });
      }).catchError((error) {
        //print('Hata: $error');
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Mehmet'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_bag_outlined),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: WebViewWidget(controller: _webViewController),
          ),
          if (cookies != null) const SizedBox(),
          /*
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Çerezler: $cookies'),
              ),
            ),
            */
        ],
      ),
    );
  }
}

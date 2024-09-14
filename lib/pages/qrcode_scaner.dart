import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:webview_flutter/webview_flutter.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;
  String? scannedUrl;

  @override
  void initState() {
    super.initState();
    // WebView.platform = SurfaceAndroidWebView();
  }

  late var controllerWebView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: scannedUrl == null
          ? Stack(
              children: [
                Column(
                  children: <Widget>[
                    Container(
                      color: const Color.fromRGBO(241, 101, 10, 1),
                      height: 100,
                    ),
                    Expanded(
                      flex: 4,
                      child: Stack(
                        children: [
                          QRView(
                            key: qrKey,
                            onQRViewCreated: _onQRViewCreated,
                          ),
                          Positioned.fill(
                            child: Container(
                              color: Colors.black.withOpacity(0.6),
                            ),
                          ),
                          Center(
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                color: Colors.white.withOpacity(0.2),
                              ),
                            ),
                          ),
                          Positioned(
                            top: MediaQuery.of(context).size.height / 2 - 125,
                            left: MediaQuery.of(context).size.width / 2 - 125,
                            child: ClipPath(
                              clipper: _QRScannerOverlayShape(),
                              child: Container(
                                width: 250,
                                height: 250,
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      color: const Color.fromRGBO(241, 101, 10, 1),
                      height: 100,
                    ),
                  ],
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Image.asset(
                      "assets/images/firintaslogo.png",
                      height: 150,
                    ),
                  ),
                ),
              ],
            )
          : WebViewWidget(controller: controllerWebView),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        _checkIfUrl(scanData.code!);
      });
    });
  }

  void _checkIfUrl(String scannedData) {
    final Uri? uri = Uri.tryParse(scannedData);

    if (uri != null && (uri.isScheme('http') || uri.isScheme('https'))) {
      setState(() {
        scannedUrl = scannedData;
        controllerWebView = WebViewController()
          ..setJavaScriptMode(JavaScriptMode.unrestricted)
          ..setNavigationDelegate(
            NavigationDelegate(
              onProgress: (int progress) {},
              onPageStarted: (String url) {},
              onPageFinished: (String url) {},
              onHttpError: (HttpResponseError error) {},
              onWebResourceError: (WebResourceError error) {},
              onNavigationRequest: (NavigationRequest request) {
                if (request.url.startsWith('https://www.youtube.com/')) {
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          )
          ..loadRequest(Uri.parse(scannedUrl!));
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Geçersiz bir URL.'),
        ),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class _QRScannerOverlayShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();

    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final holeRect = Rect.fromLTWH(
      size.width / 2 - 125,
      size.height / 2 - 125,
      250,
      250,
    );
    path.addRect(holeRect);

    path.fillType = PathFillType.evenOdd;
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

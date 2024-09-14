import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({super.key});

  @override
  State<QRViewExample> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Container(
                color: Colors.orange,
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
                      child: Stack(
                        children: [
                          Container(
                            color: Colors.black.withOpacity(0.6),
                          ),
                          Center(
                            child: Container(
                              width: 250,
                              height: 250,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
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
                  ],
                ),
              ),
              // Alt kısım turuncu footer
              Container(
                color: Colors.orange,
                height: 100,
                child: Center(
                  child: Image.asset("assets/images/firintaslogo.png"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      _checkIfUrl(scanData.code!); // QR kodu kontrol ediyoruz
    });
  }

  // QR koddan gelen değerin URL olup olmadığını kontrol eden ve "karenbilisim.com" içerip içermediğini denetleyen fonksiyon
  void _checkIfUrl(String scannedData) {
    final Uri? uri =
        Uri.tryParse(scannedData); // String'i URL'ye çevirmeye çalışıyoruz

    if (uri != null && (uri.isScheme('http') || uri.isScheme('https'))) {
      // URL geçerli ve http/https protokolü ile başlıyorsa
      if (scannedData.contains('karenbilisim.com')) {
        // URL "karenbilisim.com" içeriyor mu?
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bu URL "karenbilisim.com" içeriyor!'),
          ),
        );
        _launchUrl(scannedData); // URL açmayı deneyelim
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Bu URL "karenbilisim.com" içermiyor.'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Geçersiz bir URL.'),
        ),
      );
    }
  }

  // URL'yi açmak için
  Future<void> _launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url); // URL'yi tarayıcıda açar
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('URL açılamıyor.'),
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

    // Dış kenarları oluşturuyoruz
    path.addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    // Ortada boş bir kare bırakıyoruz
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

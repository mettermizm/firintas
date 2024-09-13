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
      appBar: AppBar(
        title: const Text('QR Kod Okut'),
      ),
      body: Stack(
        children: [
          Column(
            children: <Widget>[
              Expanded(
                flex: 5,
                child: QRView(
                  key: qrKey,
                  onQRViewCreated: _onQRViewCreated,
                ),
              ),
              Expanded(
                flex: 1,
                child: Center(
                  child: (result != null)
                      ? Text('QR Kodu: ${result!.code}')
                      : const Text('QR Kodu okutun'),
                ),
              )
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

import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
          // Çerçeve
          Center(
            child: Container(
              width: 250, // Çerçevenin genişliği
              height: 250, // Çerçevenin yüksekliği
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red, // Çerçevenin rengi
                  width: 4.0, // Çerçevenin kalınlığı
                ),
                borderRadius:
                    BorderRadius.circular(12), // Yuvarlatılmış kenarlar
              ),
            ),
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
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

/*
    _webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {},
          onPageStarted: (String url) {},
          onPageFinished: (String url) {
            _startCookieCheck();
            //print(DateTime.now().second);
          },
        ),
      )
      ..loadRequest(Uri.parse(
          'https://karenbilisim.com/demo2/firintas?v=${DateTime.now().second}'));

    print('https://karenbilisim.com/demo2/firintas?v=${DateTime.now().second}');
    late WebViewController _webViewController;
  String consoleMessage = '';
  Timer? _timer;
  String? cookies;

  void _startCookieCheck() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      _webViewController
          .runJavaScriptReturningResult('document.cookie')
          .then((result) {
        setState(() {
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
      }).catchError((error) {});
    });
  }
    _timer?.cancel();


  Expanded(
            child: WebViewWidget(controller: _webViewController),
          ),
          if (cookies != null) const SizedBox(),
    */
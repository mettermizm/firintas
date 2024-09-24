import 'dart:convert';
import 'package:firintas/constanst/image_constanst.dart';
import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/denemeler/konsoloku.dart';
import 'package:firintas/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SmsCheck extends StatefulWidget {
  const SmsCheck({super.key});

  @override
  State<SmsCheck> createState() => _SmsCheckState();
}

class _SmsCheckState extends State<SmsCheck> {
  final TextEditingController _smscheckController = TextEditingController();

  Future<void> signIn() async {
    var url = Uri.parse(
        'https://karenbilisim.com/demo2/firintas/api1/check?pass=${_smscheckController.text}');
    try {
      var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 1) {
          // Başarılı giriş mesajı
          await CustomDialog.showCustomDialog(
            context: context,
            title: "Başarılı",
            content: "Başarılı: ${jsonResponse['error']}",
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          // Başarısız giriş mesajı
          await CustomDialog.showCustomDialog(
            context: context,
            title: "Başarısız",
            content: "Başarısız: ${jsonResponse['error']}",
          );
        }
      } else {
        // Sunucu hatası mesajı
        await CustomDialog.showCustomDialog(
          context: context,
          title: "Sunucu Hatası",
          content: "Sunucu hatası: ${response.statusCode}",
        );
      }
    } catch (e) {
      // İstek sırasında hata mesajı
      await CustomDialog.showCustomDialog(
        context: context,
        title: "Hata",
        content: 'İstek sırasında bir hata oluştu: $e',
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200,
              width: 200,
              child: Image.asset(ImageConstanst.logo),
            ),
            const SizedBox(
              height: 30,
            ),
            const SizedBox(height: 16),
            CustomTextField(
                controller: _smscheckController,
                label: "SMS",
                icon: const Icon(
                  Icons.sms,
                  color: Color.fromARGB(154, 255, 82, 2),
                )),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: signIn,
              child: Container(
                width: MediaQuery.sizeOf(context).width - 100,
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.black26),
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.09),
                      offset: const Offset(3, 3),
                      blurRadius: 6.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: const Center(
                    child: Text(
                  "Onayla",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                  ),
                )),
              ),
            ),
            const SizedBox(height: 16),
            TextButton(
              onPressed: () {
                /*
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
                    */
              },
              child: const Text(
                'Sms Gelmedi Mi?',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';
import 'package:firintas/constanst/image_constanst.dart';
import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/pages/auth/signup.dart';
import 'package:firintas/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SigninPage extends StatefulWidget {
  final VoidCallback navigateToSignup;

  const SigninPage({super.key, required this.navigateToSignup});

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> signIn() async {
    print(_emailController.text);
    var url = Uri.parse(
        'https://karenbilisim.com/demo2/firintas/api1/signin?email=${_emailController.text}&pass=${_passwordController.text}');
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
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Giriş Yap",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
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
                controller: _emailController,
                label: "Email",
                icon: const Icon(
                  Icons.email,
                  color: Color.fromARGB(154, 255, 82, 2),
                )),
            const SizedBox(height: 16),
            CustomTextField(
                controller: _passwordController,
                label: "Şifre",
                obscure: true,
                icon: const Icon(
                  Icons.password,
                  color: Color.fromARGB(154, 255, 82, 2),
                )),
            const SizedBox(height: 16),
            /*
            ElevatedButton(
              onPressed: signIn,
              child: const Text('Giriş Yap'),
            ),
            */
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
                  "Giriş Yap",
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
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SignupPage()));
              },
              child: const Text(
                'Hesabınız yok mu? Kayıt olun.',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

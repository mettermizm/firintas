import 'dart:convert';

import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/denemeler/konsoloku.dart';
import 'package:firintas/membership/signup.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  Future<void> signIn() async {
    //print(_emailController.text);
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

          // Başarılı girişten sonra ana sayfaya yönlendirme
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const QrConsoleRead()),
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
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/firintaslogo.png',
                height: 200,
                width: 200,
              ),
              const SizedBox(
                height: 100,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const QrConsoleRead()));
                },
                child: const Text(
                  'Üye olmadan devam et',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      child: const Text(
                        'Hesabınız yok mu? Kayıt olun.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

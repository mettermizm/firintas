import 'dart:convert';
import 'package:firintas/constanst/color_constanst.dart';
import 'package:firintas/constanst/image_constanst.dart';
import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/pages/auth/signup.dart';
import 'package:firintas/pages/home.dart';
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
    var url = Uri.parse('https://karenbilisim.com/demo2/firintas/api1/'
        'signin?email=${_emailController.text}&pass=${_passwordController.text}');
    try {
      var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 1) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
        } else {
          await CustomDialog.showCustomDialog(
            context: context,
            title: "Başarısız",
            content: "Başarısız: ${jsonResponse['error']}",
          );
        }
      } else {
        await CustomDialog.showCustomDialog(
          context: context,
          title: "Sunucu Hatası",
          content: "Sunucu hatası: ${response.statusCode}",
        );
      }
    } catch (e) {
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
                ImageConstanst.logo,
                height: MediaQuery.sizeOf(context).height * 0.4,
                width: MediaQuery.sizeOf(context).width * 0.4,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomePage()));
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
                        icon: Icon(
                          Icons.email,
                          color: AppColor.iconColor,
                        )),
                    const SizedBox(height: 16),
                    CustomTextField(
                        controller: _passwordController,
                        label: "Şifre",
                        obscure: true,
                        icon: Icon(
                          Icons.password,
                          color: AppColor.iconColor,
                        )),
                    const SizedBox(height: 16),
                    CustomBtn.customBtn(signIn, context,
                        MediaQuery.sizeOf(context).width - 100, "Giriş Yap"),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignupPage()));
                      },
                      child: const Text(
                        'Hesabınız yok mu? Kayıt olun',
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

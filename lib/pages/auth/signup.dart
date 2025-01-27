import 'dart:convert';
import 'package:firintas/constanst/color_constanst.dart';
import 'package:firintas/constanst/image_constanst.dart';
import 'package:firintas/custom/custom_class.dart';
import 'package:firintas/custom/custom_showdialog.dart';
import 'package:firintas/pages/auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _adController = TextEditingController();
  final TextEditingController _soyadController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordRepeatController =
      TextEditingController();
  static final _phoneNumberFormatter = PhoneNumberFormatter();
  Future<void> signUp() async {
    String formattedPhone = _phoneController.text.replaceAll(' ', '');

    var url = Uri.parse('https://karenbilisim.com/demo2/firintas/api1/signup?'
        'ad=${_adController.text}&soyad=${_soyadController.text}&'
        'email=${_emailController.text}&telefon=$formattedPhone&'
        'sifre=${_passwordController.text}');
    print(url);
    try {
      var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['status'] == 1) {
          await CustomDialog.showCustomDialog(
            context: context,
            title: "Başarılı",
            content: "",
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
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
                width: 100,
                child: Image.asset(ImageConstanst.logo),
              ),
              const SizedBox(height: 30),
              CustomTextField(
                  controller: _adController,
                  label: "İsim",
                  icon: Icon(
                    Icons.verified_user,
                    color: AppColor.iconColor,
                  )),
              const SizedBox(height: 16),
              CustomTextField(
                  controller: _soyadController,
                  label: "Soyisim",
                  icon: Icon(
                    Icons.verified_user,
                    color: AppColor.iconColor,
                  )),
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
                controller: _phoneController,
                label: "Telefon Numarası",
                icon: Icon(
                  Icons.phone,
                  color: AppColor.iconColor,
                ),
                inputFormat: [
                  LengthLimitingTextInputFormatter(13),
                  FilteringTextInputFormatter.digitsOnly,
                  _phoneNumberFormatter,
                ],
                prefix: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '+90 ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
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
              CustomTextField(
                  controller: _passwordRepeatController,
                  label: "Şifreyi Onayla",
                  obscure: true,
                  icon: Icon(
                    Icons.password,
                    color: AppColor.iconColor,
                  )),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: signUp,
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
                    "Kayıt Ol",
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
                          builder: (context) => const LoginPage()));
                },
                child: const Text(
                  'Zaten hesabınız var mı? Giriş yapın.',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PhoneNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final digitsOnly = newValue.text.replaceAll(RegExp(r'[^\d]'), '');
    final formattedText = _formatAsPhoneNumber(digitsOnly);
    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }

  String _formatAsPhoneNumber(String digits) {
    if (digits.length <= 3) {
      return digits;
    } else if (digits.length <= 6) {
      return '${digits.substring(0, 3)} ${digits.substring(3)}';
    } else if (digits.length <= 8) {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6)}';
    } else {
      return '${digits.substring(0, 3)} ${digits.substring(3, 6)} ${digits.substring(6, 8)} ${digits.substring(8, 10)}';
    }
  }
}

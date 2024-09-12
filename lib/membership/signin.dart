import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
    // URL
    var url = Uri.parse(
        'https://karenbilisim.com/demo2/firintas/api1/signin?email=${_emailController.value}&pass=${_passwordController.value}');

    // POST isteğinde gönderilecek veriler
    var body = {
      'email': 'hicretcetin@gmail.com',
      'pass': 'murtaza13',
    };
    try {
      var response = await http.get(
        url,
        headers: {"Content-Type": "application/json"},
      );

      if (response.statusCode == 200) {
        // Başarılı yanıtı işleme
        print('Giriş başarılı!');
        print('Yanıt: ${response.body}');
      } else {
        // Hata durumu
        print('Hata: ${response.statusCode}');
        print('Hata mesajı: ${response.body}');
      }
    } catch (e) {
      print('İstek sırasında bir hata oluştu: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Giriş Yap',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
              labelStyle: TextStyle(color: Colors.orange),
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(
              labelText: 'Şifre',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: signIn,
            child: const Text('Giriş Yap'),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: widget.navigateToSignup,
            child: const Text('Hesabınız yok mu? Kayıt olun.'),
          ),
        ],
      ),
    );
  }
}

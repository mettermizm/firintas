import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  final VoidCallback navigateToSignin;

  const SignupPage({super.key, required this.navigateToSignin});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Kayıt Ol',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          TextField(
            controller: _emailController,
            decoration: const InputDecoration(
              labelText: 'Email',
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
          TextField(
            controller: _confirmPasswordController,
            decoration: const InputDecoration(
              labelText: 'Şifreyi Onayla',
              border: OutlineInputBorder(),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Kayıt olma işlemleri burada yapılacak
            },
            child: const Text('Kayıt Ol'),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: widget.navigateToSignin,
            child: const Text('Zaten hesabınız var mı? Giriş yapın.'),
          ),
        ],
      ),
    );
  }
}

import 'package:firintas/membership/custom_member/custom_btn_member.dart';
import 'package:firintas/membership/signin.dart';
import 'package:firintas/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void navigateToPage(int pageIndex) {
    _pageController.animateToPage(pageIndex,
        duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Image.asset(
                    'assets/images/firintaslogo.png',
                    height: 150,
                    width: 150,
                  ),
                  Spacer(),
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
                  const SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 32.0),
                    child: Column(
                      children: [
                        CustomBtnMember.customBtnMember(
                          color: Color.fromARGB(255, 241, 102, 9),
                          onTap: () {
                            navigateToPage(1);
                          },
                          labelText: 'Mail ile Giriş',
                          icon: Icons.mail,
                        ),
                        const SizedBox(height: 16),
                        CustomBtnMember.customBtnMember(
                          color: Color.fromARGB(255, 56, 107, 237),
                          onTap: () {
                            // navigateToPage(2);
                          },
                          labelText: 'Facebook ile Giriş',
                          icon: Icons.facebook,
                        ),
                        const SizedBox(height: 16),
                        CustomBtnMember.customBtnMember(
                          color: Colors.brown,
                          onTap: () {
                            // navigateToPage(3);
                          },
                          labelText: 'Google ile Giriş',
                          icon: FontAwesomeIcons.google,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            SigninPage(navigateToSignup: () => navigateToPage(1)),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Facebook ile Giriş Yap',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      navigateToPage(0);
                    },
                    child: const Text('Geri Dön'),
                  ),
                ],
              ),
            ),
            // Google ile Giriş Sayfası
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Google ile Giriş Yap',
                    style: TextStyle(fontSize: 24),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      navigateToPage(0); // Ana sayfaya geri dön
                    },
                    child: const Text('Geri Dön'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

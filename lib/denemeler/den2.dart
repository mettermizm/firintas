import 'package:flutter/material.dart';
import 'package:firintas/membership/signin.dart';
import 'package:firintas/membership/signup.dart';

class MembershipHome extends StatefulWidget {
  const MembershipHome({super.key});

  @override
  State<MembershipHome> createState() => _MembershipHomeState();
}

class _MembershipHomeState extends State<MembershipHome> {
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                children: [
                  SignupPage(navigateToSignin: () => navigateToPage(1)),
                  SigninPage(navigateToSignup: () => navigateToPage(0)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

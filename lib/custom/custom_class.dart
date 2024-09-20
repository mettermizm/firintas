import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomText {
  static Text customOrangeText(
      String text, double fontSize, String? fontFamily) {
    return Text(
      text,
      style: TextStyle(
        color: const Color.fromARGB(255, 235, 102, 6),
        fontSize: fontSize,
        fontFamily: fontFamily,
      ),
    );
  }
}

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final Icon icon;
  final bool? obscure;
  final List<TextInputFormatter>? inputFormat;
  final RichText? prefix;

  const CustomTextField({
    required this.controller,
    required this.label,
    required this.icon,
    this.obscure,
    this.inputFormat,
    this.prefix,
    Key? key,
  }) : super(key: key);

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obscureText;

  @override
  void initState() {
    super.initState();
    _obscureText =
        widget.obscure ?? false; // Eğer obscureText null ise false yap
  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText; // Gizli metni açıp kapatmak için
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      inputFormatters: widget.inputFormat,
      controller: widget.controller,
      obscureText: _obscureText, // Gizli metin durumu
      decoration: InputDecoration(
        prefix: widget.prefix,
        labelText: widget.label,
        labelStyle: const TextStyle(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        floatingLabelStyle: const TextStyle(
          color: Color.fromARGB(255, 34, 34, 34),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color.fromARGB(255, 241, 102, 9),
            width: 1.0,
          ),
          borderRadius: BorderRadius.circular(12.0),
        ),
        suffixIcon: widget.obscure != null
            ? GestureDetector(
                onTap: _toggleObscureText,
                child: Icon(
                  _obscureText ? Icons.visibility_off : Icons.visibility,
                  color: const Color.fromARGB(255, 241, 102, 9),
                ),
              )
            : widget.icon,
      ),
      style: const TextStyle(
        color: Color.fromARGB(255, 34, 34, 34),
        fontWeight: FontWeight.w500,
      ),
      cursorColor: const Color.fromARGB(255, 9, 102, 241),
    );
  }
}
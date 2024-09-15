import 'package:flutter/material.dart';
import 'package:store_app/utils/helper_extensions.dart';

class AnimatedTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final Animation<double> animation;
  final bool isValid;
  final String errorMessage;

  const AnimatedTextFormField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    required this.animation,
    required this.isValid,
    required this.errorMessage,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(0, 4),
            end: Offset.zero,
          ).animate(animation),
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      child: TextField(
        controller: controller,
        obscureText: obscureText,
        style: TextStyle(
          color: context.onPrimaryColor(),
        ),
        cursorColor: context.onPrimaryColor(),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isValid ? context.primaryColor() : Colors.red,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: isValid ? Colors.grey : Colors.red,
            ),
          ),
          errorBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          filled: true,
          fillColor: context.neutralColor(),
          hintText: hintText,
          hintStyle: TextStyle(
            color: isValid ? Colors.grey[500] : Colors.red,
          ),
          errorText: isValid ? null : errorMessage,
        ),
      ),
    );
  }
}
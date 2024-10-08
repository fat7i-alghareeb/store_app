import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manger/cubit/log_in_cubit.dart';

class OtherMethodAuthWidget extends StatelessWidget {
  final String imagePath;
  const OtherMethodAuthWidget({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<LogInCubit>().signInWithGoogle();
      },
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey[200],
        ),
        child: Image.asset(
          imagePath,
          height: 40,
        ),
      ),
    );
  }
}

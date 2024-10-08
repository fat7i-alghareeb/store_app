import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../../../../utils/helper_extensions.dart';
import '../welcom page animations/animated_clipper.dart';
import '../welcom page animations/animated_text.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key, required this.pageController});
  final PageController pageController;
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with TickerProviderStateMixin {
  late AnimationController _clipperAnimationControllerLarge;
  late Animation<double> _clipperAnimationLarge;
  late AnimationController _clipperAnimationControllerSmall;
  late Animation<double> _clipperAnimationSmall;
  late AnimationController _titleController;
  late Animation<double> _titleAnimation;
  late AnimationController _subTitleController;
  late Animation<double> _subTitleAnimation;
  late AnimationController _iconController;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    initAnimations();
  }

  @override
  void dispose() {
    _clipperAnimationControllerLarge.dispose();
    _clipperAnimationControllerSmall.dispose();
    _titleController.dispose();
    _subTitleController.dispose();
    _iconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedClipPath(
          clipperAnimation: _clipperAnimationLarge,
          color: const Color(0xFF8E6CEF),
        ),
        AnimatedClipPath(
          clipperAnimation: _clipperAnimationSmall,
          color: const Color.fromARGB(255, 122, 86, 221),
        ),
        AnimatedText(
          animation: _titleAnimation,
          text: const Text(
            'Welcome',
            style: TextStyle(
              fontSize: 45,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        AnimatedText(
          animation: _subTitleAnimation,
          text: const Text(
            'This free ECommerce app to show my knowledge\n I hope you like it \nThanks :) ',
            maxLines: 3,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
        ),
        AnimatedBuilder(
          animation: _iconAnimation,
          builder: (context, child) => Positioned(
            left:
                -80 + MediaQuery.of(context).size.width * _iconAnimation.value,
            bottom: MediaQuery.of(context).size.height * .19,
            child: Card(
              color: context.accentColor(),
              child: IconButton(
                onPressed: () {
                  widget.pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeIn,
                  );
                  HapticFeedback.heavyImpact();
                },
                icon: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: context.primaryColor(),
                  size: 32,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  void initAnimations() {
//////////////////////////////////////////////////////////////////////////////////////////////
    _clipperAnimationControllerLarge = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _clipperAnimationLarge = Tween<double>(
      begin: 0.0,
      end: .7,
    ).animate(CurvedAnimation(
        parent: _clipperAnimationControllerLarge, curve: Curves.decelerate));
//////////////////////////////////////////////////////////////////////////////////////////////
    _clipperAnimationControllerSmall = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _clipperAnimationSmall = Tween<double>(
      begin: 0.0,
      end: .6,
    ).animate(CurvedAnimation(
        parent: _clipperAnimationControllerSmall, curve: Curves.decelerate));
//////////////////////////////////////////////////////////////////////////////////////////////
    _titleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _titleAnimation = Tween<double>(
      begin: 0,
      end: .6,
    ).animate(_titleController);
//////////////////////////////////////////////////////////////////////////////////////////////
    _subTitleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _subTitleAnimation = Tween<double>(
      begin: 0,
      end: .5,
    ).animate(_subTitleController);
//////////////////////////////////////////////////////////////////////////////////////////////
    _iconController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _iconAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_iconController);
//////////////////////////////////////////////////////////////////////////////////////////////
    _clipperAnimationControllerLarge.forward().then((_) {
      _clipperAnimationControllerSmall.forward();
    });
    _titleController.forward().then(
      (_) {
        _subTitleController.forward().then(
              (value) => _iconController.forward(),
            );
      },
    );
  }
}

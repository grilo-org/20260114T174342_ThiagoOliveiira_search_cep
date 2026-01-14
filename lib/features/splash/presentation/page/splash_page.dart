import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../spash.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _fadeIn;
  late final Animation<double> _scaleIn;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900));
    _fadeIn = CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut);
    _scaleIn = Tween<double>(begin: 0.9, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeOutBack));

    _ctrl.forward();
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = MediaQuery.sizeOf(context).height * 0.30;

    return BlocListener<SplashCubit, SplashState>(
      listener: (context, state) {
        if (state.navigateTo != null) context.goNamed(state.navigateTo!);
      },
      child: Scaffold(
        body: Center(child: FadeTransition(opacity: _fadeIn, child: ScaleTransition(scale: _scaleIn, child: Image.asset('assets/images/logo.png', height: logoSize, filterQuality: FilterQuality.high)))),
      ),
    );
  }
}

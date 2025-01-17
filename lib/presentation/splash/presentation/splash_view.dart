import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_connect/presentation/splash/presentation/splash_vm.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final vm = context.read<SplashViewModel>();
  @override
  void initState() {
    super.initState();
    vm.redirect(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Transform.scale(
        scale: 6,
        child: Center(
          child: FlutterLogo(),
        ),
      ),
    );
  }
}

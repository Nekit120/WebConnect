import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_connect/presentation/error/error_view.dart';
import 'package:web_connect/presentation/error/error_vm.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => ErrorViewModel(),
      child: ErrorView(),
    );
  }
}

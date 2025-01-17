import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:web_connect/presentation/error/error_vm.dart';

class ErrorView extends StatefulWidget {
  const ErrorView({
    super.key,
  });

  @override
  State<ErrorView> createState() => _ErrorViewState();
}

class _ErrorViewState extends State<ErrorView> {
  late final vm = context.read<ErrorViewModel>();

  @override
  void initState() {
    super.initState();
    vm.init();
  }

  @override
  void dispose() {
    vm.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                CupertinoIcons.info_circle,
                size: 125,
                color: Colors.redAccent,
              ),
              const SizedBox(height: 16),
              Text(
                "Ошибка доступа к интернету",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[800],
                  fontFamily: 'Roboto',
                ),
              ),
              const SizedBox(height: 16),
              vm.batteryLevel.observer(
                (context, value) {
                  return value == null
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'Уровень заряда: ',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.grey[800],
                                ),
                              ),
                              TextSpan(
                                text: '$value%',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: value < 20
                                      ? Colors.red
                                      : (value < 50
                                          ? Colors.orange
                                          : Colors.green),
                                ),
                              ),
                            ],
                          ),
                        );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

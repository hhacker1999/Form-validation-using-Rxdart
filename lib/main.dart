import 'package:flutter/material.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/bloc/validation_bloc.dart';
import 'package:project/src/views/homeview/homeview.dart';
import 'package:provider/provider.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'homePage': (context) => Provider<ValidationBloc>(
            create: (_) => ValidationBloc(),
            dispose: (_, model) => model.dispose,
            child: HomePage()),
      },
      initialRoute: 'homePage',
    );
  }
}

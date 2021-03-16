import 'package:flutter/material.dart';
import 'package:project/src/bloc/validation_bloc.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          StreamBuilder<String>(
            stream: Provider.of<ValidationBloc>(context).emailStream,
            builder: (_, snap) => TextField(
              onChanged: Provider.of<ValidationBloc>(context).emailChanged,
              decoration: InputDecoration(errorText: snap.error),
            ),
          ),
          StreamBuilder<String>(
            stream: Provider.of<ValidationBloc>(context).passwordStream,
            builder: (_, snap) => TextField(
              onChanged: Provider.of<ValidationBloc>(context).passwordChanged,
              decoration: InputDecoration(errorText: snap.error),
            ),
          ),
          StreamBuilder<String>(
            stream: Provider.of<ValidationBloc>(context).confirmPasswordStream,
            builder: (_, snap) => TextField(
              onChanged:
                  Provider.of<ValidationBloc>(context).confirmPasswordChanged,
              decoration: InputDecoration(errorText: snap.error),
            ),
          ),
        ],
      ),
    );
  }
}

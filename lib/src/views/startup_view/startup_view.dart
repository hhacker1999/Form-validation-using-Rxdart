import 'package:flutter/material.dart';
import 'package:flutter_view_model/flutter_view_model.dart';
import 'package:project/src/app/app_constants.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/views/startup_view/startup_view_model/startupviewmodel.dart';

class StartupView extends StatelessWidget {
  final _model = locator<StartupViewModel>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ModelConsumer<StartupViewmodelState, StartupViewModel>(
          listener: (context, state) {
            if (state is StartupViewModelLoaded && state.isAuthenticated)
              Navigator.pushReplacementNamed(context, AppConstants.homeView);
              else if (state is StartupViewModelLoaded && !state.isAuthenticated)
              Navigator.pushReplacementNamed(context, AppConstants.loginView);
          },
          model: _model,
          builder: (_, state) => LinearProgressIndicator(),
        ),
      ),
    );
  }
}

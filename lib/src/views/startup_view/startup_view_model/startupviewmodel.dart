import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_view_model/flutter_view_model.dart';
import 'package:injectable/injectable.dart';
import 'package:project/src/app/locator.dart';
import 'package:project/src/managers/auth_manager.dart';
import 'package:project/src/managers/location_manager.dart';
part 'startupviewmodel_event.dart';
part 'startupviewmodel_state.dart';

@lazySingleton
class StartupViewModel
    extends BaseModel<StartupViewModelEvent, StartupViewmodelState> {
  final AuthManager _authManager = locator<AuthManager>();
  final LocationManager _locationManager = locator<LocationManager>();
  late StreamSubscription<StartupViewmodelState> _stateSubscription;
  StartupViewModel()
      : super(StartupViewModelLoading(),
            autoEvent: RunStartupOperationEvent()) {
    _clearSingleton();
  }

  @override
  Future<void> mapEventToState(StartupViewModelEvent event) async {
    updateState(
      StartupViewModelLoaded(
        await _operations(),
      ),
    );
  }

  Future<bool> _operations() async {
    await _locationManager.saveCurrentLocation();
    return await _authManager.isLoggedIn();
  }

  Future<void> _clearSingleton() async {
    _stateSubscription = this.state.listen(
      (state) {
        if (state is StartupViewModelLoaded) {
          locator.resetLazySingleton<StartupViewModel>(
            disposingFunction: (i) => i.dispose(),
          );
          _stateSubscription.cancel();
        }
      },
    );
  }
}

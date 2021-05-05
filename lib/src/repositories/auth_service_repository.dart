import 'package:project/src/app/locator.dart';
import 'package:project/src/services/auth_service.dart';

abstract class AuthServiceRepository {
  Future<bool> signInWithPhoneNumber(String phoneNumber);
  Future<bool> verifyOtp(String smsCode);
}

class AuthServiceRepositoryImplementation implements AuthServiceRepository {
  final AuthService _authService = locator<AuthService>();

  @override
  Future<bool> verifyOtp(String smsCode) async {
    var result = _authService.confirmOtp(smsCode);
    return result;
  }

  @override
  Future<bool> signInWithPhoneNumber(String phoneNumber) async {
    var result = await _authService.requestOtp(phoneNumber);
    return result;
  }
}

import 'package:project/src/services/auth_service.dart';

abstract class AuthServiceRepository {
  Future signInWithPhoneNumber(String phoneNumber);
  Future<bool> signInWithOtp(String smsCode);
}

class AuthServiceRepositoryImplementation implements AuthServiceRepository {
  final AuthService _authService;
  String verId;

  AuthServiceRepositoryImplementation(this._authService);

  @override
  Future signInWithPhoneNumber(String phoneNumber) async {
    var authResult;
    try {
      authResult =
          await _authService.signInAutomaticallywithPhoneNumber(phoneNumber);
      if (authResult is Map) {
        authResult['verId'] = verId;
      }
    } catch (e) {
      throw e;
    }
  }

  @override
  Future<bool> signInWithOtp(String smsCode) async {
    var authResult;
    try {
      await _authService.signInwithOtp(verId, smsCode);
      authResult = true;
    } catch (e) {
      authResult = false;
      throw e;
    }
    return authResult;
  }
}

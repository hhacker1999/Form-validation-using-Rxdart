import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

class AuthService {
  static const key = "0dd286b6-8882-11eb-a9bc-0200cd936042";
  Future<bool> requestOtp(String phoneNumber) async {
    var response = await http.get(
        Uri.parse('https://2factor.in/API/V1/$key/SMS/$phoneNumber/AUTOGEN'));
    Map<String, dynamic> decodedResponse = jsonDecode(response.body);
    String status = decodedResponse['status'];
    if (status == 'success')
      return true;
    else
      return false;
  }

  Future<void> signInwithOtp(String verId, String code) async {
    var creds =
        PhoneAuthProvider.credential(verificationId: verId, smsCode: code);
    await _signIn(creds);
  }
}

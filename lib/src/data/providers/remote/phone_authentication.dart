import 'package:firebase_auth/firebase_auth.dart';

class PhoneAuthentication {
  final FirebaseAuth _auth;

  PhoneAuthentication(this._auth);

  PhoneAuthenticationMixin _mixin;

  addListener(PhoneAuthenticationMixin _mixin){
    this._mixin = _mixin;
  }

  verifyPhoneNumber(String phoneNumber, {int resendToken}) async {
    return _auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: _onVerificationCompleted,
      verificationFailed: _onVerificationFailed,
      codeSent: _mixin.onCodeSent,
      forceResendingToken: resendToken,
      codeAutoRetrievalTimeout: _mixin.onCodeAutoRetrievalTimeout,
    );
  }

  void _onVerificationCompleted(PhoneAuthCredential credential) async {
    final UserCredential userCredential =  await _auth.signInWithCredential(credential);
    final String idToken = await userCredential.user.getIdToken();
    _mixin.onVerificationCompleted(idToken);
  }

  void _onVerificationFailed(FirebaseAuthException e) {
    _mixin.onVerificationFailed(e.code);
  }



}

mixin PhoneAuthenticationMixin {
  void onVerificationFailed(String error);
  void onVerificationCompleted(String idToken);
  void onCodeSent(String verificationId, int resendToken);
  void onCodeAutoRetrievalTimeout(String verificationId);
}

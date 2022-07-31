/* 구글 로그인 관련 프리젠터 */

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fitweenV1/presenter/firebase/firebase.dart';
import 'package:google_sign_in/google_sign_in.dart';

/// class
class GoogleLoginPresenter {
  // 구글 로그인
  static Future<UserCredential?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    if (googleAuth == null) return null;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await a.signInWithCredential(credential);
  }

  // 구글 로그아웃
  static void signOutWithGoogle() => a.signOut();
}
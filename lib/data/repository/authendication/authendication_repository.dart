import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:t_store_admin_panel/routes/routes.dart';

import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AuthendicationRepository extends GetxController {
  static AuthendicationRepository get instance => Get.find();

  /// Variable
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  User? get authUser => _auth.currentUser;

  bool get isAuthenticated => _auth.currentUser != null;

  @override
  void onReady() {
    _auth.setPersistence(Persistence.LOCAL);
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      Get.offAllNamed(TRoutes.dashboard);
    } else {
      Get.offAllNamed(TRoutes.login);
    }
  }

  /*--------------------------------Email & Password sign in ---------------------------*/

  /// [EmailAuthentication  LOGIN ] - signing
  Future<UserCredential> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.signInWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print("Login 1:${e.code}");
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      print("Login 2:${e.toString()}");
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      print("Login 3:");
      throw const TFormatException();
    } on PlatformException catch (e) {
      print("Login 4:${e.toString()}");
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// [EmailAuthentication create] - Register
  Future<UserCredential> registerWithEmailAndPassword(
      String email, String password) async {
    try {
      return await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Email Verifacation  mail verification
  Future<void> sendEmailVerification() async {
    try {
      await _auth.currentUser?.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Forget password
  Future<void> sendPasswordVerification(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Re- Authentication
  Future<void> reAuthendicationWithEmailAndPassword(
      String email, String password) async {
    try {
      AuthCredential credential =
          EmailAuthProvider.credential(email: email, password: password);
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Logout Function
  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      // Get.offAll(()=>LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw TFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'something went wrong, please try again ';
    }
  }

  /// Delete Account
// Future<void> deleteAccount() async{
//    try {
//      await UserRepoisitory.instance.removeUserRecord(_auth.currentUser!.uid);
//      await _auth.currentUser?.delete();
//      Get.offAll(()=>LoginScreen());
//    } on FirebaseAuthException catch (e) {
//      throw TFirebaseAuthException(e.code).message;
//    } on FirebaseException catch (e) {
//      throw TFirebaseException(e.code).message;
//    } on FormatException catch (_) {
//      throw TFormatException();
//    } on PlatformException catch (e) {
//      throw TPlatformException(e.code).message;
//    } catch (e) {
//      throw 'something went wrong, please try again ';
//    }
//  }
}

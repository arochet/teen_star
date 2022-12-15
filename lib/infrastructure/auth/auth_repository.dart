import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:teenstar/DOMAIN/auth/auth_failure.dart';
import 'package:teenstar/DOMAIN/auth/delete_failure.dart';
import 'package:teenstar/DOMAIN/auth/new_password_failure.dart';
import 'package:teenstar/DOMAIN/auth/reauthenticate_failure.dart';
import 'package:teenstar/DOMAIN/auth/reset_password_failure.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/user_data_dtos.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:teenstar/PRESENTATION/core/_utils/dev_utils.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required Password passwordAppli, required Password passwordPDF});
  Future<Either<AuthFailure, Unit>> modifyAccount(
      {required Nom nomUtilisateur, required int annePremiereRegle, required DateTime dateNaissance});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({required Password password});
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password});
  Future<Either<AuthFailure, Unit>> deleteALL();
  Future<Unit> newPassword({required Password newPassword, required bool isMotDePasseAppli});
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress});
  Future<Option<UserData>> getUserData();
  Future<void> signOut();
}

@LazySingleton(as: AuthRepository)
class FirebaseAuthFacade implements AuthRepository {
  final String userPrefs = 'user';
  final String passwordAppliPrefs = 'passwordAppli';
  final String passwordPDFPrefs = 'passwordPDF';
  final Future<SharedPreferences> _preferences = SharedPreferences.getInstance();
  FirebaseAuthFacade();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required Password passwordAppli, required Password passwordPDF}) async {
    printDev(
        'registerWithEmailAndPassword({required UserData userData, required Password passwordAppli, required Password passwordPDF})');
    try {
      final prefs = await _preferences;

      final passwordAppliStr = passwordAppli.getOrCrash();
      final passwordPDFStr = passwordPDF.getOrCrash();

      prefs.setString(userPrefs, json.encode(UserDataDTO.fromDomain(userData).toJson()));
      prefs.setString(passwordAppliPrefs, passwordAppli.getOrCrash());
      prefs.setString(passwordPDFPrefs, passwordPDF.getOrCrash());

      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({required Password password}) async {
    printDev('signInWithEmailAndPassword({required Password password})');
    final passwordStr = password.getOrCrash();

    //Vérifie la connexion internet
    if (!(await checkInternetConnexion())) return left(AuthFailure.noInternet());

    try {
      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<void> signOut() async {}

  @override
  Future<Option<UserData>> getUserData() async {
    printDev('getUserData()');
    final prefs = await _preferences;

    final String? userJson = prefs.getString(userPrefs);
    if (userJson == null) {
      return none();
    }

    UserDataDTO userDataDTO = UserDataDTO.fromJson(json.decode(userJson));
    //Le compte
    return some(userDataDTO.toDomain());
  }

  @override
  Future<Either<AuthFailure, Unit>> modifyAccount({
    required Nom nomUtilisateur,
    required int annePremiereRegle,
    required DateTime dateNaissance,
  }) async {
    printDev(
        'modifyAccount({required Nom nomUtilisateur, required int annePremiereRegle, required DateTime dateNaissance,})');
    final prefs = await _preferences;

    try {
      final userOption = await getUserData();

      return userOption.fold(
        () => left(const AuthFailure.serverError()),
        (user) {
          final UserData u = user.copyWith(
              userName: nomUtilisateur, anneePremiereRegle: annePremiereRegle, dateNaissance: dateNaissance);
          prefs.setString(
            userPrefs,
            json.encode(UserDataDTO.fromDomain(u).toJson()),
          );
          return right(unit);
        },
      );
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> deleteALL() async {
    printDev('deleteALL()');
    final prefs = await _preferences;
    prefs.remove(userPrefs);
    prefs.remove(passwordAppliPrefs);
    prefs.remove(passwordPDFPrefs);
    return right(unit);
  }

  @override
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password}) async {
    printDev('reauthenticateWithPassword({required Password password})');
    final prefs = await _preferences;
    final String? motDePasseCourant = prefs.getString(passwordAppliPrefs);
    if (motDePasseCourant == password.getOrCrash()) {
      return right(unit);
    } else {
      return left(ReauthenticateFailure.wrongPassword());
    }
  }

  @override
  Future<Unit> newPassword({required Password newPassword, required bool isMotDePasseAppli}) async {
    printDev('newPassword({required Password newPassword, required bool isMotDePasseAppli})');
    final prefs = await _preferences;
    prefs.setString(isMotDePasseAppli ? passwordAppliPrefs : passwordPDFPrefs, newPassword.getOrCrash());
    return unit;
  }

  @override
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress}) async {
    printDev('resetPassword({required EmailAddress emailAddress})');
    return left(const ResetPasswordFailure.serverError());
  }

  //A CHANGER AVEC LE PACKAGE CONNECTIVITY
  Future<bool> checkInternetConnexion() async {
    printDev('checkInternetConnexion()');
    if (!kIsWeb) {
      try {
        final result = await InternetAddress.lookup('google.com');
        if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
          return true;
        }
      } on SocketException catch (_) {
        return false;
      }
      return false;
    } else
      return true;
  }
}

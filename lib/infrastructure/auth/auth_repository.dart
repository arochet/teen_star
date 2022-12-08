import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:teenstar/DOMAIN/auth/auth_failure.dart';
import 'package:teenstar/DOMAIN/auth/delete_failure.dart';
import 'package:teenstar/DOMAIN/auth/new_password_failure.dart';
import 'package:teenstar/DOMAIN/auth/reauthenticate_failure.dart';
import 'package:teenstar/DOMAIN/auth/reset_password_failure.dart';
import 'package:teenstar/DOMAIN/auth/server_failure.dart';
import 'package:teenstar/DOMAIN/auth/user_data.dart';
import 'package:teenstar/DOMAIN/auth/value_objects.dart';
import 'package:teenstar/DOMAIN/core/value_objects.dart';
import 'package:teenstar/INFRASTRUCTURE/auth/user_data_dtos.dart';
import 'package:teenstar/INFRASTRUCTURE/core/crypt.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

abstract class AuthRepository {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required EmailAddress emailAddress, required Password password});
  Future<Either<AuthFailure, Unit>> modifyAccount({required Nom userName});
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password});
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password});
  Future<Either<NewPasswordFailure, Unit>> newPassword({required Password newPassword});
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress});
  Future<void> signOut();
}

@LazySingleton(as: AuthRepository, env: [Environment.dev, Environment.prod])
class FirebaseAuthFacade implements AuthRepository {
  FirebaseAuthFacade();

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword(
      {required UserData userData, required EmailAddress emailAddress, required Password password}) async {
    final emailAdressStr = emailAddress.getOrCrash();
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
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword(
      {required EmailAddress emailAdress, required Password password}) async {
    final emailAdressStr = emailAdress.getOrCrash();
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
    //Le compte
    return some(UserData(
        email: EmailAddress('email'),
        id: UniqueId.fromUniqueInt(0),
        passwordCrypted: false,
        userName: Nom('username'),
        typeAccount: TypeAccount(TypeAccountState.fail)));

    return none();
  }

  @override
  Future<Either<AuthFailure, Unit>> modifyAccount({required Nom userName}) async {
    try {
      return right(unit);
    } catch (e) {
      return left(const AuthFailure.serverError());
    }
  }

  @override
  Future<Either<DeleteFailure, Unit>> deleteAccountWithEmailAndPassword() async {
    return deleteAccount();
  }

  Future<Either<DeleteFailure, Unit>> deleteAccount() async {
    return right(unit);
  }

  @override
  Future<Either<ReauthenticateFailure, Unit>> reauthenticateWithPassword({required Password password}) async {
    return left(ReauthenticateFailure.notAuthenticated());
  }

  @override
  Future<Either<NewPasswordFailure, Unit>> newPassword({required Password newPassword}) async {
    return left(NewPasswordFailure.serverError());
  }

  @override
  Future<Either<ResetPasswordFailure, Unit>> resetPassword({required EmailAddress emailAddress}) async {
    return left(const ResetPasswordFailure.serverError());
  }

  //A CHANGER AVEC LE PACKAGE CONNECTIVITY
  Future<bool> checkInternetConnexion() async {
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

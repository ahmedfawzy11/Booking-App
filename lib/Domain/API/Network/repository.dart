import 'package:booking_app/Core/API/Network/endPoints.dart';
import 'package:booking_app/Core/Models/changePasswordModel.dart';
import 'package:booking_app/Core/Models/loginModel.dart';
import 'package:booking_app/Core/Models/profileModel.dart';
import 'package:booking_app/Core/Models/registerModel.dart';
import 'package:booking_app/Core/Models/updateModel.dart';
import 'package:booking_app/Domain/Models/changePasswordModel.dart';
import 'package:booking_app/Domain/Models/loginModel.dart';
import 'package:booking_app/Domain/Models/profileModel.dart';
import 'package:booking_app/Domain/Models/registerModel.dart';
import 'package:booking_app/Domain/Models/updateModel.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class Repository {
  Future<Either<PrimaryServerException, LoginModel>> login({
    required String email,
    required String password,
  });

  Future<Either<PrimaryServerException, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  });

  Future<Either<PrimaryServerException, ProfileModel>> profile({
    required String token,
  });

  Future<Either<PrimaryServerException, UpdateModel>> update({
    required String token,
    required String name,
    required String email,
  });

  Future<Either<PrimaryServerException, ChangePasswordModel>> changePassword({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
  });
}

class RepositoryImplementation extends Repository {
  final DioHelper dioHelper;

  RepositoryImplementation({
    required this.dioHelper,
  });

  @override
  Future<Either<PrimaryServerException, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    return basicErrorHandling<LoginModel>(
      onSuccess: () async {
        final response = await dioHelper.post(
          endPoint: loginEndPoint,
          data: {
            'email': email,
            'password': password,
          },
        );

        return LoginModel.fromJson(response,);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return basicErrorHandling<RegisterModel>(
      onSuccess: () async {
        final response = await dioHelper.post(
          endPoint: registerEndPoint,
          data: {
            'name': name,
            'email': email,
            'password': password,
            'passwordConfirmation': passwordConfirmation,
          },
        );

        return RegisterModel.fromJson(response,);
      },
      onPrimaryServerException: ((e) async {
        return e;
      }),
    );
  }

  @override
  Future<Either<PrimaryServerException, ProfileModel>> profile({
    required String token,
  }) async {
    return basicErrorHandling<ProfileModel>(
      onSuccess: () async {
        final response = await dioHelper.get(
          endPoint: profileEndPoint,
          token: token,
        );

        return ProfileModel.fromJson(response,);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, UpdateModel>> update({
    required String token,
    required String name,
    required String email,
  }) async {
    return basicErrorHandling<UpdateModel>(
      onSuccess: () async {
        final response = await dioHelper.get(
          endPoint: updateEndPoint,
          token: token,
          data: {
            'name': name,
            'email': email,
          },
        );

        return UpdateModel.fromJson(response,);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }

  @override
  Future<Either<PrimaryServerException, ChangePasswordModel>> changePassword({
    required String token,
    required String email,
    required String password,
    required String passwordConfirmation,
  }) async {
    return basicErrorHandling<ChangePasswordModel>(
      onSuccess: () async {
        final response = await dioHelper.get(
          endPoint: changePasswordEndPoint,
          token: token,
          data: {
            'email': email,
            'password': password,
            'passwordConfirmation': passwordConfirmation,
          },
        );

        return ChangePasswordModel.fromJson(response,);
      },
      onPrimaryServerException: (e) async {
        return e;
      },
    );
  }
}

extension on Repository {
  Future<Either<PrimaryServerException, T>> basicErrorHandling<T>({
    required Future<T> Function() onSuccess,
    Future<PrimaryServerException> Function(PrimaryServerException exception,)?
        onPrimaryServerException,
  }) async {
    try {
      final r = await onSuccess();
      return Right(r);
    } on PrimaryServerException catch (e, s,) {
      debugPrint(s.toString(),);
      return Left(e,);
    }
  }
}

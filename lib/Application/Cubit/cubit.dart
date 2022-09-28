import 'package:booking_app/Application/Cubit/states.dart';
import 'package:booking_app/Domain/API/Network/repository.dart';
import 'package:booking_app/Domain/Models/changePasswordModel.dart';
import 'package:booking_app/Domain/Models/loginModel.dart';
import 'package:booking_app/Domain/Models/profileModel.dart';
import 'package:booking_app/Domain/Models/registerModel.dart';
import 'package:booking_app/Domain/Models/updateModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBloc extends Cubit<AppStates> {
  final Repository repository;

  AppBloc({
    required this.repository,
  }) : super(AppInitialState());

  static AppBloc get(context) => BlocProvider.of<AppBloc>(context);

  LoginModel? loginModel;
  TextEditingController emailLogin = TextEditingController();
  TextEditingController passwordLogin = TextEditingController();

  void userLogin() async {
    emit(UserLoginLoadingState());

    final response = await repository.login(
      email: emailLogin.text,
      password: passwordLogin.text,
    );

    response.fold(
      (l) => emit(ErrorState(exception: l)),
      (r) {
        loginModel = r;
        emit(UserLoginSuccessState());
      },
    );
  }

  RegisterModel? registerModel;
  TextEditingController nameRegister = TextEditingController();
  TextEditingController emailRegister = TextEditingController();
  TextEditingController passwordRegister = TextEditingController();
  TextEditingController passwordConfirmationRegister = TextEditingController();

  void userRegister() async {
    emit(UserRegisterLoadingState());

    final response = await repository.register(
      name: nameRegister.text,
      email: emailRegister.text,
      password: passwordRegister.text,
      passwordConfirmation: passwordConfirmationRegister.text,
    );

    response.fold(
      (l) => emit(ErrorState(exception: l)),
      (r) {
        registerModel = r;
        emit(UserRegisterSuccessState());
      },
    );
  }

  ProfileModel? profileModel;

  void userProfile() async {
    emit(UserProfileLoadingState());

    final response = await repository.profile(
      token: loginModel!.data.apiToken,
    );

    response.fold(
      (l) => emit(ErrorState(exception: l)),
      (r) {
        profileModel = r;
        emit(UserProfileSuccessState());
      },
    );
  }

  UpdateModel? updateModel;
  TextEditingController updateName = TextEditingController();
  TextEditingController updateEmail = TextEditingController();

  void userUpdate() async {
    emit(UserUpdateLoadingState());

    final response = await repository.update(
      token: loginModel!.data.apiToken,
      name: updateName.text,
      email: updateEmail.text,
    );

    response.fold(
      (l) => emit(ErrorState(exception: l)),
      (r) {
        updateModel = r;
        emit(UserUpdateSuccessState());
      },
    );
  }

  ChangePasswordModel? changePasswordModel;
  TextEditingController changeEmail = TextEditingController();
  TextEditingController changePassword = TextEditingController();
  TextEditingController changePasswordConfirmation = TextEditingController();

  void userChangePassword() async {
    emit(UserChangePasswordLoadingState());

    final response = await repository.changePassword(
      token: loginModel!.data.apiToken,
      email: changeEmail.text,
      password: changePassword.text,
      passwordConfirmation: changePasswordConfirmation.text,
    );

    response.fold(
      (l) => emit(ErrorState(exception: l)),
      (r) {
        changePasswordModel = r;
        emit(UserChangePasswordSuccessState());
      },
    );
  }
}

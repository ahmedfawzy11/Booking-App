import 'package:booking_app/Core/API/Error/exceptions.dart';

abstract class AppStates {}

class AppInitialState extends AppStates {}

class UserLoginLoadingState extends AppStates {}

class UserLoginSuccessState extends AppStates {}

class UserRegisterLoadingState extends AppStates {}

class UserRegisterSuccessState extends AppStates {}

class UserProfileLoadingState extends AppStates {}

class UserProfileSuccessState extends AppStates {}

class UserUpdateLoadingState extends AppStates {}

class UserUpdateSuccessState extends AppStates {}

class UserChangePasswordLoadingState extends AppStates {}

class UserChangePasswordSuccessState extends AppStates {}

class ErrorState extends AppStates {
  final PrimaryServerException exception;

  ErrorState({
    required this.exception,
  });
}

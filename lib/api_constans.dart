import 'dart:io' show Platform;

class ApiConstants {
  static String baseUrl =
      Platform.isIOS ? 'http://0.0.0.0:3333/' : 'http://10.0.2.2:3333/';

  //Constants for Auth
  static String signIn = 'auth/signin';
  static String signUp = 'auth/signup';
  static String resetPassword = 'auth/password/reset';
  static String changePassword = 'auth/password/change';
  static String confirmEmail = 'auth/confirm/email/';
  static String confirmNewEmail = 'auth/confirm/new-email/';
  //Constants for Activity
  static String activityType = 'activity-type/';
  static String actity = 'activity/';
  //Constant for News
  static String news = 'news/';
  //Constant for University
  static String university = 'university/';
  //Constants for User
  static String userUpdate = 'user/update';
  static String userUpdatePassword = 'user/update/password';
  static String userUpdateEmail = 'user/update/email';
  //Constants for Project
  static String project = 'project/';
  static String projectAll = 'project/all';
}

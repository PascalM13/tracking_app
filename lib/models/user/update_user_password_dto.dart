class UpdateUserPasswordDto {
  final String password;
  final String newPassword;

  const UpdateUserPasswordDto(this.password, this.newPassword);

  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'newPassword': newPassword,
    };
  }
}

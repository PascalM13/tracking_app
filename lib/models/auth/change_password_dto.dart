class ChangePasswordDto {
  final String email;
  final String newPassword;
  final String token;

  const ChangePasswordDto(this.email, this.newPassword, this.token);

  Map<String, dynamic> toJson() {
    return {'email': email, 'newPassword': newPassword, 'token': token};
  }
}

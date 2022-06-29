class ResetPasswordDto {
  final String email;

  const ResetPasswordDto(this.email);

  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

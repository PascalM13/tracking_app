class UpdateUserMailDto {
  final String newEmail;

  const UpdateUserMailDto(this.newEmail);

  Map<String, dynamic> toJson() {
    return {
      'newEmail': newEmail,
    };
  }
}

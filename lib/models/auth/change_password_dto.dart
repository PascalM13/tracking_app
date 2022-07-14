/// Class which serves as a Data Transfer Object for sending a ChangePassword Request to the Backend
///
/// @author: PascalM13
class ChangePasswordDto {
  final String email;
  final String newPassword;
  final String token;

  const ChangePasswordDto(this.email, this.newPassword, this.token);

  //Function to create a Json from an object of class ChangePasswordDto
  Map<String, dynamic> toJson() {
    return {'email': email, 'newPassword': newPassword, 'token': token};
  }
}

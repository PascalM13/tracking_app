/// Class which serves as a Data Transfer Object for sending a UpdateUserPassword-Request to the Backend
///
/// @author: PascalM13
class UpdateUserPasswordDto {
  final String password;
  final String newPassword;

  const UpdateUserPasswordDto(this.password, this.newPassword);

  //Function to create a Json from an object of class UpdateUserPasswordDto
  Map<String, dynamic> toJson() {
    return {
      'password': password,
      'newPassword': newPassword,
    };
  }
}

/// Class which serves as a Data Transfer Object for sending a ResetPassword Request to the Backend
///
/// @author: PascalM13
class ResetPasswordDto {
  final String email;

  const ResetPasswordDto(this.email);

  //Function to create a Json from an object of class ResetPasswordDto
  Map<String, dynamic> toJson() {
    return {'email': email};
  }
}

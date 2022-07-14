/// Class which serves as a Data Transfer Object for sending a UpdateUserMail-Request to the Backend
///
/// @author: PascalM13
class UpdateUserMailDto {
  final String newEmail;

  const UpdateUserMailDto(this.newEmail);

  //Function to create a Json from an object of class UpdateUserMailDto
  Map<String, dynamic> toJson() {
    return {
      'newEmail': newEmail,
    };
  }
}

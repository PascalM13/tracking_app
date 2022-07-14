/// Class which serves as a Data Transfer Object for sending a Activity to the Backend
///
/// @author: PascalM13
class ActivityDto {
  int startDate;
  int endDate;
  int hearthrate;
  int steps;
  int distance;
  int bloodSugarOxygen;
  int userId;
  int activityTypeId;
  int projectId;

  ActivityDto(
      {required this.startDate,
      required this.endDate,
      this.hearthrate = 0, //Muss geändert werden, wenn nicht 0 bleiben soll
      this.steps = 0,
      this.distance = 0,
      this.bloodSugarOxygen = 0,
      required this.userId,
      required this.activityTypeId,
      required this.projectId});

  //Function to create a Json from an object of class ActivityDto
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['hearthrate'] = hearthrate;
    data['steps'] = steps;
    data['distance'] = distance;
    data['bloodSugarOxygen'] = bloodSugarOxygen;
    data['userId'] = userId;
    data['activityTypeId'] = activityTypeId;
    data['projectId'] = projectId;
    return data;
  }
}

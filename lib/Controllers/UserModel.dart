class UserModel {
  String firstName;
  String lastName;
  String email;
  String uid;

  UserModel({required this.firstName, required this.lastName, required this.email, required this.uid});

  Map<String, dynamic> toMap() {
    return {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "uid": uid,
    };
  }
}

class Login {
  String? token;
  int? userID;
  String? userEmail;
  String? role;

  Login({this.token, this.userID, this.userEmail, this.role});

  factory Login.fromJson(Map<String, dynamic> obj) {
    return Login(
      token: obj["token"],
      userID: int.parse(obj['userID']),
      userEmail: obj["userEmail"],
      role: obj['role'],
    );
  }
}
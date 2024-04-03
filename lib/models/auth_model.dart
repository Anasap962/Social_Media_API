class AuthModel {
    String email;
    String password;
    String? username;

    AuthModel({
        required this.email,
        required this.password,
         this.username,
    });

    factory AuthModel.fromJson(Map<String, dynamic> json) => AuthModel(
        email: json["email"],
        password: json["password"],
        username: json["username"]??"user name not found",
    );

    Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
        "username": username,
    };
}

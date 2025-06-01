class User {
  final int id;
  final String email;
  final String name;
  final String gender;
  final String dob;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.gender,
    required this.dob,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    print(json);
    return User(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      gender: json['gender'],
      dob: json['dob'],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "gender": gender,
    "email": email,
    'dob' : dob
  };

}

/*class UserModel {
  final String nom;
  final String prenom;
  final String email;
  final String password;
  final String date_de_naissance;
  final String telephone;
  final String image;
  String token;

  UserModel({
    required this.nom,
    required this.prenom,
    required this.email,
    required this.password,
    required this.date_de_naissance,
    required this.telephone,
    required this.image,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      nom: json['nom'],
      prenom: json['prenom'],
      email: json['email'],
      password: json['password'],
      date_de_naissance: json['date_de_naissance'],
      telephone: json['telephone'],
      image: json['image'],
      token: json['token'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "nom": nom,
      "prenom": prenom,
      "email": email,
      "password": password,
      "date_de_naissance": date_de_naissance,
      "telephone": telephone,
      "image": image,
      "token": token,
    };
  }
}*/
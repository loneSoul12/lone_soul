import 'package:lone_soul/models/interests.dart';

class AppUser {
  AppUser(
      {this.userId,
      this.age,
      this.email,
      this.gender = 'man',
      this.imageUrl,
      this.interests,
      this.location,
      this.password,
      this.username});
  String? userId;
  String? username;
  String? email;
  String? password;
  String? gender;
  String? location;
  int? age;
  final String? imageUrl;
  List<Interest>? interests;

  Map<String, dynamic> userToJson(AppUser user) {
    return {
      'id': user.userId,
      'username': user.username,
      'email': user.email,
      'gender': user.gender,
      'location': user.location,
      'age': user.age,
    };
  }

  factory AppUser.fromJson(Map<String, dynamic> user) {
    return AppUser(
      userId: user[''],
      username: user[''],
      email: user[''],
      gender: user[''],
      location: user[''],
      age: user[''],
      imageUrl: user[''],
      interests: user[''],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return '${userId},';
  }
}

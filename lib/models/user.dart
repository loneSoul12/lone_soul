import 'package:lone_soul/models/interests.dart';
import 'package:lone_soul/models/preference.dart';

class AppUser {
  AppUser({
    this.userId,
    this.age,
    this.email,
    this.gender = 'man',
    this.imageUrl,
    this.interests,
    this.location,
    this.password,
    this.username,
  });

  String? userId;
  String? username;
  String? email;
  String? password;
  String? gender;
  String? location;
  int? age;
  final String? imageUrl;
  List<Interest>? interests;
  Preference? preference;

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
      userId: user['id'],
      username: user['username'],
      email: user['email'],
      gender: user['gender'],
      location: user['location'],
      age: user['age'],
      imageUrl: user['profile_picture'],
    );
  }
  @override
  String toString() {
    // TODO: implement toString
    return '${userId},';
  }
}

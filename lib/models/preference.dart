import 'package:lone_soul/models/interests.dart';

class Preference {
   Preference({
    this.userId,
    this.gender,
    this.id,
    this.maxAge,
    this.minAge,
  });

  final String? id;
  final String? userId;
  final String? gender;
  final int? minAge;
  final int? maxAge;
  List<Interest>? interests = [];

  factory Preference.fromJson(Map<String, dynamic> preference) {
    return Preference(
      id: preference['id'],
      userId: preference['user_id'],
      gender: preference['gender_preference'],
      maxAge: preference['max_age'],
      minAge: preference['min_age'],
    );
  }
}

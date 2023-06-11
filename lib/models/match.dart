import 'package:lone_soul/models/user.dart';

class MatchUser {
  MatchUser({
    this.id,
    this.matchScore = 0,
    this.match,
  });

  final String? id;
  AppUser? match;
  final double matchScore;

  Map<String, dynamic> userToJson(MatchUser user) {
    return {
      'id': user.id,
    };
  }

  factory MatchUser.fromJson(Map<String, dynamic> match) {
    return MatchUser(
      matchScore: match['match_score'],
      match: AppUser.fromJson(match),
      id: match['id'],
    );
  }
}

class Match {
    Match({
    required this.userId,
    required this.age,
    this.gender,
    this.imageUrl,
    this.location,
    required this.username,
    this.matchScore = 0,
  });

  final int userId;
  final String username;
  final String? gender;
  final String? location;
  final int age;
  final String? imageUrl;
  final double matchScore;
  List<String> interests = [];

  Map<String, dynamic> userToJson(Match user) {
    return {
      'id': user.userId,
      'username': user.username,
      'gender': user.gender,
      'location': user.location,
      'age': user.age,
      'imageUrl': user.imageUrl
    };
  }

  factory Match.fromJson(Map<String, dynamic> user) {
    return Match(
      userId: user['id'],
      username: user['username'],
      gender: user['gender'],
      location: user['location'],
      age: user['age'],
      imageUrl: user['profile_picture'],
      matchScore: user['match_score']
    );
  }
}

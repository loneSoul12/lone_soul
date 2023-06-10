class AppUser {
  const AppUser(
      {this.userId,
      this.age,
      this.email,
      this.gender,
      this.imageUrl,
      this.interests,
      this.location,
      this.password,
      this.username});
  final int? userId;
  final String? username;
  final String? email;
  final String? password;
  final String? gender;
  final String? location;
  final int? age;
  final String? imageUrl;
  final List<String>? interests;

  Map<String, dynamic> userToJson(AppUser user) {
    return {
      'id': user.userId,
      'username': user.username,
      'email': user.email,
      'gender': user.gender,
      'location': user.location,
      'age': user.age,
      'imageUrl': user.imageUrl
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
}

class User {
  const User(
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

  factory User.fromJson(Map<String, dynamic> user) {
    return User(
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

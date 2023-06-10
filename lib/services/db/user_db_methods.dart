import 'package:image_picker/image_picker.dart';
import 'package:lone_soul/models/interests.dart';
import 'package:lone_soul/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDBMethods {
  final supabaseInstance = Supabase.instance;

  //insert users to database
  Future<void> insertUser(AppUser appUser, XFile image) async {
    final userData = appUser.userToJson(appUser);
    try {
      final imageUrl = await uploadImage(image);
      await supabaseInstance.client.from('users').insert(userData);
    } on PostgrestException catch (e) {
      print(e);
      return;
    } catch (e) {
      print(e);
      return;
    }
  }

  //get user
  Future<AppUser?> getUser(String id) async {
    try {
      final postgresUser = await supabaseInstance.client
          .from('users')
          .select()
          .eq('id', id)
          .single() as Map<String, dynamic>;
      final appUser = AppUser.fromJson(postgresUser);
      return appUser;
    } catch (e) {
      print(e);
      return null;
    }
  }
  //get interests

  //get a list of matches

  //add user preference

  //match two users

  //add user interests
  Future<void> insertUserInterests(
      List<Interest> interests, String userId) async {
    try {
      for (var interest in interests) {
        await supabaseInstance.client
            .from('user_interests')
            .insert({'user_id': userId, 'interest_id': interest.id});
      }
    } on PostgrestException catch (e) {
      print(e);
      return;
    }
  }

  //upload user image
  Future<String?> uploadImage(XFile image) async {
    try {
      final bytes = await image.readAsBytes();
      //final fileExt = image.path.split('.').last;
      final fileName = image.name;
      await supabaseInstance.client.storage
          .from('images')
          .uploadBinary(fileName, bytes);
      final imageUrl = await supabaseInstance.client.storage
          .from('images')
          .createSignedUrl(fileName, 60 * 60 * 24 * 365 * 10);
      return imageUrl;
    } on StorageException catch (e) {
      print(e);
      return null;
    }
  }
}

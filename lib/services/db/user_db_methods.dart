import 'package:image_picker/image_picker.dart';
import 'package:lone_soul/models/interests.dart';
import 'package:lone_soul/models/preference.dart';
import 'package:lone_soul/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class UserDBMethods {
  final supabaseInstance = Supabase.instance;

  //insert users to database
  Future<void> insertUser(AppUser appUser, XFile image) async {
    var userData = appUser.userToJson(appUser);
    try {
      final imageUrl = await uploadImage(image);
      userData.addAll({'profile_picture': imageUrl});
      await supabaseInstance.client.from('users').insert(userData);
      await insertUserInterests(appUser.interests!, appUser.userId!);
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

      final interests1 = await supabaseInstance.client
          .from('user_interests')
          .select<List<Map<String, dynamic>>>()
          .eq('user_id', id);

      final interests1MapList = await supabaseInstance.client
          .from('interests')
          .select<List<Map<String, dynamic>>>()
          .in_('id', interests1.map((e) => e['interest_id'] as int).toList());
      final interests1List =
          interests1MapList.map((e) => Interest.fromJson(e)).toList();

      appUser.interests = interests1List;

      final preferenceMap = await supabaseInstance.client
          .from('preferences')
          .select<Map<String, dynamic>?>()
          .eq('user_id', id)
          .maybeSingle();

      final preference = Preference.fromJson(preferenceMap ?? {});

      final preferenceInterest1Map = await supabaseInstance.client
          .from('interests')
          .select<List<Map<String, dynamic>>>()
          .in_('id', preferenceMap?['interests_preference'] ?? []);

      final preferenceInterestList =
          preferenceInterest1Map.map((e) => Interest.fromJson(e)).toList();

      preference.interests = preferenceInterestList;

      appUser.preference = preference;

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

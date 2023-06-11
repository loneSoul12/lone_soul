import 'package:lone_soul/models/user.dart';
import 'package:lone_soul/services/db/user_db_methods.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ConversationDBMethods {
  final supabaseInstance = Supabase.instance;

  //insert users to database
  Future<void> createConversation(
    String userId1,
    String userId2,
  ) async {
    try {
      final map1 = await supabaseInstance.client
          .from('conversations')
          .select<Map<String, dynamic>>()
          .contains('user_id_1', userId1)
          .contains('user_id_2', userId2)
          .maybeSingle();

      if (map1.isNotEmpty) {
        return;
      }

      final map2 = await supabaseInstance.client
          .from('conversations')
          .select<Map<String, dynamic>>()
          .contains('user_id_1', userId2)
          .contains('user_id_2', userId1)
          .maybeSingle();

      if (map2.isNotEmpty) {
        return;
      }

      await supabaseInstance.client.from('conversations').insert({
        'user_id_1': userId1,
        'user_id_2': userId2,
      });
    } on PostgrestException catch (e) {
      print(e);
      return;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<List<AppUser>> getConversations(String userId) async {
    final userDBMethods = UserDBMethods();
    try {
      final map1 = await supabaseInstance.client
          .from('conversations')
          .select<List<Map<String, dynamic>>>()
          .contains('user_id_1', userId);
      final map2 = await supabaseInstance.client
          .from('conversations')
          .select<List<Map<String, dynamic>>>()
          .contains('user_id_2', userId);
      final finalMap = [...map1, ...map2];

      final requests = finalMap.map((e) {
        if (e['user_id_1'] != userId) {
          return userDBMethods.getUser(e['user_id_1']);
        }

        return userDBMethods.getUser(e['user_id_2']);
      });

      final results = await Future.wait(requests);
      results.removeWhere((element) => element == null);
      final finalResult = results.map((e) => e!).toList();
      return finalResult;
    } on PostgrestException catch (e) {
      print(e);
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}

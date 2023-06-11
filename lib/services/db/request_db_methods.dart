import 'package:lone_soul/services/db/conversation_db_methods.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RequestDBMethods {
  final supabaseInstance = Supabase.instance;

  //insert users to database
  Future<void> sendRequest(
    String requesterId,
    String requesteeId,
  ) async {
    final conversationDbMethods = ConversationDBMethods();
    try {
      final map1 = await supabaseInstance.client
          .from('requests')
          .select<Map<String, dynamic>>()
          .contains('requester_id', requesterId)
          .contains('requestee_id', requesteeId)
          .maybeSingle();

      if (map1.isNotEmpty) {
        return;
      }

      await supabaseInstance.client.from('requests').insert({
        'requester_id': requesterId,
        'requestee_id': requesteeId,
      });

      final map2 = await supabaseInstance.client
          .from('requests')
          .select<Map<String, dynamic>>()
          .contains('requester_id', requesteeId)
          .contains('requestee_id', requesterId)
          .maybeSingle();

      if (map2.isNotEmpty) {
        await conversationDbMethods.createConversation(
          requesteeId,
          requesterId,
        );
      }
    } on PostgrestException catch (e) {
      print(e);
      return;
    } catch (e) {
      print(e);
      return;
    }
  }
}

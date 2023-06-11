import 'package:image_picker/image_picker.dart';
import 'package:lone_soul/models/interests.dart';
import 'package:lone_soul/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class MatchDBMethods {
  final supabaseInstance = Supabase.instance;

  //insert users to database
  Future<List<Match>> getMatches(String userId) async {
    try {
      await supabaseInstance.client.from('users').insert(userData);
    } on PostgrestException catch (e) {
      print(e);
      return;
    } catch (e) {
      print(e);
      return;
    }
  }

  Future<double?> getMatchScore(AppUser user1, AppUser user2) async {
    final interests1 = await supabaseInstance.client
        .from('user_interests')
        .select<List<Map<String, dynamic>>>()
        .eq('user_id', user1.userId);

    final interest1List = await supabaseInstance.client
        .from('interests')
        .select<List<Map<String, dynamic>>>()
        .in_('id', interests1.map((e) => e['interest_id'] as int).toList());

    final preference1 = await supabaseInstance.client
        .from('preferences')
        .select<Map<String, dynamic>?>()
        .eq('user_id', user1.userId)
        .maybeSingle();


    final preferenceInterest1List = await supabaseInstance.client
        .from('interests')
        .select<List<Map<String, dynamic>>>()
        .in_('id', preference1?['interests_preference']);


    final interests2 = await supabaseInstance.client
        .from('user_interests')
        .select<List<Map<String, dynamic>>>()
        .eq('user_id', user2.userId);

    final interest2List = await supabaseInstance.client
        .from('interests')
        .select<List<Map<String, dynamic>>>()
        .in_('id', interests2.map((e) => e['interest_id'] as int).toList());

    final preference2 = await supabaseInstance.client
        .from('preferences')
        .select<Map<String, dynamic>?>()
        .eq('user_id', user2.userId)
        .maybeSingle();

    final preferenceInterest2List = await supabaseInstance.client
        .from('interests')
        .select<List<Map<String, dynamic>>>()
        .in_('id', preference2?['interests_preference']);

    final matchScore = 0.0;

    
  }

  double _checkAge()
}

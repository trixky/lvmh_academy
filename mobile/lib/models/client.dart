import 'package:mobile/config.dart';
import 'package:mobile/models/stats.dart';

class LVMHclient {
  const LVMHclient({
    required this.id,
    required this.firstname,
    required this.lastname,
    this.email,
    this.phone,
    this.stats,
  });

  final String id;
  final String firstname;
  final String lastname;
  final String? email;
  final String? phone;
  final LVMHclientStats? stats;

  String get passUrl {
    String url =
        "${LVMHconfig.API_BASE_URL}?firstname=$firstname&lastname=$lastname";

    if (email != null && email!.isNotEmpty) {
      url += "&email=$email";
    }
    if (phone != null && phone!.isNotEmpty) {
      url += "&phone=$phone";
    }

    return url;
  }
}

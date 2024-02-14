import 'package:mobile/models/client.dart';
import 'package:mobile/models/stats.dart';

Future<List<LVMHclient>> searchClient(
    List<LVMHclient> clientList, String search,
    {int limit = 1}) async {
  final List<LVMHclient> findedClients = [];

  for (final LVMHclient client in clientList) {
    if (client.firstname.toLowerCase().contains(search.toLowerCase()) ||
        client.lastname.toLowerCase().contains(search.toLowerCase())) {
      findedClients.add(client);
    }

    if (findedClients.length >= limit) {
      break;
    }
  }

  return findedClients;
}

List<LVMHclient> defaultClients = [
  LVMHclient(
    id: "default.1",
    firstname: 'Jean',
    lastname: 'JACQUES',
    email: 'jean.jacques@example.com',
    phone: '0606060606',
    stats: LVMHclientStats(
      purchases: [
        123.45,
        5042.30,
        1815.0,
        13517.0,
        837.7,
      ],
    ),
  ),
  LVMHclient(
    id: "default.2",
    firstname: 'John',
    lastname: 'SMITH',
    email: 'john.smith@example.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.3",
    firstname: 'Marie',
    lastname: 'LYN',
    email: 'marie.lyn@example.com',
    phone: '0606060606',
  ),
];

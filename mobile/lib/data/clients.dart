import 'package:mobile/models/client.dart';
import 'package:mobile/models/stats.dart';

Future<List<LVMHclient>> searchClient(List<LVMHclient> clientList, String search, {int limit = 1}) async {
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
    firstname: 'Bernard',
    lastname: 'Arnaud',
    email: 'bernard.arnaud@lvmh.com',
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
    firstname: 'Antonio',
    lastname: 'Belloni',
    email: 'antonio.belloni@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.3",
    firstname: 'Delphine',
    lastname: 'Arnaud',
    email: 'delphine.arnaud@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.4",
    firstname: 'nicolas',
    lastname: 'bazire',
    email: 'nicolas.bazire@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.5",
    firstname: 'Pietro',
    lastname: 'Beccari',
    email: 'pietro.beccari@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.6",
    firstname: 'Pietro',
    lastname: 'Beccari',
    email: 'pietro.beccari@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.7",
    firstname: 'Stéphane',
    lastname: 'Bianchi',
    email: 'stéphane.bianchi@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.8",
    firstname: 'Michael',
    lastname: 'Burke',
    email: 'michael.burke@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.9",
    firstname: 'Chantal',
    lastname: 'Gaemperle',
    email: 'chantal.gaemperle@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.10",
    firstname: 'Jean Jacques',
    lastname: 'Guiony',
    email: 'jeanjacques.guiony@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.11",
    firstname: 'Chris',
    lastname: 'de Lapuente',
    email: 'chris.delapuente@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.12",
    firstname: 'Stéphane',
    lastname: 'Rinderknech',
    email: 'stephane.rinderknech@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.13",
    firstname: 'Philippe',
    lastname: 'Schaus',
    email: 'philippe.schaus@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.13",
    firstname: 'Jérôme',
    lastname: 'Sibille',
    email: 'jérôme.sibille@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.14",
    firstname: 'Sidney',
    lastname: 'Toledano',
    email: 'sidney.toledano@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.15",
    firstname: 'Jean-Baptiste',
    lastname: 'Voisin',
    email: 'jeanbaptiste.voisin@lvmh.com',
    phone: '0606060606',
  ),
];

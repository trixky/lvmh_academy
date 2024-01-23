import 'package:mobile/models/client.dart';

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

List<LVMHclient> defaultClients = const [
  LVMHclient(
    id: 1,
    firstname: 'Bernard',
    lastname: 'Arnaud',
    email: 'bernard.arnaud@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 2,
    firstname: 'Antonio',
    lastname: 'Belloni',
    email: 'antonio.belloni@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 3,
    firstname: 'Delphine',
    lastname: 'Arnaud',
    email: 'delphine.arnaud@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 4,
    firstname: 'nicolas',
    lastname: 'bazire',
    email: 'nicolas.bazire@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Pietro',
    lastname: 'Beccari',
    email: 'pietro.beccari@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Pietro',
    lastname: 'Beccari',
    email: 'pietro.beccari@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Stéphane',
    lastname: 'Bianchi',
    email: 'stéphane.bianchi@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Michael',
    lastname: 'Burke',
    email: 'michael.burke@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Chantal',
    lastname: 'Gaemperle',
    email: 'chantal.gaemperle@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Jean Jacques',
    lastname: 'Guiony',
    email: 'jeanjacques.guiony@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Chris',
    lastname: 'de Lapuente',
    email: 'chris.delapuente@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Stéphane',
    lastname: 'Rinderknech',
    email: 'stephane.rinderknech@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Philippe',
    lastname: 'Schaus',
    email: 'philippe.schaus@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Jérôme',
    lastname: 'Sibille',
    email: 'jérôme.sibille@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Sidney',
    lastname: 'Toledano',
    email: 'sidney.toledano@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: 5,
    firstname: 'Jean-Baptiste',
    lastname: 'Voisin',
    email: 'jeanbaptiste.voisin@lvmh.com',
    phone: '0606060606',
  ),
];

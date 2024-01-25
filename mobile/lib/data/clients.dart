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
    firstname: 'Pierre-Henri',
    lastname: 'KUHN',
    email: 'pierrehenri.kuhn@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.3",
    firstname: 'Noorin',
    lastname: 'VIRANI',
    email: 'noorin.virani@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.4",
    firstname: 'Gautier',
    lastname: 'PIGASSE',
    email: 'gautier.pigasse@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.5",
    firstname: 'Samuel',
    lastname: 'DEMONT',
    email: 'samuel.demont@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.6",
    firstname: 'Juan-Carlos',
    lastname: 'PENARANDA',
    email: 'juancarlos.penaranda@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.7",
    firstname: 'Coraline',
    lastname: 'GRIFFIE',
    email: 'coraline.griffie@pcd.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.8",
    firstname: 'Benoît',
    lastname: 'AUBAS',
    email: 'benoit.aubas@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.9",
    firstname: 'Liliana',
    lastname: 'BAQUERO',
    email: 'liliana.baquero@42paris.fr',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.10",
    firstname: 'Nicolas',
    lastname: 'MOREAU',
    email: 'nicolas.moreau@haigo.com',
    phone: '0606060606',
    stats: LVMHclientStats(
      purchases: [
        800.0,
        2600,
        1815.0,
      ],
    ),
  ),
  LVMHclient(
    id: "default.11",
    firstname: 'Guewen',
    lastname: 'LOUSSOUARN',
    email: 'guewen.loussouarn@haigo.com',
    phone: '0606060606',
    stats: LVMHclientStats(
      purchases: [
        450,
        1200.5,
        900,
        450,
      ],
    ),
  ),
  LVMHclient(
    id: "default.12",
    firstname: 'Gonzague',
    lastname: 'DE PIREY',
    email: 'gonzague.depirey@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.19",
    firstname: 'Pierre-Julien',
    lastname: 'BOUSQUET',
    email: 'pierrejulien.bousquet@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.20",
    firstname: 'Alexandre',
    lastname: 'MEERSON',
    email: 'alexandre.meerson@sephora.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.21",
    firstname: 'Johanna',
    lastname: 'PONTE',
    email: 'johanna.ponte@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.22",
    firstname: 'Marie',
    lastname: 'BELLET',
    email: 'marie.bellet@moethennessy.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.23",
    firstname: 'Matthieu',
    lastname: 'NICOU',
    email: 'matthieu.nicou@lvmh.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.24",
    firstname: 'Pierre-Edouard',
    lastname: 'PRELY',
    email: 'pierreedouard.prely@celine.com',
    phone: '0606060606',
  ),
  LVMHclient(
    id: "default.25",
    firstname: 'Anne',
    lastname: 'MICHAUT',
    email: 'anne.michaut@hec.fr',
    phone: '0606060606',
  ),
];

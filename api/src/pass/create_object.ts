import config from '../../config.json';
import credentials from '../../google-wallet.json'
import jwt from 'jsonwebtoken';

const classId = `${config.issuerId}${config.classIdExtension}`;

export default async function createPassObject(req: any, res: any) {
    let objectSuffix = `${req.body.email.replace(/[^\w.-]/g, '_')}`;
    let objectId = `${config.issuerId}.${objectSuffix}`;

    let genericObject = {
        'id': `${objectId}`,
        'classId': classId,
        'genericType': 'GENERIC_TYPE_UNSPECIFIED',
        'hexBackgroundColor': config.passClass.backgroundColor,
        'logo': {
            'sourceUri': {
                'uri':  config.passClass.logoUrl}
        },
        'cardTitle': {
            'defaultValue': {
                'language': 'fr',
                'value': config.passClass.title
            }
        },
        'subheader': {
            'defaultValue': {
                'language': 'fr',
                'value': config.passClass.subTitle
            }
        },
        'header': {
            'defaultValue': {
                'language': 'fr',
                'value': config.passClass.demoValues.name
            }
        },
        'barcode': {
            'type': 'QR_CODE',
            'value': `${objectId}`
        },
        'heroImage': {
            'sourceUri': {
                'uri': config.passClass.heroImage
            }
        },
        'textModulesData': [
            {
                'header': 'POINTS',
                'body': config.passClass.demoValues.points,
                'id': 'points'
            },
            {
                'header': 'RANK',
                'body': config.passClass.demoValues.rank,
                'id': 'rank'
            }
        ]
    };

    const claims = {
        iss: credentials.client_email,
        aud: 'google',
        origins: [],
        typ: 'savetowallet',
        payload: {
            genericObjects: [
                genericObject
            ]
        }
    };

    const token = jwt.sign(claims, credentials.private_key, { algorithm: 'RS256' });
    const saveUrl = `https://pay.google.com/gp/v/save/${token}`;

    res.send(`<a href='${saveUrl}'><img src='wallet-button.png'></a>`);
}
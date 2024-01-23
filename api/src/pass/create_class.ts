import config from '../../config.json';

const classId = `${config.issuerId}${config.classIdExtension}`;

export default async function createPassClass(req: any, res: any, httpClient: any) {
    // TODO: Create a Generic pass class
    let genericClass = {
        'id': `${classId}`,
        'classTemplateInfo': {
            'cardTemplateOverride': {
                'cardRowTemplateInfos': [
                    {
                        'twoItems': {
                            'startItem': {
                                'firstValue': {
                                    'fields': [
                                        {
                                            'fieldPath': 'object.textModulesData["points"]'
                                        }
                                    ]
                                }
                            },
                            'endItem': {
                                'firstValue': {
                                    'fields': [
                                        {
                                            'fieldPath': 'object.textModulesData["rank"]'
                                        }
                                    ]
                                }
                            }
                        }
                    }
                ]
            },
            'detailsTemplateOverride': {
                'detailsItemInfos': [
                    {
                        'item': {
                            'firstValue': {
                                'fields': [
                                    {
                                        'fieldPath': 'class.imageModulesData["event_banner"]'
                                    }
                                ]
                            }
                        }
                    },
                    {
                        'item': {
                            'firstValue': {
                                'fields': [
                                    {
                                        'fieldPath': 'class.textModulesData["game_overview"]'
                                    }
                                ]
                            }
                        }
                    },
                    {
                        'item': {
                            'firstValue': {
                                'fields': [
                                    {
                                        'fieldPath': 'class.linksModuleData.uris["official_site"]'
                                    }
                                ]
                            }
                        }
                    }
                ]
            }
        },
        'imageModulesData': [
            {
                'mainImage': {
                    'sourceUri': {
                        'uri': config.passClass.subHeroImage
                    },
                    'contentDescription': {
                        'defaultValue': {
                            'language': 'en-US',
                            'value': config.passClass.title
                        }
                    }
                },
                'id': 'event_banner'
            }
        ],
        'textModulesData': [
            {
                'header': config.passClass.join.header,
                'body': config.passClass.join.body,
                'id': 'game_overview'
            }
        ],
        'linksModuleData': {
            'uris': [
                {
                    'uri': 'https://io.google/2022/',
                    'description': 'Official I/O \'22 Site',
                    'id': 'official_site'
                }
            ]
        }
    };

    console.log("ouiiiiiiiiiiiiii la generic lcass")
    console.log(genericClass)

    let response;
    try {
        // Check if the class exists already
        response = await httpClient.request({
            url: `${config.baseUrl}/genericClass/${classId}`,
            method: 'GET'
        });

        console.log('Class already exists');
        console.log(response);
    } catch (err: any) {
        if (err.response && err.response.status === 404) {
            // Class does not exist
            // Create it now
            response = await httpClient.request({
                url: `${config.baseUrl}/genericClass`,
                method: 'POST',
                data: genericClass
            });

            console.log('Class insert response');
            console.log(response);
        } else {
            // Something else went wrong
            console.log(err);
            res.send('Something went wrong...check the console logs!');
        }
    }
}
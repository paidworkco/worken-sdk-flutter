import 'package:flutter_dotenv/flutter_dotenv.dart';

void configureDotenv() async => await dotenv.load(fileName: '.env', mergeWith: {
      'contractAddress': '',
      'polygonApiKey': '' // todo test this myb remove it
    });

String getPolygonApiKey() => dotenv.get('polygonApiKey');

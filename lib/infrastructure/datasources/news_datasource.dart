import 'dart:convert';

import 'package:ghp_app/utils/failures/failure.dart';
import 'package:http/http.dart' as http;

import '../../domain/entities/news_entity.dart';

abstract class NewsDatasource {
  void getNewsDataFromApi();
}

class NewsDatasourceImpl implements NewsDatasource {
  final http.Client client;
  
  const NewsDatasourceImpl({
    required this.client,
  });

  @override
  void getNewsDataFromApi() async {

    final response = await client.get(Uri.parse('https://api.ghp.stoelting-michael.de/api/v1/news'), headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode != 200) {
      throw GeneralFailure();
    } else {
      final responseBody = json.decode(response.body);
      print(responseBody);
    }
  }

  
}
import 'dart:convert';

import 'package:section/qoute/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote() async {
  final reponse = await http.get(
    Uri.parse("https://api.api-ninjas.com/v1/quotes"),
    headers: {'X-Api-Key': 'g5tgL1q0VTgw1GK4hwfzrw==bzeLDscvILEyj697'},
  );

  if (reponse.statusCode == 200) {
    List<dynamic> data = jsonDecode(reponse.body);

    return data.map((json) => Quote.fromJson(json)).toList();
  }

  throw Exception("Failed to load quote");
}


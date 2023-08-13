import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;



class ActualApp extends StatefulWidget {
  const ActualApp({super.key});

  @override
  State<ActualApp> createState() => _ActualAppState();
}

class _ActualAppState extends State<ActualApp> {

  String response = '';



  Future<String> makeRequest() async {
    var url = Uri.parse(
      'https://spoyer.com/api/en/get.php?login=boop1337&token=46559-KEYlKW1aM1MWiNN&task=predata&sport=soccer&day=today'
    );
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
      print('===============');
      print('$jsonResponse');
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
    return '';
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HTTPS Request'),
      ),
      body: Column(
        children: [
          Text(response),
          const SizedBox(height: 20,),
          TextButton(
            child: const Text('Request'),
            onPressed: () async {
              await makeRequest();
            },
          ),
        ],
      ),
    );
  }
}

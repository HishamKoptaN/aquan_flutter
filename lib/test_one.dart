import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

Future<List<dynamic>> fetchData() async {
  final response = await http.get(
    Uri.parse(
      'https://aquan.aquan.website/api/dashboard/users',
    ),
  );
  if (response.statusCode == 200) {
    return jsonDecode(response.body)['users'];
  } else {
    throw Exception('Failed to load data');
  }
}

Stream<List<dynamic>> fetchDataAsStream() async* {
  while (true) {
    try {
      final data = await fetchData();
      yield data;
    } catch (e) {
      yield [];
    }
    await Future.delayed(const Duration(seconds: 10));
  }
}

class MyStreamPage extends StatelessWidget {
  const MyStreamPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stream API Example')),
      body: StreamBuilder<List<dynamic>>(
        stream: fetchDataAsStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index]['name']),
                );
              },
            );
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}

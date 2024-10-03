import 'dart:convert';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../database/database_helper.dart';
import '../model/events_model.dart';

class EventController extends GetxController {
  DatabaseHelper dbHelper = DatabaseHelper();
  RxList<Results> listData =
      <Results>[].obs; // Store results in a reactive list

  @override
  void onInit() {
    fetchData();
    super.onInit();
  }

  String? nextPageUrl; // To store the next page URL

  Future<void> fetchData({String? url}) async {
    // Use the provided URL or default to the first page of the API
    final apiUrl = Uri.parse(url ?? 'https://api.predicthq.com/v1/events/');

    final headers = {
      'Authorization':
          'Bearer ChdrgKfN8RD2geL3dqKeM6toScW-I_HO4AVcNtZa', // Replace with your actual token
      'Content-Type': 'application/json', // Optional header
    };

    try {
      final response = await http.get(apiUrl, headers: headers);

      if (response.statusCode == 200) {
        // Parse the JSON data
        var data = jsonDecode(response.body);
        print("API data is $data");

        // Check and handle the 'next' field
        if (data['next'] != null) {
          if (data['next'] is String) {
            nextPageUrl =
                data['next']; // Store the next page URL if it's a string
          } else {
            print(
                'Warning: "next" is not a String. It is of type: ${data['next'].runtimeType}');
            nextPageUrl = null;
          }
        } else {
          nextPageUrl = null; // No next page
        }

        if (data['results'] is List) {
          var results = data['results'];
          print('Number of results: ${results.length}');

          // Convert each result to a Results object and add it to listData
          for (var result in results) {
            Results event = Results.fromJson(result);
            listData.add(event);
            await dbHelper.insertEvent({
              'id': event.id,
              'title': event.title,
              'description': event.description,
              'start': event.start,
              'end': event.end
            }); // Assuming you have a fromJson constructor
            // Add event to the list
          }

          print('Model list length: ${listData.length}');
        } else {
          print(
              'Error: "results" is not a list. It is of type: ${data['results'].runtimeType}');
        }
      } else {
        // Handle error if the request fails
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  // Function to fetch the next page if it exists
  Future<void> fetchNextPage() async {
    if (nextPageUrl != null) {
      await fetchData(url: nextPageUrl);
    } else {
      print('No more pages to load.');
    }
  }
}

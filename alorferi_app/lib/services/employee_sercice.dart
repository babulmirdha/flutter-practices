// employee_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

class EmployeeService {
  final String apiUrl = 'YOUR_EMPLOYEE_API_ENDPOINT';

  Future<List<Employee>> fetchEmployees(int page, int pageSize) async {
    final response = await http.get(
        Uri.parse('$apiUrl?page=$page&pageSize=$pageSize'));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return data.map((e) =>
          Employee(
            id: e['id'],
            name: e['name'],
            position: e['position'],
          )).toList();
    } else {
      throw Exception('Failed to load employees');
    }
  }
}

class Employee {
  final String id;
  final String name;
  final String position;

  Employee({required this.id, required this.name, required this.position});

}

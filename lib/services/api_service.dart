import 'package:http/http.dart' as http;

class ApiService {

  Future fetchData() async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/albums/1');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print(response.body);
      }
    }catch (e) {
      print(e.toString());
    }
  }
}
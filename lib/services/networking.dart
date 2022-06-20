import 'package:http/http.dart' as http;
import 'dart:convert';

// Custom class i.e., neither Stateless Widget not Stateful Widget
class NetworkHelper{
  // Whenever an object instance is created of this class one must pass in *url* which is a required argument
  NetworkHelper(this.url);
  // And that argument get stored in the variable named "url"
  final String url;

  /*
   This getData() method is an asynchronous function that returns a value that is available in *Future* (return type)
  And it returns all the corresponding information given by openweathermap api like location name, temperature, humidity etc...
  */
  Future getData() async{
    http.Response response = await http.get(Uri.parse(url));

    if(response.statusCode == 200) {
      String data = response.body;

      // parses the string ("{"text": "something"}")and returns a JSON object ({"text": "something"})
      return jsonDecode(data);
    } else{
      print(response.statusCode);
    }
  }
}
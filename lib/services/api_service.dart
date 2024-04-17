import 'package:http/http.dart' as http;

class ApiService {
  final baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons() async {
    final url = Uri.parse('$baseUrl/$today');

    // Futer<T> : 미래에 받을 값의 타입이 T라고 알려줌
    // await 시 Futer를 벗겨냄
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print(response.body);

      return;
    }

    throw Error();
  }
}

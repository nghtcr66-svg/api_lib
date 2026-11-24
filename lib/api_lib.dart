import 'package:api_lib/api/api_client.dart';
import 'package:api_lib/models/publish_game_request_model.dart';
import 'package:api_lib/models/register_request_model.dart';
import 'package:dio/dio.dart';

void request_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.getMyStatistic('Bearer $token');
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void post_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.publishGame(
      'Bearer $token',
      PublishGameRequestModel(
        category: 'image',
        description: 'desc',
        endsAt: DateTime.now()
            .add(const Duration(days: 2))
            .toUtc()
            .toIso8601String(),
        name: 'Alehacartoha',
        reminderEnabled: false,
        startsAt: DateTime.now()
            .add(const Duration(days: 1))
            .toUtc()
            .toIso8601String(),
        winningPoints: 300,
      ),
    );
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void register_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.registerME(
      'Bearer $token',
      RegisterRequestModel(
        email: "test@test.ru",
        fullName: "test",
        password: "12345678",
        phone: "+71111111111",
        username: "test",
      ),
    );
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void getInfo_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.getUserInfo('Bearer $token', 1);
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}




void heartbeat_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.heartbeatGame('Bearer $token', 1);
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

void publishgame_func() async {
  final dio = Dio();
  // Эта одна строчка напечатает в консоль весь запрос, заголовки и ответ сервера!
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  try {
    final api = ApiClient(dio);
    const token = 'y79RLpsBDEgwgqUJtawimBWloyhZoOqt6rQF1ZRW8fE';

    final response = await api.submitGame('Bearer $token', 1);
    print('Успех: $response');
  } catch (e) {
    print('Ошибка: $e');
  }
}

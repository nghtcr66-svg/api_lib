import 'package:api_lib/models/game_details_model/game_details_model.dart';
import 'package:api_lib/models/game_puzzle_model/game_puzzle_model.dart';
import 'package:api_lib/models/heart_beat_game_model/heart_beat_game_model.dart';
import 'package:api_lib/models/info_model.dart';
import 'package:api_lib/models/join_game_request_model.dart';
import 'package:api_lib/models/join_game_response_model/join_game_response_model.dart';
import 'package:api_lib/models/my_statistic_model/my_statistic_model.dart';
import 'package:api_lib/models/publish_game_request_model.dart';
import 'package:api_lib/models/publish_game_response_model/publish_game_response_model.dart';
import 'package:api_lib/models/register_request_model.dart';
import 'package:api_lib/models/register_response_model/register_response_model.dart';
import 'package:api_lib/models/submit_game_model.dart';
import 'package:dio/dio.dart' hide Headers;
import 'package:retrofit/retrofit.dart';

import '../models/get_me_model.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: 'https://imech.hr.skillmad.ru/api')
//общие для всех заголовки
@Headers(<String, dynamic>{'Accept': 'application/json'})
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  //-----------------------------GET----------------------------
  @GET('/v1/users/me')
  //GetMeModel уже сгенерирован расширением и мы прямо в сам запрос передем токен
  Future<List<GetMeModel>> getMe(@Header('Authorization') String bearerToken);

  @GET('/v1/users/me/statistics')
  //мы прямо в сам запрос передем токен
  Future<MyStatisticModel> getMyStatistic(
    @Header('Authorization') String bearerToken,
  );

  @GET('/v1/users/{id}')
  //мы прямо в сам запрос передем токен
  Future<InfoModel> getUserInfo(
    @Header('Authorization') String bearerToken,
    @Path("id") int userId,
  );

  @GET('/v1/games/{id}')
  //мы прямо в сам запрос передем токен
  Future<GameDetailsModel> getGameDetails(
    @Header('Authorization') String bearerToken,
    @Path("id") int userId,
  );

  @GET('/v1/games/{id}/puzzle')
  //мы прямо в сам запрос передем токен
  Future<GamePuzzleModel> getGamePuzzle(
    @Header('Authorization') String bearerToken,
    @Path("id") int userId,
  );


  //------------------------POST-------------------------------
  @POST('/v1/games')
  Future<PublishGameResponseModel> publishGame(
    @Header('Authorization') String bearerToken,
    @Body() PublishGameRequestModel body, // <--  посылка с данными
  );

  @POST('/v1/auth/register')
  Future<RegisterResponseModel> registerME(
    @Header('Authorization') String bearerToken,
    @Body() RegisterRequestModel body, // <--  посылка с данными
  );

  @POST('/v1/games/{id}/heartbeat')
  Future<HeartBeatGameModel> heartbeatGame(
    @Header('Authorization') String bearerToken,
    @Path("id") int userId,
  );

  @POST('/v1/games/{id}/result')
  Future<SubmitGameModel> submitGame(
    @Header('Authorization') String bearerToken,
    @Path("id") int Id,
  );

  @POST('v1/games/{id}/join')
  Future<JoinGameResponseModel> joinGame(
    @Header('Authorization') String bearerToken,
    @Path("id") int Id,
    @Body() JoinGameRequestModel body,
  );



}

import 'package:dio/dio.dart';
import 'package:mem/core/networking/api_constants.dart';
import 'package:mem/features/authentication/login/data/models/login_request_body.dart';
import 'package:mem/features/authentication/login/data/models/set_firebase_id_request_body.dart';
import 'package:mem/features/authentication/register/models/register_requset_body.dart';
import 'package:mem/features/authentication/register/models/register_respons.dart';
import 'package:mem/features/group%20chat/data/model/get_all_groups_response.dart';
import 'package:mem/features/home/ui/Screens/notification/data/model/notification_respons_body.dart';
import 'package:mem/features/meeting/data/models/meetings_respons_body.dart';
import 'package:mem/features/meeting/splash%20screen/data/models/token_request_body.dart';
import 'package:mem/features/meeting/splash%20screen/data/models/token_vaildate_response_body.dart';
import 'package:retrofit/http.dart';

import '../../features/authentication/login/data/models/login_respons.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.loginEndpoint)
  Future<UserData> login(
    @Body() LoginRequestBody loginRequestBody,
  );

  @POST(ApiConstants.registerEndpoint)
  Future<RegisterData> register(
    @Body() RegisterRequestBody registerRequestBody,
  );

  @POST(ApiConstants.setFireBaseId)
  Future setFirebaseId(
    @Header('Authorization') String token,
    @Body() SetFireBaseIdBodyRequest setFireBaseIdBodyRequest,
  );

  @POST(ApiConstants.putUserPic)
  Future putUserPic(
      @Header('Authorization') String token, @Body() FormData file);

  @GET(ApiConstants.meetingEndpoint)
  Future<List<MeetingResponsBody>> getAllMeetings(
    @Header('Authorization') String token,
  );

  @GET(ApiConstants.notificationsEndpoint)
  Future<List<NotificationResponsBody>> getAllNotification(
    @Header('Authorization') String token,
  );

    @POST(ApiConstants.vaildateToken)
  Future <TokenVaildateResponseBody>vailadateToken(
    @Body() TokenRequestBody tokenRequestBody,
  );

@GET(ApiConstants.getAllGroup)
  Future<List<GetAllGroupResponseBody>> getAllGroups(
    @Header('Authorization') String token,
  );


}

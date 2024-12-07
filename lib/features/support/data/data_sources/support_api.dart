// import 'package:retrofit/retrofit.dart';
// import '../../../../core/networking/api_constants.dart';
// import 'package:dio/dio.dart';
// import '../model/chat.dart';
// import '../model/msg.dart';
// import '../model/send_msg_req_model.dart';
// part 'support_api.g.dart';

// @RestApi(
//   baseUrl: ApiConstants.apiBaseUrl,
// )
// abstract class SupportApi {
//   factory SupportApi(
//     Dio dio, {
//     String baseUrl,
//   }) = _SupportApi;
//   //! Get
//   @GET(
//     ApiConstants.support,
//   )
//   Future<List<Chat>> getChats();
//   //! Get Chats
//   @GET(
//     '${ApiConstants.support}/{chatId}',
//   )
//   Future<List<Msg>> getMsgs({
//     @Path('chatId') required int chatId,
//   });
//   //! Get Msgs
//   @POST(
//     ApiConstants.support,
//   )
//   Future<Msg> sendMsg({
//     @Body() required SendMsgReqModel sendMsgReqModel,
//   });
// }

// class Chat {
// }

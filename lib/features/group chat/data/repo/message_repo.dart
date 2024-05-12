
import 'package:mem/core/networking/api_service.dart';
import 'package:mem/features/group%20chat/data/model/message_model.dart';

class MessageRepo {
  final ApiService _apiService;

  MessageRepo(this._apiService);

 Stream <List<MessageModel>> getAllMessageRepo(
      String token, id)  {
  
      final respons =  _apiService.getAllMessage(token, id);
      return respons;
  }









}
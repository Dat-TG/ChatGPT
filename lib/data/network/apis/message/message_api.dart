// ignore_for_file: unused_field

import 'dart:async';

import 'package:boilerplate/core/data/network/dio/dio_client.dart';
import 'package:boilerplate/data/network/constants/endpoints.dart';
import 'package:boilerplate/data/network/rest_client.dart';
import 'package:boilerplate/domain/entity/message/message.dart';

class MessageApi {
  // dio instance
  final DioClient _dioClient;

  // rest-client instance
  final RestClient _restClient;

  // injecting dio instance
  MessageApi(this._dioClient, this._restClient);

  Future<Message> sendMessage(List<Message> messages) async {
    try {
      final res = await _dioClient.dio.post(Endpoints.chat, data: {
        "messages": messages.map((e) => e.toMap()).toList(),
        "model": "gpt-3.5-turbo",
        "temperature": 0.5
      });
      return Message.fromMap(res.data["choices"][0]["message"]);
    } catch (e) {
      print(e.toString());
      throw e;
    }
  }

  /// sample api call with default rest client
//  Future<PostsList> getPosts() {
//
//    return _restClient
//        .get(Endpoints.getPosts)
//        .then((dynamic res) => PostsList.fromJson(res))
//        .catchError((error) => throw NetworkException(message: error));
//  }
}

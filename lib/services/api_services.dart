import 'package:dio/dio.dart';

import 'network_client.dart';

class ApiServices {
  final NetworkClient networkClient;

  ApiServices({required this.networkClient});

  Future<Response> register(Map<String, Object> params) async {
    return networkClient.post('api/register', params);
  }

  Future<Response> login(Map<String, Object> params) async {
    return networkClient.post('api/login', params);
  }

  Future<Response> logout() async {
    return networkClient.post('api/logout', {});
  }

  Future<Response> getEvents() async {
    return networkClient.get('api/events', {});
  }

  Future<Response> eventDetail(int eventId) async {
    return networkClient.get('api/event/$eventId', {});
  }

  Future<Response> searchEvent(Map<String, Object> paramas) async {
    return networkClient.post('api/search', paramas);
  }

  Future<Response> createEvent(Map<String, Object> paramas) async {
    return networkClient.post('api/save-event', paramas);
  }

  Future<Response> uploadImage(Map<String, Object> paramas) async {
    return networkClient.post('api/upload_image', paramas);
  }
}

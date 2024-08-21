import '../models/call_result_model.dart';
import '../repoistory/call_repository.dart';
import '../services/dio_service.dart';

class PostsRepository extends CallRepository {
  @override
  Future<CallResult> delete(String id, [Map<String, dynamic>? args]) {
    throw UnimplementedError();
  }

  @override
  Future<CallResult> get([Map<String, dynamic>? args]) async {
    try {
      var response = await DioService.dio.get('posts');
      if ((response.statusCode ?? 0) >= 200 &&
          (response.statusCode ?? 0) < 299) {
        return CallResult(
            status: response.statusCode!,
            statusMessage: response.statusMessage!,
            data: response.data,
            isSuscces: true,
            error: '');
      } else {
        return CallResult(
            isSuscces: false,
            status: response.statusCode!,
            statusMessage: response.statusMessage!,
            data: null,
            error: 'Error : ${response.statusCode!}');
      }
    } catch (e) {
      return CallResult(
          isSuscces: false,
          status: 500,
          statusMessage: '',
          data: null,
          error: '$e');
    }
  }

  @override
  Future<CallResult> patch(String id, Map<String, dynamic> data,
      [Map<String, dynamic>? args]) {
    throw UnimplementedError();
  }

  @override
  Future<CallResult> post(Map<String, dynamic> data,
      [Map<String, dynamic>? args]) {
    throw UnimplementedError();
  }

  @override
  Future<CallResult> put(String id, Map<String, dynamic> data,
      [Map<String, dynamic>? args]) {
    throw UnimplementedError();
  }
}

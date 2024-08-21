import '/models/call_result_model.dart';

abstract class CallRepository {
  Future<CallResult> get([Map<String, dynamic>? args]);
  Future<CallResult> post(Map<String, dynamic> data,
      [Map<String, dynamic>? args]);
  Future<CallResult> put(String id, Map<String, dynamic> data,
      [Map<String, dynamic>? args]);
  Future<CallResult> patch(String id, Map<String, dynamic> data,
      [Map<String, dynamic>? args]);
  Future<CallResult> delete(String id, [Map<String, dynamic>? args]);
}

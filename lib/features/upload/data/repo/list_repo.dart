import 'package:tasky/core/networking/api_error_handler.dart';
import 'package:tasky/features/upload/data/apis/api_list.dart';
import 'package:tasky/features/upload/data/model/create_task_model.dart';
import 'package:tasky/features/upload/data/model/edit_task_model.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';
import 'package:tasky/features/upload/data/model/refresh_token_model.dart';

import '../../../../core/networking/api_result.dart';

class ListRepo {
  final ListWebServices _listWebServices;

  ListRepo(this._listWebServices);

  Future<ApiResult<List<Task>>> listData(int pageNumber) async {
    try {
      final response = await _listWebServices.taskList(pageNumber);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<Task>> oneTask(String taskId) async {
    try {
      final response = await _listWebServices.oneTask(taskId);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<Task>> createTask(CreateTaskModel taskCreate) async {
    try {
      final response = await _listWebServices.createTask(taskCreate);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<Task>> editTask(
      String id, EditTaskModel editTaskModel) async {
    try {
      final response = await _listWebServices.editTask(id, editTaskModel);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<void>> deleteTask(
      String id) async {
    try {
      final response = await _listWebServices.deleteTask(id);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<RefreshTokenModel>> refreshToken(String accessToken) async {
    try {
      final response = await _listWebServices.refreshToken(accessToken);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

}

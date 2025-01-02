import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:tasky/core/networking/api_constants.dart';
import 'package:tasky/features/upload/data/apis/list_const.dart';
import 'package:tasky/features/upload/data/model/create_task_model.dart';
import 'package:tasky/features/upload/data/model/edit_task_model.dart';
import 'package:tasky/features/upload/data/model/list_model.dart';
import 'package:tasky/features/upload/data/model/refresh_token_model.dart';

part 'api_list.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ListWebServices {
  factory ListWebServices(Dio dio, {String? baseUrl}) = _ListWebServices;

  @GET(ListConst.listEndPoint)
  Future<List<Task>> taskList(
    @Query('page') int pageNumber,
  );

  @GET("${ListConst.taskFunctionsEndPoint}/{taskId}")
  Future<Task> oneTask(@Path('taskId') String id);

  @POST(ListConst.taskFunctionsEndPoint)
  Future<Task> createTask(@Body() CreateTaskModel taskCreate);

  @PUT('${ListConst.taskFunctionsEndPoint}/{taskId}')
  Future<Task> editTask(
      @Path('taskId') String id, @Body() EditTaskModel editTaskModel);

  @DELETE('${ListConst.taskFunctionsEndPoint}/{taskId}')
  Future<void> deleteTask(@Path("taskId") String id);

  @GET(ListConst.refreshTokenEndPoint)
  Future<RefreshTokenModel> refreshToken(@Query('token') String refreshToken);
}

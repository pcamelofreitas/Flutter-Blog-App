import 'package:blog_app_2/src/shared/types/result.dart';
import 'package:dio/dio.dart';
import 'package:blog_app_2/src/shared/errors/default_error_messages.dart';
import 'package:blog_app_2/src/shared/errors/http_error.dart';
import 'package:blog_app_2/src/shared/types/result.dart';

const Duration MOCK_DELAY = Duration(seconds: 0);

class ApiRepository {
  final Dio _httpClient;

  Future<Options> get headers async {
    return Options();
  }

  ApiRepository({
    required Dio httpClient,
  })  : _httpClient = httpClient,
        super();

  _handleErrors(
      HttpError error, DioError exception, StackTrace stackTrace) async {
    // TODO: Handle errors when necessary
  }

  // Requests
  Future<Result> get({
    required String url,
    Map<String, dynamic> queryParams = const {},
  }) async {
    await Future.delayed(MOCK_DELAY);
    try {
      final Response response = await _httpClient.get(
        url,
        queryParameters: queryParams,
        options: await headers,
      );

      return Success(response.data);
    } on DioError catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(exception, stackTrace);
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (e) {
      return Failure(
        HttpUnknownError(
          slug: DefaultErrorMessages.unknownError,
        ),
      );
    }
  }

  Future<Result> post({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    await Future.delayed(MOCK_DELAY);
    try {
      final Response response = await _httpClient.post(
        url,
        data: body,
        options: await headers,
      );
      return Success(response.data);
    } on DioError catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(exception, stackTrace);
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }

  Future<Result> patch({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    await Future.delayed(MOCK_DELAY);
    try {
      final Response response = await _httpClient.patch(
        url,
        data: body,
        options: await headers,
      );
      return Success(response.data);
    } on DioError catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(exception, stackTrace);
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }

  Future<Result> put({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    await Future.delayed(MOCK_DELAY);
    try {
      final Response response = await _httpClient.put(
        url,
        data: body,
        options: await headers,
      );
      return Success(response.data);
    } on DioError catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(exception, stackTrace);
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }

  Future<Result> delete({
    required String url,
    Map<String, dynamic> body = const {},
  }) async {
    await Future.delayed(MOCK_DELAY);
    try {
      final Response response = await _httpClient.delete(
        url,
        data: body,
        options: await headers,
      );
      return Success(response.data);
    } on DioError catch (exception, stackTrace) {
      final HttpError error = await parseHttpError(exception, stackTrace);
      await _handleErrors(error, exception, stackTrace);

      return Failure(error);
    } catch (exception) {
      return Failure(
        HttpUnknownError(
          slug: exception.toString(),
        ),
      );
    }
  }
}

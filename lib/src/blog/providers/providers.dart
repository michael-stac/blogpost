import 'dart:io';

import 'package:blogapp/constant/enum.dart';
import 'package:blogapp/constant/url_endpoint.dart';
import 'package:blogapp/utilities/applog.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/blog_model.dart';
import '../repository/schemas.dart';

abstract class _Blog {
  Future<void> create(String title, String subTitle, String body);
  Future<void> update(BlogModel details,);
  Future<void> delete(String id);
  Future<void> fetchAll();
  Future<void> fetchById(String id);
}

class BlogProvider extends ChangeNotifier implements _Blog {
  final _endpoint = EndPoint().getClient();

  List<BlogModel> _blogList = [];
  List<BlogModel> get blogList => _blogList;

  BlogModel? _blog;
  BlogModel? get blog => _blog;

  BlogModel? _updateblog;
  BlogModel? get updateblog => _updateblog;

  ViewState _state = ViewState.idle;
  ViewState get state => _state;

  String message = '';

  @override
  Future<void> create(String title, String subTitle, String body) async {
    _state = ViewState.busy;
    _updateState();
    try {
      final MutationOptions options = MutationOptions(
        document: gql(createBlogMutation),
        variables: {
          "title": title,
          "subTitle": subTitle,
          "body": body,
        },
      );

      final QueryResult result = await _endpoint.value.mutate(options);
      appLog(result.toString());

      if (result.hasException) {
        final error = result.exception?.graphqlErrors[0].message;
        message = error ?? 'An error occurred';
        _state = ViewState.error;
        _updateState();
        return;
      }

      _state = ViewState.success;
      _updateState();
    } catch (e) {
      appLog('Error: ${e.toString()}');
      message = e.toString();
      _state = ViewState.error;
      _updateState();
    }
  }

  @override
  Future<void> delete(String blogId) async {
    _state = ViewState.busy;
    _updateState();
    try {
      final MutationOptions options = MutationOptions(
        document: gql(deleteBlogMutation),
        variables: {
          "blogId": blogId,
        },
      );

      final QueryResult result = await _endpoint.value.mutate(options);
      appLog(result.toString());

      if (result.hasException) {
        final error = result.exception?.graphqlErrors[0].message;
        message = error ?? 'An error occurred';
        _state = ViewState.error;
        _updateState();
        return;
      }

      _state = ViewState.success;
      _updateState();
    } catch (e) {
      appLog('Error: ${e.toString()}');
      message = e.toString();
      _state = ViewState.error;
      _updateState();
    }
  }

  _updateState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      notifyListeners();
    });
  }

  @override
  Future<void> fetchAll() async {
    _state = ViewState.busy;
    _updateState();

    try {
      final QueryOptions options = QueryOptions(
        document: gql(fetchAllBlogsQuery),
          fetchPolicy: FetchPolicy.networkOnly

      );

      final result = await _endpoint.value.query(options);

      appLog(result.toString());

      if (result.hasException) {
        final List<GraphQLError> errors = result.exception?.graphqlErrors ?? [];
        final error = errors.isNotEmpty ? errors[0].message : 'Unknown error';
        message = error ?? 'error occurred';
        _state = ViewState.error;
        _updateState();
        return;
      }

      List data = result.data?['allBlogPosts'] ?? [];

      List<BlogModel> tempList = [];

      for (var i in data) {
        final dataModel = BlogModel.fromJson(i);
        tempList.add(dataModel);
      }

      _blogList = tempList;
      _state = ViewState.success;
      _updateState();
    } on SocketException catch (e) {
      appLog('Error message dkfkdkfkdfkdkfdf ${e.toString()}');
      message = 'network failed ${e.message}';
      _state = ViewState.error;
      _updateState();
    } catch (e) {
      appLog('Error message dkfkdkfkdfkdkfdf ${e.toString()}');

      message = e.toString();
      _state = ViewState.error;
      _updateState();
    }
  }

  @override
  Future<void> fetchById(String id) async {
    _state = ViewState.busy;
    _updateState();

    try {
      final QueryOptions options = QueryOptions(
        document: gql(fetchSingleBlogsByID),
        variables: {
          "blogId": id,
        },
        fetchPolicy: FetchPolicy.networkOnly
      );

      final result = await _endpoint.value.query(options);

      appLog(result.toString());

      if (result.hasException) {
        final List<GraphQLError> errors = result.exception?.graphqlErrors ?? [];

        final error = errors.isNotEmpty ? errors[0].message : 'Unknown error';
        message = error ?? 'error occurred';
        _state = ViewState.error;
        _updateState();
        return;
      }

      final data = result.data?['blogPost'];

      if (data == null) {
        message = 'blog details is not available';
        _state = ViewState.error;
        _updateState();
        return;
      }

      final dataModel = BlogModel.fromJson(data);
      _blog = dataModel;
      _state = ViewState.success;
      _updateState();
    } on SocketException catch (e) {
      appLog('Error message dkfkdkfkdfkdkfdf ${e.toString()}');
      message = 'network failed ${e.message}';
      _state = ViewState.error;
      _updateState();
    } catch (e) {
      appLog('Error message dkfkdkfkdfkdkfdf ${e.toString()}');

      message = e.toString();
      _state = ViewState.error;
      _updateState();
    }
  }

  @override

  Future<void> update(BlogModel details) async {
    _state = ViewState.busy;
    _updateState();
    try {
      final QueryOptions options = QueryOptions(
        document: gql(updateBlogMutation),
        variables: {
          "blogId": details.id,
          "title": details.title,
          "subTitle": details.subTitle,
          "body": details.body,
        },
        fetchPolicy: FetchPolicy.networkOnly,
      );

      final QueryResult result = await _endpoint.value.query(options);
      appLog(result.toString());

      if (result.hasException) {
        final error = result.exception?.graphqlErrors[0].message;
        message = error ?? 'An error occurred';
        _state = ViewState.error;
        _updateState();
        return;
      }

      final data = result.data?['updateBlog'];

      if (data == null) {
        message = 'Blog details are not available';
        _state = ViewState.error;
        _updateState();
        return;
      }

      final dataModel = BlogModel.fromJson(data['blogPost']);
      _updateblog = dataModel;
      _state = ViewState.success;
      _updateState();
    } on SocketException catch (e) {
      appLog('Socket Exception: ${e.toString()}');
      message = 'Network failed: ${e.message}';
      _state = ViewState.error;
      _updateState();
    } catch (e) {
      appLog('Error: ${e.toString()}');
      message = e.toString();
      _state = ViewState.error;
      _updateState();
    }
  }

}

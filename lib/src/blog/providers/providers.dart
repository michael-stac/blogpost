import 'dart:io';

import 'package:blogapp/constant/enum.dart';
import 'package:blogapp/constant/url_endpoint.dart';
import 'package:blogapp/utilities/applog.dart';
import 'package:flutter/cupertino.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../models/blog_model.dart';
import '../repository/schemas.dart';

abstract class _Blog {
  Future<void> create();
  Future<void> update(BlogModel details);
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
  Future<void> create() {
    // TODO: implement create
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
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
        final error = result.exception?.graphqlErrors[0].message;

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
        final error = result.exception?.graphqlErrors[0].message;

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
  Future<void> update(BlogModel details)async {
    _state = ViewState.busy;
    _updateState();

    try {
      final QueryOptions options = QueryOptions(
          document: gql(updateblogpostJson),
          variables:  {
            "id": details.id,
            "title": details.title,
            "subTitle": details.body,
            "body": 'body',
            "dateCreated": details.dateCreated,
          },
          fetchPolicy: FetchPolicy.networkOnly
      );

      final result = await _endpoint.value.query(options);

      appLog(result.toString());

      if (result.hasException) {
        final error = result.exception?.graphqlErrors[0].message;

        message = error ?? 'error occurred';
        _state = ViewState.error;
        _updateState();
        return;
      }

      final data = result.data?['updateBlog'];

      if (data == null) {
        message = 'blog details is not available';
        _state = ViewState.error;
        _updateState();
        return;
      }

      final dataModel = BlogModel.fromJson(data);
      _updateblog = dataModel;
      _state = ViewState.success;
      _updateState();

      fetchById(details.id);
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
}

// ignore_for_file: use_build_context_synchronously

import 'package:blogapp/screen/main_activity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../../constant/url_endpoint.dart';
import '../../../utilities/message.dart';
import '../../../utilities/router.dart';
import '../schema/create_blog_post_schema.dart';


class CreateBlogPostProvider extends ChangeNotifier {
  bool _status = false;

  String _response = '';

  bool get getStatus => _status;

  String get getResponse => _response;

  final EndPoint _point = EndPoint();

  bool _showPassword = false;
  bool get showPassword => _showPassword;
  set showPassword(bool value) {
    _showPassword = value;
    notifyListeners();
  }

  ///Create account method
  void createBlog(
      {String? title,
        String? subtitle,
        String? body,
        String? dateCreated,
        BuildContext? context}) async {
    _status = true;
    _response = "Please wait...";
    notifyListeners();

    ValueNotifier<GraphQLClient> client = _point.getClient("");

    QueryResult result = await client.value.mutate(MutationOptions(
        document: gql(CreateBlogPostSchema.creatblogpostJson),
        variables: {
          'title': title,
          'subtitle': subtitle,
          'body': body,
          'dateCreated': dateCreated,
        }));

    if (result.hasException) {
      // print(result.exception);
      _status = false;
      if (result.exception!.graphqlErrors.isEmpty) {
        _response = "Internet is not found";
      } else {
        _response = result.exception!.graphqlErrors[0].message.toString();
      }
      notifyListeners();
      error(context!, message: _response);
    } else {
      // print(result.data);
      final token = result.data!['createBlog']['token'];

      // print('my token ..... $token');

      ///saving users token
      // DatabaseProvider().saveToken(token: token);
      _status = false;
      _response = "Blog was successfully Created";
      notifyListeners();

      success(context!, message: _response);

      nextPageAndRemovePrevious(context, page: const MainActivityPage());
    }
  }

  void clear() {
    _response = '';
    notifyListeners();
  }
}

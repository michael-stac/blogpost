// // ignore_for_file: use_build_context_synchronously
//
// import 'package:flutter/material.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
// import 'package:provider/provider.dart';
//
// import '../../../constant/url_endpoint.dart';
// import '../schema/update_blog_schema.dart';
//
//
// class UpdateUserProvider extends ChangeNotifier {
//   bool _status = false;
//
//   String _response = '';
//
//   bool get getStatus => _status;
//
//   String get getResponse => _response;
//
//   final EndPoint _point = EndPoint();
//
//   ///update user method#
//
//   void UpdateBlogPost(
//       {String? name,
//         String? email,
//         String? phoneNumber,
//         String? acctNo,
//         String? acctName,
//         String? bankName,
//         BuildContext? context}) async {
//     _status = true;
//     notifyListeners();
//
//     final token = await DatabaseProvider().getToken();
//
//     ValueNotifier<GraphQLClient> client = _point.getClient(token);
//
//     QueryResult result = await client.value.mutate(
//         MutationOptions(document: gql(UpdateBlogPostSchema.updateblogpostJson), variables: {
//           'name': name,
//           'email': email,
//           'phoneNumber': phoneNumber,
//           'acctNo': acctNo,
//           'acctName': acctName,
//           'bankName': bankName,
//         }));
//     // print(result.)
//
//     if (result.hasException) {
//       // print(result.exception);
//       _status = false;
//       if (result.exception!.graphqlErrors.isEmpty) {
//         _response = "Internet is not found";
//       } else {
//         _response = result.exception!.graphqlErrors[0].message.toString();
//       }
//       notifyListeners();
//     } else {
//       // print(result.data);
//
//
//       _status = false;
//       _response = "Account was successfully Updated`";
//       notifyListeners();
//
//     }
//   }
//
//   void clear() {
//     _response = '';
//     notifyListeners();
//   }
// }

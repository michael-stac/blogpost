import 'package:blogapp/constant/url.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';


class EndPoint {
  ValueNotifier<GraphQLClient> getClient() {
    ValueNotifier<GraphQLClient> client = ValueNotifier(GraphQLClient(
      link: HttpLink("$endpointUrl/graphql/" ),
      cache: GraphQLCache(store: HiveStore()),
    ));
    // print(token);

    return client;
  }
}

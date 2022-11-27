import 'package:networking/networking.dart';

import '{{name.lowerCase().snakeCase()}}_networking_client.dart';

class CloudRunRelayProxyNetworkingClient extends RelayProxyNetworkingClient {
  CloudRunRelayProxyNetworkingClient({
    required {{name.pascalCase()}}NetworkingClient client,
  }) : super(
          uri: Uri.parse('https://cloud-run-replay-proxy'),
          client: client,
          interceptors: [],
        );
}

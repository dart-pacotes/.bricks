import 'package:networking/networking.dart';

import 'my_application_name_networking_client.dart';

class CloudRunRelayProxyNetworkingClient extends RelayProxyNetworkingClient {
  CloudRunRelayProxyNetworkingClient({
    required MyApplicationNameNetworkingClient client,
  }) : super(
          uri: Uri.parse('https://cloud-run-replay-proxy'),
          client: client,
          interceptors: [],
        );
}

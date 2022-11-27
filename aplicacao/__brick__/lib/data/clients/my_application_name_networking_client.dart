import 'package:networking/networking.dart';
import 'package:http/http.dart';

class MyApplicationNameNetworkingClient extends NetworkingClient {
  MyApplicationNameNetworkingClient()
      : super(
          baseUrl: Uri(
            scheme: 'https',
            host: 'my_application_name-mkruqxiwda-ew.a.run.app',
          ),
          httpClient: Client(),
        );
}

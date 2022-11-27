import 'package:networking/networking.dart';
import 'package:http/http.dart';

class {{name.pascalCase()}}NetworkingClient extends NetworkingClient {
  {{name.pascalCase()}}NetworkingClient()
      : super(
          baseUrl: Uri(
            scheme: 'https',
            host: '{{name.lowerCase().snakeCase()}}-mkruqxiwda-ew.a.run.app',
          ),
          httpClient: Client(),
        );
}

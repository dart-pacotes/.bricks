// ignore_for_file: depend_on_referenced_packages

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_application_name/data/data.dart';
import 'package:path_provider_platform_interface/path_provider_platform_interface.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:video_compress/video_compress.dart';

class Vault<T> {
  final _vault = <Type, T>{};

  void store<S extends T>(final S value) => _vault[S] = value;

  T? lookup<S extends T>() => _vault[S];
}

Future<Vault<Object>> createVault({
  required final bool isReleaseMode,
}) async {
  final vault = Vault<Object>();

  vault.store<DeviceRepository>(
    LiveDeviceRepository(
      filePicker: FilePicker.platform,
      imagePicker: ImagePicker(),
      videoCompressor: VideoCompress,
      pathProvider: PathProviderPlatform.instance,
      launchBrowserWithUrlCallback: ({required url}) => launchUrlString(url),
    ),
  );

  vault.store<FileStorage>(
    PathProviderFileStorage(
      httpClient: Client(),
      pathProvider: PathProviderPlatform.instance,
    ),
  );

  vault.store<PreferencesStorage>(
    SharedPreferencesStorage(
      sharedPreferences: await SharedPreferences.getInstance(),
    ),
  );

  if (isReleaseMode) {
    // todo: register production repositories
  } else {
    vault.store<AuthenticationRepository>(
      FakeAuthenticationRepository(),
    );
  }

  return vault;
}

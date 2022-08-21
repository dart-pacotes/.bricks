// any function that interacts with browser or other go here

import 'package:puppeteer/puppeteer.dart';

Future<void> runFunctionInBrowser({
  required final Page page,
}) {
  return page.evaluate(
    '() => {console.log(42);}',
  );
}

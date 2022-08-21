import 'package:puppeteer/puppeteer.dart';
import 'package:{{name.lowerCase().snakeCase()}}/{{name.lowerCase().snakeCase()}}.dart';

void main(final List<String> args) async {
  final parser = programArgParser();

  final arguments = Arguments.fromArgs(args, parser);

  if (arguments == null) {
    print(
      'Welcome to {{name.lowerCase().paramCase()}}! Below are the mandatory arguments you need to specify.',
    );
    print(parser.usage);
  } else {
    // Download the Chromium binaries, launch it and connect to the "DevTools"
    final browser = await puppeteer.launch(
      headless: arguments.headless,
    );

    // Open a new tab
    print('Starting browser engine...');
    final myPage = await browser.newPage();

    // Go to a page and wait to be fully loaded
    print('Loading $siteUrl in a new tab...');
    await myPage.goto(siteUrl, wait: Until.networkIdle);

    final sampleElement = await myPage.$(
      sampleSelectorExpression,
    );

    // Click element
    print('Clicking element...');
    await sampleElement.click();

    print('All done. Closing browser engine and exiting.');
    // Gracefully close the browser's process
    await browser.close();
  }
}

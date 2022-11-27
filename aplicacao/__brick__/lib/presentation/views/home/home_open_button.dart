part of 'home_view.dart';

const _kAplicacaoBrickTemplateWebpageUrl =
    'https://github.com/dart-pacotes/.bricks/tree/master/aplicacao';

class HomeOpenButton extends StatelessWidget {
  const HomeOpenButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final deviceBloc = context.read<DeviceBloc>();

    final strings = context.strings;

    return ElevatedButton(
      onPressed: () {
        deviceBloc.add(
          const OpenWebpageEvent(
            url: _kAplicacaoBrickTemplateWebpageUrl,
          ),
        );
      },
      child: Text(strings.open),
    );
  }
}

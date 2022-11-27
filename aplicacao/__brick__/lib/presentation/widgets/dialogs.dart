import 'package:{{name.lowerCase().snakeCase()}}/presentation/widgets/widgets.dart';

void show{{name.pascalCase()}}OneActionDialog(
  BuildContext context,
  String title,
  String content,
  String actionLabel,
) {
  showDialog(
    context: context,
    builder: (_) {
      return {{name.pascalCase()}}OneActionAlertDialog(
        title: title,
        content: content,
        actionLabel: actionLabel,
      );
    },
  );
}

void show{{name.pascalCase()}}TwoActionDialog(
  BuildContext context,
  String title,
  String content,
  String primaryActionLabel,
  VoidCallback primaryAction,
  String secondaryActionLabel,
) {
  showDialog(
    context: context,
    builder: (_) {
      return {{name.pascalCase()}}TwoActionAlertDialog(
        title: title,
        content: content,
        primaryActionLabel: primaryActionLabel,
        secondaryActionLabel: secondaryActionLabel,
        primaryAction: primaryAction,
      );
    },
  );
}

class BackgroundlessCircularProgressIndicatorDialog extends StatelessWidget {
  const BackgroundlessCircularProgressIndicatorDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator.adaptive(),
    );
  }
}

class {{name.pascalCase()}}OneActionAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String actionLabel;

  const {{name.pascalCase()}}OneActionAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.actionLabel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(actionLabel),
        ),
      ],
    );
  }
}

class {{name.pascalCase()}}TwoActionAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String primaryActionLabel;
  final String secondaryActionLabel;
  final VoidCallback primaryAction;

  const {{name.pascalCase()}}TwoActionAlertDialog({
    Key? key,
    required this.title,
    required this.content,
    required this.primaryActionLabel,
    required this.secondaryActionLabel,
    required this.primaryAction,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(secondaryActionLabel),
        ),
        TextButton(
          onPressed: primaryAction,
          child: Text(primaryActionLabel),
        ),
      ],
    );
  }
}

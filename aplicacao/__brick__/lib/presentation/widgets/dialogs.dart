import 'package:my_application_name/presentation/widgets/widgets.dart';

void showMyApplicationNameOneActionDialog(
  BuildContext context,
  String title,
  String content,
  String actionLabel,
) {
  showDialog(
    context: context,
    builder: (_) {
      return MyApplicationNameOneActionAlertDialog(
        title: title,
        content: content,
        actionLabel: actionLabel,
      );
    },
  );
}

void showMyApplicationNameTwoActionDialog(
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
      return MyApplicationNameTwoActionAlertDialog(
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

class MyApplicationNameOneActionAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String actionLabel;

  const MyApplicationNameOneActionAlertDialog({
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

class MyApplicationNameTwoActionAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final String primaryActionLabel;
  final String secondaryActionLabel;
  final VoidCallback primaryAction;

  const MyApplicationNameTwoActionAlertDialog({
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

import 'package:flutter/material.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';

final class CustomAlertDialog extends StatelessWidget {
  final String _title;
  final String _content;
  final String _okTitle;
  final Color _okTextColor;
  final Function() _okAction;

  const CustomAlertDialog({
    super.key,
    required String title,
    required String content,
    required String okTitle,
    required Color okTextColor,
    required Function() okAction,
  })  : _title = title,
        _content = content,
        _okTitle = okTitle,
        _okTextColor = okTextColor,
        _okAction = okAction;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        _title,
        style: TextStyles.dialogTitleTextStyle,
        textAlign: TextAlign.center,
      ),
      content: Text(
        _content,
        style: TextStyles.dialogContentsTextStyle,
        textAlign: TextAlign.center,
      ),
      actions: [
        Row(
          children: [
            Expanded(
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('취소', style: TextStyles.dialogContentsTextStyle),
              ),
            ),
            Expanded(
              child: TextButton(
                onPressed: () {
                  _okAction();
                  Navigator.pop(context);
                },
                child: Text(_okTitle, style: TextStyles.dialogContentsTextStyle.copyWith(color: _okTextColor)),
              ),
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_checkbox.dart';

final class ToDoItem extends StatelessWidget {
  final TextEditingController _controller;
  final FocusNode _focusNode = FocusNode();
  final String _hint = '일정을 입력해 주세요.';
  final Widget _checkBoxIcon;
  final Function()? _onChecked;
  final Function()? _onDeleted;
  final Function()? _onSaved;

  ToDoItem({
    super.key,
    required TextEditingController controller,
    required Widget checkBoxIcon,
    Function()? onChecked,
    Function()? onDeleted,
    Function()? onSaved,
  })  : _controller = controller,
        _checkBoxIcon = checkBoxIcon,
        _onChecked = onChecked,
        _onDeleted = onDeleted,
        _onSaved = onSaved {
    _focusNode.addListener(() {
      if (!_focusNode.hasFocus && _controller.text.isNotEmpty) _onSaved?.call();
      if (!_focusNode.hasFocus && _controller.text.isEmpty) _onDeleted?.call();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = Sizes.toDoItemSize;
    return Container(
      height: size.height,
      width: double.infinity,
      padding: Sizes.defaultHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SigppangECheckbox(onTap: () => _onChecked?.call(), child: _checkBoxIcon),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          Expanded(
            child: TextFormField(
              maxLines: 1,
              maxLength: 20,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              autofocus: _controller.text.isEmpty,
              controller: _controller,
              style: TextStyles.toDoItemTextStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration.collapsed(hintText: _hint),
              focusNode: _focusNode,
              onTapOutside: (_) => _focusNode.unfocus(),
              onEditingComplete: () => _focusNode.unfocus(),
            ),
          ),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          IconButton(
            onPressed: _onDeleted,
            icon: const Icon(Icons.delete),
            padding: EdgeInsets.zero,
            iconSize: size.height * 0.7,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}

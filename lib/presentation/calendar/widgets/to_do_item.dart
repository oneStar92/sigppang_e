import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sigppang_e/common/constants/sizes.dart';
import 'package:sigppang_e/common/constants/text_styles.dart';
import 'package:sigppang_e/presentation/calendar/action/to_do_action.dart';
import 'package:sigppang_e/presentation/calendar/widgets/sigppang_e_checkbox.dart';
import 'package:sigppang_e/presentation/calendar/widgets/to_do_item_view_model.dart';

final class ToDoItem extends StatelessWidget {
  final String _hint = '일정을 입력해 주세요.';
  final FocusNode _focusNode;
  final ToDoItemViewModel _viewModel;
  final TextEditingController _controller;

  ToDoItem({
    super.key,
    required ToDoItemViewModel viewModel,
    required FocusNode focusNode,
  })  : _viewModel = viewModel,
        _controller = TextEditingController(text: viewModel.title),
        _focusNode = focusNode;

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
          Expanded(
            child: TextFormField(
              maxLines: 1,
              maxLength: 20,
              maxLengthEnforcement: MaxLengthEnforcement.enforced,
              cursorColor: Colors.black,
              autofocus: _controller.text.isEmpty,
              controller: _controller,
              style: TextStyles.toDoItemTextStyle,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                hintText: _hint,
                border: InputBorder.none,
                prefixIcon: StreamBuilder(
                  stream: _viewModel.isDone,
                  builder: (context, snapshot) {
                    return SigppangECheckbox(
                      onTap: () => _viewModel.act(ToDoItemAction.changeStatus()),
                      isChecked: snapshot.data ?? false,
                    );
                  },
                ),
                prefix: SizedBox(width: Sizes.defaultPaddingOfWidth),
              ),
              focusNode: _focusNode,
              onTapOutside: (_) => _viewModel.act(ToDoItemAction.save()),
              onEditingComplete: () => _viewModel.act(ToDoItemAction.save()),
              onChanged: (title) => _viewModel.act(ToDoItemAction.changeTitle(title)),
            ),
          ),
          SizedBox(width: Sizes.defaultPaddingOfWidth),
          IconButton(
            onPressed: () => _viewModel.act(ToDoItemAction.delete()),
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

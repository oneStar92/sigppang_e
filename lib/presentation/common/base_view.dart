import 'package:flutter/material.dart';
import 'package:sigppang_e/presentation/common/view_model.dart';

abstract class BaseView<T extends ViewModel> extends StatefulWidget {
  final T _viewModel;

  const BaseView({
    super.key,
    required T viewModel,
  }) : _viewModel = viewModel;

  @override
  BaseViewState<T, BaseView<T>> createState();
}

abstract class BaseViewState<T extends ViewModel, U extends BaseView<T>> extends State<U> {
  late final T viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = widget._viewModel;
    viewModel.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: viewModel.isLoadingStream,
      builder: (context, snapshot) {
        return Stack(
          children: [
            Positioned.fill(child: createContent(context)),
            Offstage(
              offstage: snapshot.data ?? false,
              child: const Positioned.fill(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Opacity(
                        opacity: 0.5,
                        child: ModalBarrier(
                          dismissible: false,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Center(child: CircularProgressIndicator())
                  ],
                ),
              ),
            )
          ],
        );
      },
    );
  }

  Widget createContent(BuildContext context);
}

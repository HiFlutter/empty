//Copyright (c) [2022] [HiFlutter]
// [flutter_empty] is licensed under Mulan PSL v2.
// You can use this software according to the terms and conditions of the Mulan PSL v2.
// You may obtain a copy of Mulan PSL v2 at:
//          http://license.coscl.org.cn/MulanPSL2
// THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
// EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
// MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
// See the Mulan PSL v2 for more details.

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class EmptyView extends StatelessWidget {
  final bool? loading;
  final bool? empty;
  final bool? error;
  final Widget widget;

  final ButtonStyle? buttonStyle;

  final Color? color;

  final Widget? emptyImage;
  final Widget? emptyTitle;
  final Widget? emptyContent;
  final ButtonStyle? emptyButtonStyle;
  final Widget? emptyButtonChild;
  final VoidCallback? emptyPressed;

  final Widget? errorImage;
  final Widget? errorTitle;
  final Widget? errorContent;
  final ButtonStyle? errorButtonStyle;
  final Widget? errorButtonChild;
  final VoidCallback? errorPressed;

  final Widget? loadingWidget;
  final Widget? loadingTitle;

  final double? imageSize;
  final double? loadingSize;

  const EmptyView({
    Key? key,
    required this.widget,
    this.loading = false,
    this.empty = false,
    this.error = false,
    this.emptyImage,
    this.errorImage,
    this.loadingWidget,
    this.emptyTitle,
    this.buttonStyle,
    this.emptyButtonStyle,
    this.emptyButtonChild,
    this.emptyPressed,
    this.emptyContent,
    this.errorTitle,
    this.errorContent,
    this.errorButtonStyle,
    this.errorButtonChild,
    this.errorPressed,
    this.loadingTitle,
    this.color,
    this.imageSize = 200.0,
    this.loadingSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return (loading ?? false)
        ? buildLoading(context)
        : ((error ?? false)
        ? buildError(context)
        : ((empty ?? false) ? buildEmpty(context) : widget));
  }

  Widget buildError(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          children: addErrorChildren(context),
        ),
      ),
    );
  }

  Widget buildEmpty(BuildContext context) {
    return Container(
        color: color,
        child: Center(child: Column(children: addEmptyChildren(context))));
  }

  Widget buildLoading(BuildContext context) {
    return Container(
      color: color,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: addLoadingChildren(context),
        ),
      ),
    );
  }

  ///添加空子组件列表
  List<Widget> addEmptyChildren(BuildContext context) {
    final list = <Widget>[];

    list.add(emptyImage ??
        Image.asset(
          'assets/images/ic_result_empty.webp',
          package: 'flutter_empty',
          width: imageSize,
          height: imageSize,
        ));
    list.add(const Gap(4));
    if (emptyTitle != null) {
      list.add(emptyTitle!);
      list.add(const Gap(4));
    }
    if (emptyContent != null) {
      list.add(emptyContent!);
      list.add(const Gap(4));
    }
    list.add(ElevatedButton(
      onPressed: emptyPressed,
      child: emptyButtonChild ??
          const Text(
            '再试一次',
          ),
      style: emptyButtonStyle ?? (buttonStyle ?? (ElevatedButton.styleFrom())),
    ));

    return list;
  }

  ///添加错误子组件列表
  List<Widget> addErrorChildren(BuildContext context) {
    final list = <Widget>[];

    list.add(errorImage ??
        Image.asset(
          'assets/images/ic_result_network.webp',
          package: 'flutter_empty',
          width: imageSize,
          height: imageSize,
        ));
    list.add(const Gap(4));
    if (errorTitle != null) {
      list.add(errorTitle!);
      list.add(const Gap(4));
    }
    if (errorContent != null) {
      list.add(errorContent!);
      list.add(const Gap(4));
    }
    list.add(ElevatedButton(
      onPressed: errorPressed,
      child: errorButtonChild ??
          const Text(
            '再试一次',
          ),
      style: errorButtonStyle ?? (buttonStyle ?? (ElevatedButton.styleFrom())),
    ));

    return list;
  }

  ///添加加载子组件列表
  List<Widget> addLoadingChildren(BuildContext context) {
    final list = <Widget>[];

    list.add(loadingWidget ??
        SizedBox(
          child: const CircularProgressIndicator(),
          height: loadingSize,
          width: loadingSize,
        ));
    if (loadingTitle != null) {
      list.add(const Gap(4));
      list.add(loadingTitle!);
    }
    return list;
  }
}

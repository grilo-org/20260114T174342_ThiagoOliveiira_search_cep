import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:search_cep/ds/ds.dart';

import '../../features/features.dart';

class DsAppBarComponent extends StatelessWidget implements PreferredSizeWidget {
  const DsAppBarComponent({super.key, this.showIconButton = true, this.showBackButton = false});

  final bool? showIconButton;
  final bool? showBackButton;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spacing.spacingXS.width),
        child: SizedBox(
          height: kToolbarHeight,
          child: Stack(
            alignment: Alignment.center,
            children: [
              showBackButton == true ? Positioned(left: 0, child: IconButton(onPressed: context.pop, icon: Icon(Icons.arrow_back, color: context.colors.aqua.dark))) : SizedBox.shrink(),
              Image.asset('assets/images/logo.png', height: kToolbarHeight - context.spacing.spacingLG.height),
              showIconButton == true
                  ? Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      spacing: context.spacing.spacingLG.width,
                      mainAxisSize: MainAxisSize.min,
                      children: [IconButton(onPressed: () => context.read<ThemeCubit>().onToggleTheme(), icon: Icon(Icons.light_mode, color: context.colors.aqua.dark))],
                    ),
                  )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(double.maxFinite);
}

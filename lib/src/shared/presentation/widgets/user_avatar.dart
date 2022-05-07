import 'dart:io';

import 'package:blog_app_2/src/shared/presentation/design_system/assets/capyba_social_icons.dart';
import 'package:blog_app_2/src/shared/presentation/design_system/tokens/color_tokens.dart';
import 'package:flutter/material.dart';

class UserAvatar extends StatefulWidget {
  final String? localUserAvatarImage;
  final String? urlUserAvatarImage;
  final Color borderColor;
  final double radius;

  const UserAvatar({
    Key? key,
    this.localUserAvatarImage,
    this.urlUserAvatarImage,
    this.borderColor = ColorTokens.neutralMediumDark,
    this.radius = 74,
  }) : super(key: key);

  @override
  State<UserAvatar> createState() => _UserAvatarState();
}

class _UserAvatarState extends State<UserAvatar> {
  late String? localImage;
  late String? urlImage;

  bool _imageExists = false;

  @override
  void initState() {
    localImage = widget.localUserAvatarImage;
    urlImage = widget.urlUserAvatarImage;

    _checkIfLocalImageExists();

    super.initState();
  }

  @override
  void didUpdateWidget(covariant UserAvatar oldWidget) {
    if (oldWidget.localUserAvatarImage != widget.localUserAvatarImage) {
      localImage = widget.localUserAvatarImage;
      _checkIfLocalImageExists();
    }

    if (oldWidget.urlUserAvatarImage != widget.urlUserAvatarImage) {
      urlImage = widget.urlUserAvatarImage;
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: widget.radius,
      backgroundColor: widget.borderColor,
      child: CircleAvatar(
        radius: widget.radius - 3.0,
        foregroundColor: ColorTokens.neutralLightest,
        foregroundImage: _showImage(),
        backgroundColor: ColorTokens.neutralLightest,
        backgroundImage: _fallBackImage(),
        onForegroundImageError: (_, __) {},
        onBackgroundImageError: (_, __) {},
      ),
    );
  }

  ImageProvider<Object>? _showImage() {
    if (urlImage != null) {
      return NetworkImage(urlImage!);
    } else if (localImage != null && _imageExists) {
      return FileImage(
        File(localImage!),
      );
    }

    return _fallBackImage();
  }

  void _checkIfLocalImageExists() async {
    bool exists = _imageExists;
    if (localImage != null) {
      exists = await File(localImage!).exists();
    }

    setState(
      () {
        _imageExists = exists;
      },
    );
  }

  AssetImage _fallBackImage() {
    return const AssetImage(
      CapybaSocialIcons.defaultAvatar,
    );
  }
}

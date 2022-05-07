import 'package:blog_app_2/src/shared/presentation/design_system/assets/capyba_social_icons.dart';
import 'package:flutter/material.dart';

class HeroAppName extends StatefulWidget {
  const HeroAppName({Key? key}) : super(key: key);

  @override
  _HeroAppNameState createState() => _HeroAppNameState();
}

class _HeroAppNameState extends State<HeroAppName> {
  final heroTag = 'AppNameHeroTag';

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Hero(
      tag: heroTag,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Image.asset(
            CapybaSocialIcons.logoAndName,
          ),
          Text(
            'Social',
            style: textTheme.bodyText1?.copyWith(fontSize: 18),
          ),
        ],
      ),
    );
  }
}

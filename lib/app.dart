import 'package:blog_app_2/src/auth/presentation/smarties/onboarding_smart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BlogApp extends StatelessWidget {
  const BlogApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ProviderScope(
      child: MaterialApp(
        title: 'Blog App',
        home: OnboardingSmarView(),
        
      ),
    );
  }
}

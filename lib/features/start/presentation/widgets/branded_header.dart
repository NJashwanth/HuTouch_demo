import 'package:flutter/material.dart';
import 'package:demo_app/core/extensions/context_extensions.dart';
import 'package:demo_app/core/constants/app_strings.dart';
import 'package:demo_app/core/constants/assets.dart';
import 'package:demo_app/features/start/presentation/widgets/spotify_logo.dart';

class BrandedHeader extends StatelessWidget {
  const BrandedHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final h = context.screenHeight;
    final w = context.screenWidth;
    final logoSize = h * 0.068;
    final topAreaHeight = h * 0.50;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: topAreaHeight,
          width: w,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Placeholder(),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Color(0xAA000000),
                      Color(0xFF000000),
                    ],
                    stops: [0.0, 0.6, 1.0],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.heightUnit * 3.0),
        SpotifyLogo(diameter: logoSize),
        SizedBox(height: context.heightUnit * 2.2),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.widthUnit * 10),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${AppStrings.startTitleLine1}\n${AppStrings.startTitleLine2}',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: h * 0.030,
                fontWeight: FontWeight.w800,
                height: 1.35,
                letterSpacing: 0.1,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

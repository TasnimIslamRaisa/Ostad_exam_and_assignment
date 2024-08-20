import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:module_20/ui/utility/assets_path.dart';

class BackGroundWidgets extends StatelessWidget {
  const BackGroundWidgets({
    super.key,
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetPaths.backgroundSvg,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        SvgPicture.asset(AssetPaths.backgroundSvg),
        child
      ],
    );
  }
}

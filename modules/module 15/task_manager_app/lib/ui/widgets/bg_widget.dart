import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';

import '../../utility/assets_path.dart';

class BgWidget extends StatelessWidget {
  const BgWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          AssetsPath.bgSvgPath,
          height: double.maxFinite,
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
        child,
      ],
    );
  }
}

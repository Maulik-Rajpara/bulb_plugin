import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../bulb_plugin.dart';



class BulbWidget extends StatelessWidget {
  const BulbWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final bulbProvider = Provider.of<BulbProvider>(context);

    return SvgPicture.asset(
      AppAssets.bulbSvg,
      colorFilter: ColorFilter.mode(bulbProvider.currentColor, BlendMode.srcIn),
      height: 200,
      semanticsLabel: 'Bulb',
    );
  }
}

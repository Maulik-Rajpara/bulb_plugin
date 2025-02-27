library;

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../bulb_plugin.dart';


/// Callback for user interactions (tap, long press, double tap)
typedef BulbCallback = void Function(int partitionIndex);

class BulbView extends StatelessWidget {
  final List<Color> colors;
  final double bulbSize;
  final BulbCallback? onTap;
  final BulbCallback? onLongPress;
  final BulbCallback? onDoubleTap;
  final VoidCallback? onResetBulb; // Callback for reset
  final int layoutType;
  final Color resetColor; // Custom reset color

  const BulbView({
    super.key,
    required this.colors,
    this.bulbSize = 100.0,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.onResetBulb,
    this.layoutType = 0,
    this.resetColor = Colors.black, // Default reset color
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BulbProvider()
        ..setColors(colors)
        ..setResetConfig(resetColor: resetColor, onResetBulb: onResetBulb),
      child: _BulbViewContent(
        bulbSize: bulbSize,
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        onResetBulb: onResetBulb,
        layoutType: layoutType,
        resetColor: resetColor,
      ),
    );
  }
}

class _BulbViewContent extends StatelessWidget {
  final double bulbSize;
  final BulbCallback? onTap;
  final BulbCallback? onLongPress;
  final BulbCallback? onDoubleTap;
  final VoidCallback? onResetBulb;
  final int layoutType;
  final Color resetColor;

  const _BulbViewContent({
    required this.bulbSize,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.onResetBulb,
    required this.layoutType,
    required this.resetColor,
  });

  @override
  Widget build(BuildContext context) {
    final bulbProvider = Provider.of<BulbProvider>(context);

    return Column(
      children: [
        Expanded(
          child: Stack(
            children: [
              // Centered Bulb
              Center(
                child: SvgPicture.asset(
                  AppAssets.bulbSvg,
                  colorFilter: ColorFilter.mode(
                      bulbProvider.currentColor, BlendMode.srcIn),
                  height: bulbSize,
                  semanticsLabel: 'Bulb',
                ),
              ),

              // Dynamic Layout
              Positioned.fill(
                child: layoutType == 0
                    ? _buildGridLayout(context)
                    : _buildFlexibleLayout(context),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildGridLayout(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: [
              _buildPartition(context, 0),
              _buildPartition(context, 1),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              _buildPartition(context, 2),
              _buildPartition(context, 3),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFlexibleLayout(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(0),
      onLongPress: () => onLongPress?.call(0),
      onDoubleTap: () => onDoubleTap?.call(0),
      child: Container(color: Colors.transparent),
    );
  }

  Widget _buildPartition(BuildContext context, int index) {
    final bulbProvider = Provider.of<BulbProvider>(context, listen: false);
    return Expanded(
      child: GestureDetector(
        onTap: () => onTap?.call(index),
        onLongPress: () {
          bulbProvider.changeColor(index);
          onLongPress?.call(index);
        },
        onDoubleTap: () => onDoubleTap?.call(index),
        child: Container(color: Colors.transparent),
      ),
    );
  }
}

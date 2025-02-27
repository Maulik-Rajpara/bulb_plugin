import 'package:flutter/material.dart';

class BulbProvider extends ChangeNotifier {
  int _colorIndex = -1;
  List<Color> _colors = [Colors.yellow, Colors.blue, Colors.red, Colors.pink];
  Color _resetColor = Colors.black; // Default reset color
  VoidCallback? _onResetBulb; // Callback when reset is triggered

  int get colorIndex => _colorIndex;
  Color get currentColor => _colorIndex == -1 ? _resetColor : _colors[_colorIndex];

  /// Allow setting custom colors dynamically
  void setColors(List<Color> colors) {
    _colors = colors;
    notifyListeners();
  }

  /// Change bulb color based on partition index
  void changeColor(int index) {
    if (index < _colors.length) {
      _colorIndex = index;
      notifyListeners();
    }
  }

  /// Set reset color and callback
  void setResetConfig({Color? resetColor, VoidCallback? onResetBulb}) {
    _resetColor = resetColor ?? Colors.black;
    _onResetBulb = onResetBulb;
  }

  /// Reset bulb color to default (or custom reset color) and trigger callback
  void resetColor() {
    _colorIndex = -1;
    notifyListeners();
    _onResetBulb?.call();
  }
}

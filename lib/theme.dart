import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookTheme(name: 'LightTheme', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();
@WidgetbookTheme(name: 'DarkTheme')
ThemeData getDarkTheme() => ThemeData.dark();

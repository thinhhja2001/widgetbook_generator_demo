import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

import 'widgetbook_component/custom_button.widgetbook.dart';

class WidgetbookTest extends StatelessWidget {
  const WidgetbookTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook(
      devices: const [
        Apple.iPhone13,
        Samsung.s10,
        Apple.macBook16Inch,
      ], //Các thiết bị cần được test
      categories: [
        WidgetbookCategory(
          widgets: [
            customButtonWidgetbookComponent(),
          ],
          name: 'components',
        ),
        WidgetbookCategory(name: 'screens', folders: [
          WidgetbookFolder(name: 'login', folders: [
            WidgetbookFolder(
              name: 'components',
            )
          ], widgets: []),
          WidgetbookFolder(
            name: 'signup',
            folders: [
              WidgetbookFolder(name: 'components'),
            ],
          ),
        ])
      ],

      appInfo: AppInfo(name: 'Widgetbook Demo'),

      themes: [
        WidgetbookTheme(
          name: 'Light theme',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark theme',
          data: ThemeData.dark(),
        )
      ],
    );
  }
}

void main(List<String> args) {
  runApp(const WidgetbookTest());
}

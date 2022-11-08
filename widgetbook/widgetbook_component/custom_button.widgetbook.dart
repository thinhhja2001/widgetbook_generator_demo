import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/components/custom_button.dart';

WidgetbookUseCase customButtonLoading() {
  return WidgetbookUseCase(
    name: 'Loading',
    builder: (context) => CustomButton(
      isLoading: true,
      text: 'Login',
    ),
  );
}

WidgetbookUseCase customButtonIdle() {
  return WidgetbookUseCase(
    name: 'Idle',
    builder: (context) => CustomButton(
      text: 'Login',
    ),
  );
}

WidgetbookComponent customButtonWidgetbookComponent() {
  return WidgetbookComponent(name: 'CustomButton', useCases: [
    customButtonLoading(),
    customButtonIdle(),
  ]);
}

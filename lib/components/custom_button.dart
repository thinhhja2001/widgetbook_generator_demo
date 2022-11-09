import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookUseCase(name: 'Loading', type: CustomButton)
CustomButton customButtonIsLoading(BuildContext context) {
  return CustomButton(
    text: '',
    isLoading: true,
  );
}

@WidgetbookUseCase(name: 'Short text', type: CustomButton)
CustomButton customButtonShortText(BuildContext context) {
  return CustomButton(text: 'Short');
}

@WidgetbookUseCase(name: 'Long text', type: CustomButton)
CustomButton customButtonLongText(BuildContext context) {
  return CustomButton(
      text: 'This is a very very very very very very long text');
}

class CustomButton extends StatelessWidget {
  CustomButton({super.key, required this.text, this.isLoading = false});
  final String text;
  bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text.toUpperCase(),
              ),
      ),
    );
  }
}

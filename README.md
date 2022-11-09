# Develop Flutter UI using Widgetbook

## Problem

In the last article, I have introduced you how to apply Widgetbook into your application.

You can check my last article here: https://github.com/thinhhja2001/widgetbook_demo

The only problem of this approach is it took you too much time to create a use-case. You have to declare WidgetbookCategory, WidgetbookFolder, WidgetbookComponent,... all by yourself. This is very time consuming and of course hard to maintain when you are in a big project.

In this article, I will introduce you a more efficient approach to solve this problem using **widgetbook_generator**, **widgetbook_annotation**

The example I will be using in this demo will be the example of my last article.

You can clone it here https://github.com/thinhhja2001/widgetbook_demo

## Install

In pubspec.yaml, install **widgetbook_annotation**, **widgetbook_generator** and **build_runner**

With developer using VSCode, you can install Pubspec Assist for faster installation.

This is the **pubspec.yaml** file.

```yaml
name: widgetbook_demo
description: A new Flutter project.

version: 1.0.0+1

environment:
  sdk: ">=2.18.4 <3.0.0"

dependencies:
  build_runner: ^2.3.2
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  flutter_svg: ^1.1.6
  widgetbook: ^2.4.1
  widgetbook_annotation: ^2.1.0
  widgetbook_generator: ^2.4.1

dev_dependencies:
  flutter_lints: ^2.0.0
  flutter_test:
    sdk: flutter

flutter:
  uses-material-design: true

  assets:
    - assets/icons/
    - assets/images/
```

You are now all set. Let's get into the main article

## Code

**Delete unnecessary folder**

The previous demo will have the **widgetbook** folder which is at the same level with **lib** folder. You can now delete this folder since we are no longer needing this.

---

In the **main.dart** file, split MyApp into a new file call **app.dart**

**app.dart**

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_demo/constants.dart';
import 'package:widgetbook_demo/screens/login/login_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const LoginScreen(),
    );
  }
}

```

Now we will learn the main concept of **widgetbook_annotation**

The **widgetbook_annotation** will have 3 important annotations:

- @WidgetbookApp
- @WidgetbookUseCase
- @WidgetbookTheme

Let get started with the @WidgetbookApp annotation.
Go to the **app.dart** file and declare the @WidgetbookApp annotation
Declare the @WidgetbookApp annotation right on top of the **App** widget

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';
import 'package:widgetbook_demo/constants.dart';
import 'package:widgetbook_demo/screens/login/login_screen.dart';

@WidgetbookApp(
  name: 'Widgetbook Demo',
  themeType: ThemeData,
  devices: [
    Apple.iPhone13,
    Samsung.s21ultra,
    Apple.iMacM1,
  ],
)
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              elevation: 0,
              shape: const StadiumBorder(),
              maximumSize: const Size(double.infinity, 56),
              minimumSize: const Size(double.infinity, 56),
            ),
          ),
          inputDecorationTheme: const InputDecorationTheme(
            filled: true,
            fillColor: kPrimaryLightColor,
            iconColor: kPrimaryColor,
            prefixIconColor: kPrimaryColor,
            contentPadding: EdgeInsets.symmetric(
                horizontal: defaultPadding, vertical: defaultPadding),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide.none,
            ),
          )),
      home: const LoginScreen(),
    );
  }
}
```

We are now done declaring the @WidgetbookApp
In the last article, we have to declare the **widgetbook_main.dart** all by yourself. Now, with the help of the **build_runner** package, you can auto generate this file.

In the terminal, run the command

```cmd
flutter pub run build_runner build
```

This will auto generate the **app.widgetbook.dart** at the same level of the **main.dart**

```
.
└── lib/
    ├── ...some folder and file
    ├── app.widgetbook.dart
    └── main.dart
```

Now let take a look at the auto-generated **app.widgetbook.dart** file

```dart
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

void main() {
  runApp(HotReload());
}

class HotReload extends StatelessWidget {
  const HotReload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Widgetbook<ThemeData>(
      appInfo: AppInfo(
        name: 'Widgetbook Demo',
      ),
      themes: [],
      devices: [
        Device(
          name: 'iPhone 13',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2532.0,
              width: 1170.0,
            ),
            scaleFactor: 3.0,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'S21 Ultra',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 3200.0,
              width: 1440.0,
            ),
            scaleFactor: 3.75,
          ),
          type: DeviceType.mobile,
        ),
        Device(
          name: 'iMac M1',
          resolution: Resolution(
            nativeSize: DeviceSize(
              height: 2520.0,
              width: 4480.0,
            ),
            scaleFactor: 2.0,
          ),
          type: DeviceType.desktop,
        ),
      ],
      categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [],
          widgets: [],
        ),
      ],
    );
  }
}

```

This is simply just the same as what I did in the last article. But instead of spending over 30 minutes for creating this, now I can archive this with a simple command.

Now, if we run the **main()** function in the **app.widgetbook.dart**, we will have an error like:

![Error](https://i.ibb.co/zsB7SYT/image.png)

This error because we haven't declare your theme yet. This is when the @WidgetbookTheme annotation will promote the effect.

Let's create a **theme.dart** file to contain your ThemeData

```dart
import 'package:flutter/material.dart';

ThemeData getLightTheme() => ThemeData.light();
ThemeData getDarkTheme() => ThemeData.dark();
```

Since I'm using the default theme of Flutter, I will just return the default theme. You can custom your theme in here.

Now, declare the @WidgetbookTheme right on top of each function

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

@WidgetbookTheme(name: 'LightTheme', isDefault: true)
ThemeData getLightTheme() => ThemeData.light();
@WidgetbookTheme(name: 'DarkTheme')
ThemeData getDarkTheme() => ThemeData.dark();
```

Just like this. In this example, I will set light theme as the default theme of our app.

Now, let's update our **app.widgetbook.dart**
I will run the

```cmd
flutter pub run build_runner watch
```

Instead of

```cmd
flutter pub run build_runner build
```

Because the **_watch_** command will auto specify the update the generated file instead of rebuilt it which is very time consuming.

\*\*\*You should not close the `flutter pub run build_runner watch` terminal

Now let run the **main()** in the **app.widgetbook.dart** file
![Error](https://i.ibb.co/M6KqvKg/image.png)

As you can see, we are now successfully run our app. All that left to do is create the use-case for each component of our app

This is when we will use the @WidgetbookUseCase annotation

I will use the same component as previous example which is **CustomButton**

Go into **custom_button.dart** file and declare the use case

I will create 3 use-cases of the CustomButton which are _isLoading_, _shortText_, _longText_

```dart
CustomButton customButtonIsLoading(BuildContext context) {
  return CustomButton(
    text: '',
    isLoading: true,
  );
}

CustomButton customButtonShortText(BuildContext context) {
  return CustomButton(text: 'Short');
}

CustomButton customButtonLongText(BuildContext context) {
  return CustomButton(
      text: 'This is a very very very very very very long text');
}
```

Now, let put the @WidgetbookUseCase above each of them

```dart
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
```

The @WidgetbookUseCase annotation will have 2 parameters:

- name: name of the use case
- type: type of the use case

If you still have the
`flutter pub run build_runner watch` terminal opened, when you add another annotation, it will auto update the **app.widgetbook.dart** file.

If you have it closed, run this command again to update the **add.widgetbook.dart**

Let's see the _categories_ parameter in the **app.widgetbook.dart** file

```dart
categories: [
        WidgetbookCategory(
          name: 'use cases',
          folders: [
            WidgetbookFolder(
              name: 'components',
              widgets: [
                WidgetbookComponent(
                  name: 'CustomButton',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'Loading',
                      builder: (context) => customButtonIsLoading(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Short text',
                      builder: (context) => customButtonShortText(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Long text',
                      builder: (context) => customButtonLongText(context),
                    ),
                  ],
                ),
              ],
              folders: [],
            ),
          ],
          widgets: [],
        ),
```

It now auto generated our use case with the same folder structure as the **custom_button.dart** component

Let's run our app to see if our use cases are set.
![Error](https://i.ibb.co/5xLL95G/demo.gif)

<font size=5>__And here we areeeeee__</font>

Now, do the same as others components

<font size=7>__And now we have our final result__</font>

![Final result](https://i.ibb.co/crL10PD/image.png)

And that's all. See you next time!!!
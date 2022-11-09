// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// WidgetbookGenerator
// **************************************************************************

import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_demo/components/already_have_an_account_acheck.dart';
import 'package:widgetbook_demo/components/background.dart';
import 'package:widgetbook_demo/components/custom_button.dart';
import 'package:widgetbook_demo/constants.dart';
import 'package:widgetbook_demo/responsive.dart';
import 'package:widgetbook_demo/screens/login/components/login_form.dart';
import 'package:widgetbook_demo/screens/login/components/login_screen_top_image.dart';
import 'package:widgetbook_demo/screens/login/login_screen.dart';
import 'package:widgetbook_demo/screens/signup/components/or_divider.dart';
import 'package:widgetbook_demo/screens/signup/components/sign_up_top_image.dart';
import 'package:widgetbook_demo/screens/signup/components/signup_form.dart';
import 'package:widgetbook_demo/screens/signup/components/socal_sign_up.dart';
import 'package:widgetbook_demo/screens/signup/components/social_icon.dart';
import 'package:widgetbook_demo/screens/signup/signup_screen.dart';
import 'package:widgetbook_demo/theme.dart';

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
      themes: [
        WidgetbookTheme(
          name: 'LightTheme',
          data: getLightTheme(),
        ),
        WidgetbookTheme(
          name: 'DarkTheme',
          data: getDarkTheme(),
        ),
      ],
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
          folders: [
            WidgetbookFolder(
              name: 'screens',
              widgets: [],
              folders: [
                WidgetbookFolder(
                  name: 'login',
                  widgets: [
                    WidgetbookComponent(
                      name: 'LoginScreen',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'LoginScreen',
                          builder: (context) => loginScreen(context),
                        ),
                      ],
                    ),
                  ],
                  folders: [
                    WidgetbookFolder(
                      name: 'components',
                      widgets: [
                        WidgetbookComponent(
                          name: 'LoginForm',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'LoginForm',
                              builder: (context) => loginForm(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'LoginScreenTopImage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'LoginScreenTopImage',
                              builder: (context) =>
                                  loginScreenTopImage(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
                WidgetbookFolder(
                  name: 'signup',
                  widgets: [
                    WidgetbookComponent(
                      name: 'SignUpScreen',
                      useCases: [
                        WidgetbookUseCase(
                          name: 'SignUpScreen',
                          builder: (context) => signUpScreen(context),
                        ),
                      ],
                    ),
                  ],
                  folders: [
                    WidgetbookFolder(
                      name: 'components',
                      widgets: [
                        WidgetbookComponent(
                          name: 'SignUpForm',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'SignUpForm',
                              builder: (context) => signUpForm(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'SignUpScreenTopImage',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'SignUpScreenTopImage',
                              builder: (context) =>
                                  signUpScreenTopImage(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'OrDivider',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'OrDivider',
                              builder: (context) => orDivider(context),
                            ),
                          ],
                        ),
                        WidgetbookComponent(
                          name: 'SocalIcon',
                          useCases: [
                            WidgetbookUseCase(
                              name: 'SocalIconFacebook',
                              builder: (context) => socialIconFacebook(context),
                            ),
                            WidgetbookUseCase(
                              name: 'SocalIconGoogle',
                              builder: (context) => socialIconGoogle(context),
                            ),
                          ],
                        ),
                      ],
                      folders: [],
                    ),
                  ],
                ),
              ],
            ),
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
                WidgetbookComponent(
                  name: 'AlreadyHaveAnAccountCheck',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'SignUp',
                      builder: (context) => signUpCheck(context),
                    ),
                    WidgetbookUseCase(
                      name: 'Login',
                      builder: (context) => loginCheck(context),
                    ),
                  ],
                ),
                WidgetbookComponent(
                  name: 'Background',
                  useCases: [
                    WidgetbookUseCase(
                      name: 'LoginBackground',
                      builder: (context) => loginBackground(context),
                    ),
                    WidgetbookUseCase(
                      name: 'SignUpBackground',
                      builder: (context) => signUpBackground(context),
                    ),
                  ],
                ),
              ],
              folders: [],
            ),
          ],
          widgets: [],
        ),
      ],
    );
  }
}

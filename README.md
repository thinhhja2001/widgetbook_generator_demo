# Phát triển UI Flutter cùng với Widgetbook

## Đặt vấn đề

- Dựa vào Design, developer có thể hoàn thiện một component, hhay thậm chí cả một page. Nhưng liệu chúng ta có chắc chắn rằng đoạn code vừa rồi đã cover tất cả các trường hợp? Component đó có tái sử dụng được hay không?

- Khi phát triển một dự án, Developer cần phải tạo ra component stories, use-case của một component. Sau khi tạo ra một component, các component đó cần phải được review bởi non-developer như designer hoặc khách hàng.

Với web developer, chúng ta có một package dùng để giải quyết vấn đề trên đó là **Storybook**. Với Flutter cũng vậy và nó được gọi là **Widgetbook**

## Vậy sử dụng Widgetbook có lời gì?

- Tạo widget một cách độc lập và test chúng một cách trực quan
- Duy trì overview với tất cả các widget
- Cộng tác với non-developer, đơn giản hóa review-process

## Demo

Giả sử chúng ta có làm một dự án có 2 màn hình đơn giản như sau:

![Màn hình đăng nhập](https://i.ibb.co/Qb5KLHd/Screenshot-1667881032.png)
![Màn hình đăng ký](https://i.ibb.co/T4GpY3G/Screenshot-1667881068.png)

Chúng ta sẽ có folder structure như sau

```
.
└── lib/
|    ├── component/
|    │   ├── already_have_an_account_acheck.dart
|    │   └── background.dart
         └── custom_button.dart
|    ├── screen/
|    │   ├── login/
|    │   │   ├── component/
|    │   │   │   ├── login_form.dart
|    │   │   │   └── login_screen_top_image.dart
|    │   │   └── login_screen.dart
|    │   └── signup/
|    │       ├── component/
|    │       │   ├── or_divider.dart
|    │       │   ├── sign_up_top_image.dart
|    │       │   ├── sign_up_form.dart
|    │       │   ├── social_sign_up.dart
|    │       │   └── social_icon.dart
|    │       └── sign_up_screen.dart
|    ├── constant.dart
|    ├── main.dart
|    └── responsive.dart
└──widgetbook

```

Folder widgetbook sẽ được dùng để chạy song song với ứng dụng của chúng ta

Bây giờ, thêm widgetbook vào pubspec.yaml

```yaml
name: widgetbook_demo
description: A new Flutter project.

# The following line prevents the package from being accidentally published to
# pub.dev using `flutter pub publish`. This is preferred for private packages.
publish_to: "none" # Remove this line if you wish to publish to pub.dev

# The following defines the version and build number for your application.
# A version number is three numbers separated by dots, like 1.2.43
# followed by an optional build number separated by a +.
# Both the version and the builder number may be overridden in flutter
# build by specifying --build-name and --build-number, respectively.
# In Android, build-name is used as versionName while build-number used as versionCode.
# Read more about Android versioning at https://developer.android.com/studio/publish/versioning
# In iOS, build-name is used as CFBundleShortVersionString while build-number is used as CFBundleVersion.
# Read more about iOS versioning at
# https://developer.apple.com/library/archive/documentation/General/Reference/InfoPlistKeyReference/Articles/CoreFoundationKeys.html
# In Windows, build-name is used as the major, minor, and patch parts
# of the product and file versions while build-number is used as the build suffix.
version: 1.0.0+1

environment:
  sdk: ">=2.18.4 <3.0.0"

# Dependencies specify other packages that your package needs in order to work.
# To automatically upgrade your package dependencies to the latest versions
# consider running `flutter pub upgrade --major-versions`. Alternatively,
# dependencies can be manually updated by changing the version numbers below to
# the latest version available on pub.dev. To see which dependencies have newer
# versions available, run `flutter pub outdated`.
dependencies:
  cupertino_icons: ^1.0.2
  flutter:
    sdk: flutter
  flutter_svg: ^1.1.6
  widgetbook: ^2.4.1

dev_dependencies:
  flutter_lints: ^2.0.0
  flutter_test:
    sdk: flutter

# For information on the generic Dart part of this file, see the
# following page: https://dart.dev/tools/pub/pubspec
# The following section is specific to Flutter packages.
flutter:
  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true
  # To add assets to your application, add an assets section, like this:
  assets:
    - assets/icons/
    - assets/images/
  # An image asset can refer to one or more resolution-specific "variants", see
  # https://flutter.dev/assets-and-images/#resolution-aware
  # For details regarding adding assets from package dependencies, see
  # https://flutter.dev/assets-and-images/#from-packages
  # To add custom fonts to your application, add a fonts section here,
  # in this "flutter" section. Each entry in this list should have a
  # "family" key with the font family name, and a "fonts" key with a
  # list giving the asset and other descriptors for the font. For
  # example:
  # fonts:
  #   - family: Schyler
  #     fonts:
  #       - asset: fonts/Schyler-Regular.ttf
  #       - asset: fonts/Schyler-Italic.ttf
  #         style: italic
  #   - family: Trajan Pro
  #     fonts:
  #       - asset: fonts/TrajanPro.ttf
  #       - asset: fonts/TrajanPro_Bold.ttf
  #         weight: 700
  #
  # For details regarding fonts from package dependencies,
  # see https://flutter.dev/custom-fonts/#from-packages
```

Ở trong thư mục _widgetbook_, tạo file main.dart

```dart
import 'package:flutter/material.dart';
import 'package:widgetbook/widgetbook.dart';

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
        WidgetbookCategory(name: 'components'),
        WidgetbookCategory(name: 'screens')
      ],
      // categories sẽ được cấu trúc như folder lib nên chúng ta sẽ đi chi tiết về nó sau
      appInfo: AppInfo(name: 'Widgetbook Demo'), //Thông tin ứng dụng cần test

      themes: [
        WidgetbookTheme(
          name: 'Light theme',
          data: ThemeData.light(),
        ),
        WidgetbookTheme(
          name: 'Dark theme',
          data: ThemeData.dark(),
        )
      ], //Theme được sử dụng trong ứng dụng. Ở đây chúng ta sẽ sài theme mặc định của Flutter
    );
  }
}

void main(List<String> args) {
  runApp(const WidgetbookTest());
}
```

Widgetbook có thể có nhiều parameter truyền vào. Nhưng với demo này, chúng ta sẽ chỉ xét những parameter mà mình cho là cần thiết để chạy

Chạy thử ứng dụng, chúng ta sẽ được như sau:
![Màn hình demo](https://i.ibb.co/VVDxXLs/image.png)

Bây giờ, chúng ta sẽ tiến hành tạo categories như cấu trúc của folder _lib_

WidgetbookCategory sẽ có những tham số như sau:

- name: Tên của category
- folder: subfolder của category đó
- widgets: những widget con chứa trong category
- isExpanded: expanded

Bây giờ, chúng ta sẽ tạo những subfolder trong mỗi category. Do category _components_ không chứa subfolder nên chúng ta sẽ tọa subfolder trong _screens_

Như vậy là chúng ta đã tạo được cấu trúc folder đúng như _lib_

![Folder structure](https://i.ibb.co/2hNqHBc/image.png)

Bây giờ sẽ đến với phần quan trọng là widgets.

Mỗi widgets trong WidgetbookCategory hay WidgetbookFolder sẽ là một WidgetbookComponent chứa các tham số:

- name: Tên của component đó
- useCases: Các useCase của component đó.

Để phần demo được ngắn gọn thì mình sẽ làm mẫu một component có 2 useCase là CustomButton. Nó sẽ bao gồm useCase:

- idle: khi chưa thực hiện sự kiện onPressed
- loading: sau khi thực hiện sự kiện onPressed và đang chờ đợi kết quả được gửi từ database (login, signup)

Bây giờ hãy cùng tạo useCase cho CustomButton

Ở folder widgetbook, hãy tạo 1 folder widgetbook_component, sau đó tạo 1 file có tên custom_button_widgetbook.dart

File này sẽ chứa các useCases của CustomButton

```dart
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
```

Sau đó, chúng ta khai báo customWidgetbookComponent vào trong WidgetbookCategory tương ứng. Ở đây là WidgetbookCategory **component**

```dart
WidgetbookCategory(
          widgets: [
            customButtonWidgetbookComponent(),
          ],
          name: 'components',
        ),
```

Bây giờ chạy ứng dụng với câu lệnh

`flutter run -d chrome widgetbook/main.dart`

\*\*\*Lưu ý Widgetbook hỗ trợ tốt nhất khi chạy trên web
 
Ta được demo như sau:
![Folder structure](https://im5.ezgif.com/tmp/ezgif-5-65a133d445.gif)

Như vậy là mình đã xong phần demo của Widgetbook. Tuy nhiên, còn 1 vấn đề nữa đó chính là để tạo 1 WidgetbookComponent, chúng ta phải thông qua quá nhiều công đoạn, tạo ra quá nhiều đoạn code. Điều này sẽ khó khăn với công đoạn bảo trì. 
Có một giải pháp để giải quyết vấn đề này đó là sử dụng __widgetbook_generator__. Sẽ được giới thiệu ở những bài viết sau.



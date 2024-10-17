import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:porto_vacation_club/domain/api_models/dummy_model.dart';
import 'package:porto_vacation_club/shared/constants/app_textstyle.dart';
import '../../shared/console.dart';
import '../../shared/extensions/build_context.dart';
import '../../domain/api_services/api_services.dart';
import '../../shared/navigation/screen_params.dart';
import '../../providers/dummy_provider.dart';
import '../../providers/localization_provider.dart';
import '../../providers/theme_provider.dart';
import '../../shared/localization/language_constrants.dart';
import '../base_widgets/base_widget.dart';

class DummyScreen extends ConsumerStatefulWidget {
  static const String routeName = "home_screen";
  final DummyScreenArgs? params;
  const DummyScreen({super.key, this.params});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DummyScreenState();
}

class _DummyScreenState extends ConsumerState<DummyScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(dummyProvider.notifier).getUsers();
      Future.delayed(const Duration(seconds: 2), () {
        ref.read(dummyProvider.notifier).getAir();
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final dummyPro = ref.read(dummyProvider.notifier);
    final localizationPro = ref.read(localizationProvider.notifier);
    final themePro = ref.read(themeProvider.notifier);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: Text(
            getTranslated('lang', context),
            style: TextStyle(color: context.theme.textTheme.labelSmall!.color!),
          ),
          actions: [
            IconButton(
                onPressed: () => themePro.toggle(),
                icon: Icon(
                  Icons.dark_mode,
                  color: context.theme.iconTheme.color,
                )),
            IconButton(
                onPressed: () => localizationPro
                    .setLanguage(localizationPro.languageIndex == 0 ? 1 : 0),
                icon:
                    Icon(Icons.language, color: context.theme.iconTheme.color)),
            IconButton(
                onPressed: () async {
                  String d = (await getDownloadsDirectory())?.path ?? '';
                  console(d);
                  console('ddddddddddddddddddddddddddddddddddddddddddd');

                  // http://www.africau.edu/images/default/sample.pdf
                  // Media media =
                  await ApiServices(
                          baseUrl:
                              "https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf")
                      .download(
                    'https://www.w3.org/WAI/ER/tests/xhtml/testfiles/resources/pdf/dummy.pdf',
                    "${d}sample.pdf",
                  );
                  // console(media.path);
                },
                icon:
                    Icon(Icons.download, color: context.theme.iconTheme.color)),
          ]),
      body: Column(
        children: [
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              var userRes =
                  ref.watch(dummyProvider.select((value) => value.userRes));
              return BaseWidget(
                state: userRes!,
                onRefresh: () => dummyPro.getUsers(),
                builder: (context) {
                  DummyModel dummyData = userRes.data as DummyModel;
                  return ListView.builder(
                      itemCount: dummyData.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        Data data = dummyData.data![index];
                        return ListTile(
                          // leading: CircleAvatar(
                          //     backgroundImage:
                          //         NetworkImage(data.thumbnailUrl ?? '')),
                          title: Text("${data.employeeName}",
                              style: AppTextstyle.headingTextStyle(
                                  color: context
                                      .theme.textTheme.labelSmall!.color!)),
                          subtitle: Text("${data.employeeAge}"),
                        );
                      });
                },
              );
            }),
          ),
          Expanded(
            child: Consumer(builder: (context, ref, child) {
              var airRes =
                  ref.watch(dummyProvider.select((value) => value.airlineRes));
              return BaseWidget(
                state: airRes!,
                onRefresh: () => dummyPro.getAir(),
                builder: (context) {
                  DummyModel dummyData = airRes.data as DummyModel;
                  return ListView.builder(
                      itemCount: dummyData.data?.length ?? 0,
                      itemBuilder: (BuildContext context, int index) {
                        Data data = dummyData.data![index];
                        return ListTile(
                          // leading: CircleAvatar(
                          //     backgroundImage:
                          //         NetworkImage(data.thumbnailUrl ?? '')),
                          title: Text("${data.employeeName}"),
                          subtitle: Text("${data.employeeAge}"),
                        );
                      });
                },
              );
            }),
          ),
          Expanded(
              child: Column(
            children: [
              Text('${context.height}'),
              Text('${context.width}'),
              Text('${context.isKeyboardVisible}'),
              const TextField()
            ],
          )),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:new_app_bloc/newsapp/network/Local/cache_helper.dart';
import 'package:new_app_bloc/newsapp/network/Remote/Dio_helper.dart';
import 'newsapp/Bloc/Observing a Cubit.dart';
import 'newsapp/Bloc/news_cubit.dart';
import 'newsapp/presentation/manager/News_layout.dart';
import 'newsapp/presentation/widgets/DarkMod.dart';
import 'newsapp/presentation/widgets/LightMod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  Dio_helper.init();
  await CacheHelper.init();
  bool? isdark = CacheHelper.getBoolean(key: 'isdark');

  runApp(todoapp(isdark));
}

class todoapp extends StatelessWidget {
  final bool? isdark;

  todoapp(
    this.isdark,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()
        ..changecountrypls(context)
        ..chngemode(Fromshared: isdark),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return ScreenUtilInit(
            designSize: const Size(360, 690),
            minTextAdapt: true,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return MaterialApp(
                theme: LIghtThemeData(context),
                darkTheme: DarkThemeData(context),
                themeMode: NewsCubit.get(context).isdark
                    ? ThemeMode.dark
                    : ThemeMode.light,
                debugShowCheckedModeBanner: false,
                home: const Directionality(
                    textDirection: TextDirection.ltr, child: News_Layout()),
              );
            },
          );
        },
      ),
    );
  }
}

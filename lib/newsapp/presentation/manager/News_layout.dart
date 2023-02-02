import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:new_app_bloc/newsapp/presentation/widgets/Components.dart';
import '../../Bloc/news_cubit.dart';
import '../SearchScreen/searchScreen.dart';

class News_Layout extends StatelessWidget {
  const News_Layout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        return Scaffold(
          persistentFooterButtons: [
            Center(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Developed by ',
                    style: TextStyle(
                        color: cubit.isdark ? Colors.white : Colors.black)),
                SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(fontSize: 15.sp, color: Colors.deepOrange),
                    child: AnimatedTextKit(
                      isRepeatingAnimation: true,
                      repeatForever: true,
                      animatedTexts: [
                        TypewriterAnimatedText('Mohamed Abdelhamed ✌🏻',
                            speed: Duration(milliseconds: 50))
                      ],
                    ),
                  ),
                )
              ],
            ))
          ],
          appBar: AppBar(
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              textBaseline: TextBaseline.ideographic,
              mainAxisSize: MainAxisSize.min,
              children: [
                DefaultTextStyle(
                  style: TextStyle(
                      fontSize: 20.0.sp,
                      color: cubit.isdark ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      WavyAnimatedText('News in '),
                    ],
                    isRepeatingAnimation: true,
                    repeatForever: true,
                  ),
                ),
                Text(cubit.appbartitle[cubit.currentindex],
                    style: TextStyle(
                      fontSize: 19.sp,
                      color: Colors.deepOrange,
                    )),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(cubit.country ? 'US' : 'EG',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 8.sp, fontWeight: FontWeight.bold)),
                      Text('',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 8.sp, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              IconButton(
                onPressed: () {
                  navigateto(context, searchScreen());
                },
                icon: Icon(
                  Icons.search_rounded,
                ),
              ),
              TextButton(
                  onPressed: () {
                    cubit.changeCountry(context);
                  },
                  style: ButtonStyle(
                      shape: MaterialStatePropertyAll(CircleBorder())),
                  child: Text(
                    cubit.country ? 'US' : 'EG',
                    style: TextStyle(
                      color: cubit.isdark ? Colors.deepOrange : Colors.black,
                    ),
                  )),
              IconButton(
                  focusColor: Colors.deepOrangeAccent[100],
                  hoverColor: Colors.deepOrangeAccent[100],
                  highlightColor: cubit.isdark
                      ? Colors.black26
                      : Colors.deepOrangeAccent[100],
                  visualDensity: VisualDensity.comfortable,
                  onPressed: () {
                    cubit.chngemode();
                  },
                  icon: Icon(
                    cubit.isdark
                        ? Icons.light_mode_outlined
                        : Icons.dark_mode_outlined,
                    color: cubit.isdark ? Colors.deepOrange : Colors.black,
                  ))
            ],
          ),
          body: cubit.togellscreen[cubit.currentindex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentindex,
            enableFeedback: true,
            onTap: (index) {
              cubit.bottomnavbar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}

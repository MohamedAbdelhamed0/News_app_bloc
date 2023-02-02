import 'package:cached_network_image/cached_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:new_app_bloc/newsapp/Bloc/news_cubit.dart';

import '../WepView/Wepview.dart';

Widget buildArticalItem(articles, context) {
  return BlocConsumer<NewsCubit, NewsState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      NewsCubit cubit = NewsCubit.get(context);
      String formattedDate = DateFormat('yyyy-MM-dd  HH:mm a')
          .format(DateTime.parse(articles['publishedAt']))
          .trimRight();

      return InkWell(
        onTap: () {
          navigateto(
            context,
            WebViewScreen(articles['url']),
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            children: [
              Container(
                width: 120.w,
                height: 110.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: articles['urlToImage'] != null
                    ? articles['urlToImage'].isNotEmpty
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: CachedNetworkImage(
                              repeat: ImageRepeat.noRepeat,
                              filterQuality: FilterQuality.high,
                              fadeInCurve: Curves.bounceInOut,
                              placeholder: (context, url) => Image.asset(
                                  fit: BoxFit.cover,
                                  'assets/images/126940-loading-animation.gif'),
                              imageUrl: '${articles['urlToImage']}',
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) => Image.asset(
                                  fit: BoxFit.cover,
                                  'assets/images/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg'),
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.asset(
                                fit: BoxFit.cover,
                                'assets/images/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg'),
                          )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                            fit: BoxFit.cover,
                            'assets/images/360_F_400243185_BOxON3h9avMUX10RsDkt3pJ8iQx72kS3.jpg'),
                      ),
              ),
              SizedBox(
                width: 15.w,
              ),
              Expanded(
                child: Container(
                  height: 110.h,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 4,
                            '${articles['title']}',
                            style: cubit.isdark
                                ? TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 16.sp)
                                : TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontSize: 16.sp)),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text('$formattedDate',
                            style: cubit.isdark
                                ? TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                    fontSize: 14.sp)
                                : TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey.shade900,
                                    fontSize: 14.sp)),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    },
  );
}

BlocConsumer<NewsCubit, NewsState> buildConditionalBuilder(List<dynamic> List) {
  return BlocConsumer<NewsCubit, NewsState>(
    listener: (context, state) {
      // TODO: implement listener
    },
    builder: (context, state) {
      return ConditionalBuilder(
        condition: List.length > 0,
        builder: (context) => ListView.separated(
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) =>
                buildArticalItem(List[index], context),
            separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.only(
                      bottom: 5, top: 8, left: 40, right: 40),
                  child: SizedBox(
                    width: 10.w,
                    height: .9.h,
                    child: Container(
                      color: NewsCubit.get(context).isdark
                          ? Colors.deepOrangeAccent
                          : Colors.grey,
                    ),
                  ),
                ),
            itemCount: 10),
        fallback: (context) => const Center(child: CircularProgressIndicator()),
      );
    },
  );
}

void navigateto(context, widget) => Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => widget),
    );

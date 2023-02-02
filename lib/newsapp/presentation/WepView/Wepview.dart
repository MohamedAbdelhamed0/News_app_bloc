// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../Bloc/news_cubit.dart';

class WebViewScreen extends StatelessWidget {
  WebViewController controller = WebViewController();

  WebViewScreen(String url) {
    controller.loadRequest(Uri.parse(url));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: cubit.isdark ? Colors.deepOrange : Colors.deepOrange,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            backgroundColor: cubit.isdark ? Colors.black : Colors.white,
            title: Text('Wep view',
                style: TextStyle(
                  color: cubit.isdark ? Colors.deepOrange : Colors.deepOrange,
                )),
            centerTitle: true,
          ),
          body: WebViewWidget(
            controller: controller,
          ),
        );
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Bloc/news_cubit.dart';
import '../widgets/Components.dart';

class searchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController? searchController;
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        var List = cubit.search;
        return SafeArea(
          child: Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: cubit.isdark ? Colors.deepOrange : Colors.deepOrange,
                  )),
              title: TextFormField(
                style: TextStyle(
                  color: cubit.isdark ? Colors.white : Colors.black,
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Search must be not empty';
                  } else {
                    return null;
                  }
                },
                controller: searchController,
                onChanged: (String value) {
                  cubit.getSerachedItem(value);
                },
                decoration: const InputDecoration(
                  focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.deepOrange, width: 5)),
                  fillColor: Colors.deepOrange,
                  focusColor: Colors.deepOrange,
                  prefixIcon: Icon(
                    Icons.search_rounded,
                    color: Colors.deepOrange,
                  ),
                  label: Text('search',
                      style: TextStyle(
                        color: Colors.deepOrange,
                      )),
                  labelStyle: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            body: buildConditionalBuilder(List),
          ),
        );
      },
    );
  }
}

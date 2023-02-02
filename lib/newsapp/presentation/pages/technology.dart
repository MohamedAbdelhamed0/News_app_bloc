import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../Bloc/news_cubit.dart';
import '../widgets/Components.dart';

class technologyScreen extends StatelessWidget {
  const technologyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        var List = cubit.technology;
        return buildConditionalBuilder(List);
      },
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../Bloc/news_cubit.dart';
import '../../widgets/Components.dart';

class scienceScreen extends StatelessWidget {
  const scienceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        NewsCubit cubit = NewsCubit.get(context);
        var List = cubit.Science;
        return buildConditionalBuilder(List);
      },
    );
  }
}

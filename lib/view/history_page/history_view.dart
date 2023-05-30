import 'package:final_shop/view/history_page/widget/custem_history_item.dart';
import 'package:final_shop/view/resources/color_manager.dart';
import 'package:final_shop/view/resources/strings_manager.dart';
import 'package:final_shop/view_model/history/cubit.dart';
import 'package:final_shop/view_model/history/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class HistoryView extends StatefulWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  State<HistoryView> createState() => _HistoryViewState();
}

class _HistoryViewState extends State<HistoryView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HistoryCubit()..getHistory(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppString.productsYouHavePurchased.tr),
          backgroundColor: ColorManger.primary,
          elevation: 0,
        ),
        body: BlocConsumer<HistoryCubit, HistoryStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return ListView.builder(
              itemBuilder: (context, index) {
                if (state is HistoryLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return CustemIthemHistory(
                      image: context
                          .read<HistoryCubit>()
                          .dataAll[index]
                          .image
                          .toString(),
                      price: context
                          .read<HistoryCubit>()
                          .dataAll[index]
                          .price
                          .toString(),
                      title: context
                          .read<HistoryCubit>()
                          .dataAll[index]
                          .title
                          .toString());
                }
              },
              itemCount: context.read<HistoryCubit>().dataAll.length,
            );
          },
        ),
      ),
    );
  }
}

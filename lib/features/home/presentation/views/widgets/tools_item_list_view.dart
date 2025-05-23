import 'package:akhder/features/home/presentation/manager/tools_products_cubit/tools_products_cubit.dart';
import 'package:akhder/features/home/presentation/views/widgets/custom_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';

class ToolsItemListView extends StatelessWidget {
  const ToolsItemListView({Key? key,  this.scrollDirection= Axis.horizontal, this.topPadding=0, this.bottomPadding=0}) : super(key: key);
final Axis scrollDirection;
final double topPadding;
final double bottomPadding;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ToolsProductsCubit, ToolsProductsState>(
      builder: (context, state) {
        if(state is ToolsProductsSuccess)
        {
          return SizedBox(
            height: MediaQuery.of(context).size.height*0.32,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: scrollDirection,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: state.products.length,
                itemBuilder: (context, index) =>  Padding(
                  padding:  EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: CustomItemWidget(product: state.products[index],),
                ),
              ),
            ),
          );

        }
        else if(state is ToolsProductsFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

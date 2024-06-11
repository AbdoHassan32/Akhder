import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import '../../manager/all_products/all_products_cubit.dart';
import '../../manager/all_products/all_products_state.dart';
import 'custom_item_widget.dart';

class AllItemListView extends StatelessWidget {
  const AllItemListView({Key? key,  this.scrollDirection= Axis.horizontal, this.topPadding=0, this.bottomPadding=0, this.query=''}) : super(key: key);
  final Axis scrollDirection;
  final double topPadding;
  final double bottomPadding;
  final String query;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllProductsCubit, AllProductsState>(
      builder: (context, state) {
        if(state is AllProductsSuccess)
        {
          return SizedBox(
            height: MediaQuery.of(context).size.height*0.32,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: scrollDirection,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: query == '' ?state.products.length : state.products.where((product) => product.name!.toLowerCase().contains(query.toLowerCase())).toList().length ,

                itemBuilder: (context, index) =>  Padding(
                  padding: EdgeInsets.only(
                    right: 10,
                    left: 10,
                    top: topPadding,
                    bottom: bottomPadding,
                  ),
                  child: CustomItemWidget(product: query == ''? state.products[index] : state.products.where((product) => product.name!.toLowerCase().contains(query.toLowerCase())).toList()[index],),
                ),
              ),
            ),
          );

        }
        else if(state is AllProductsFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

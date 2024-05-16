import 'package:akhder/features/home/presentation/manager/insecticides_products_cubit/insecticides_products_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../../../core/widgets/custom_loading_indicator.dart';
import 'custom_item_widget.dart';

class InsecticidesItemListView extends StatelessWidget {
  const InsecticidesItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InsecticidesProductsCubit, InsecticidesProductsState>(
      builder: (context, state) {
        if(state is InsecticidesProductsSuccess)
        {
          return SizedBox(
            height: MediaQuery.of(context).size.height*0.32,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                itemCount: state.products.length,
                itemBuilder: (context, index) =>  Padding(
                  padding: const EdgeInsets.only(
                    right: 10,
                    left: 10,
                  ),
                  child: CustomItemWidget(product: state.products[index],),
                ),
              ),
            ),
          );

        }
        else if(state is InsecticidesProductsFailure){
          return CustomErrorWidget(errMessage: state.errMessage);
        }
        else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

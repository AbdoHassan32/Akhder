import 'package:akhder/core/widgets/custom_error_widget.dart';
import 'package:akhder/core/widgets/custom_loading_indicator.dart';
import 'package:akhder/features/home/presentation/manager/agricultural_fertilizers_cubit/agricultural_fertilizers_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_item_widget.dart';

class AgriculturalFertilizersItemListView extends StatelessWidget {
  const AgriculturalFertilizersItemListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AgriculturalFertilizersCubit, AgriculturalFertilizersState>(
  builder: (context, state) {
    if(state is AgriculturalFertilizersSuccess)
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
    else if(state is AgriculturalFertilizersFailure){
      return CustomErrorWidget(errMessage: state.errMessage);
    }
    else {
      return const CustomLoadingIndicator();
    }
  },
);
  }
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../data/repos/home_repo.dart';

part 'tools_products_state.dart';

class ToolsProductsCubit extends Cubit<ToolsProductsState> {
  ToolsProductsCubit(this.homeRepo) : super(ToolsProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchToolsProducts() async {
    emit(ToolsProductsLoading());
    var result = await homeRepo.fetchToolsProducts();
    result.fold((failure) => emit(ToolsProductsFailure(failure.errMessage)),
            (products) => emit(ToolsProductsSuccess(products)));
  }
}

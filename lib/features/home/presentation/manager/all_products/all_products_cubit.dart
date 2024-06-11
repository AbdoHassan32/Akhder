import 'package:bloc/bloc.dart';

import '../../../data/repos/home_repo.dart';
import 'all_products_state.dart';


class AllProductsCubit extends Cubit<AllProductsState> {
  AllProductsCubit(this.homeRepo) : super(AllProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchAllProducts() async {
    emit(AllProductsLoading());
    var result = await homeRepo.fetchAllProducts();
    result.fold((failure) => emit(AllProductsFailure(failure.errMessage)),
            (products) => emit(AllProductsSuccess(products)));
  }
}

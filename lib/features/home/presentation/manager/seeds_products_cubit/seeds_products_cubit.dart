import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../data/repos/home_repo.dart';

part 'seeds_products_state.dart';

class SeedsProductsCubit extends Cubit<SeedsProductsState> {
  SeedsProductsCubit(this.homeRepo) : super(SeedsProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchSeedsProducts() async {
    emit(SeedsProductsLoading());
    var result = await homeRepo.fetchSeedsProducts();
    result.fold((failure) => emit(SeedsProductsFailure(failure.errMessage)),
            (products) => emit(SeedsProductsSuccess(products)));
  }
}

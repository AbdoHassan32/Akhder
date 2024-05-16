import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/product.dart';
import '../../../data/repos/home_repo.dart';

part 'corps_products_state.dart';

class CorpsProductsCubit extends Cubit<CorpsProductsState> {
  CorpsProductsCubit(this.homeRepo) : super(CorpsProductsInitial());
  final HomeRepo homeRepo;
  Future<void> fetchCorpsProducts() async {
    emit(CorpsProductsLoading());
    var result = await homeRepo.fetchCorpsProducts();
    result.fold((failure) => emit(CorpsProductsFailure(failure.errMessage)),
            (products) => emit(CorpsProductsSuccess(products)));
  }
}

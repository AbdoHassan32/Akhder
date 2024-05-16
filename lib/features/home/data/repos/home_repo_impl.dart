import 'package:akhder/features/home/data/models/product.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/utils/api_service.dart';
import 'home_repo.dart';

class HomeRepoImplement implements HomeRepo{
  final ApiService apiService;

  HomeRepoImplement(this.apiService);



  @override
  Future< Either< Failure, List<Product> > > fetchAgriculturalFertilizersProducts() async {
    var data = await apiService.get(query: '1');
    List<Product> products = [];

    print(data);
    for (var item in data) {
      try {

        products.add(Product.fromJson(item));
      } catch (e) {
        products.add(Product.fromJson(item));
      }
    }

    return right(products);


  }

  @override
  Future< Either< Failure, List<Product> > > fetchInsecticidesProducts() async {
    var data = await apiService.get(query: '2');
    List<Product> products = [];

    print(data);
    for (var item in data) {
      try {

        products.add(Product.fromJson(item));
      } catch (e) {
        products.add(Product.fromJson(item));
      }
    }

    return right(products);


  }

  @override
  Future< Either< Failure, List<Product> > > fetchToolsProducts() async {
    var data = await apiService.get(query: '3');
    List<Product> products = [];

    print(data);
    for (var item in data) {
      try {

        products.add(Product.fromJson(item));
      } catch (e) {
        products.add(Product.fromJson(item));
      }
    }

    return right(products);


  }

  @override
  Future< Either< Failure, List<Product> > > fetchSeedsProducts() async {
    var data = await apiService.get(query: '4');
    List<Product> products = [];

    print(data);
    for (var item in data) {
      try {

        products.add(Product.fromJson(item));
      } catch (e) {
        products.add(Product.fromJson(item));
      }
    }

    return right(products);


  }

  @override
  Future< Either< Failure, List<Product> > > fetchCorpsProducts() async {
    var data = await apiService.get(query: '5');
    List<Product> products = [];

    print(data);
    for (var item in data) {
      try {

        products.add(Product.fromJson(item));
      } catch (e) {
        products.add(Product.fromJson(item));
      }
    }

    return right(products);


  }
}

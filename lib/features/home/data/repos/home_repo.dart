import 'package:akhder/core/errors/failures.dart';
import 'package:dartz/dartz.dart';

import '../models/product.dart';

abstract class HomeRepo
{
Future< Either < Failure, List<Product>> >fetchAgriculturalFertilizersProducts();

Future< Either < Failure, List<Product>> >fetchInsecticidesProducts();

Future< Either < Failure, List<Product>> >fetchToolsProducts();

Future< Either < Failure, List<Product>> >fetchSeedsProducts();

Future< Either < Failure, List<Product>> >fetchCorpsProducts();


}
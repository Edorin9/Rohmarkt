import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';

import '../common/errors/exceptions.dart';
import '../common/errors/failures.dart';
import 'models/market_item.dart';
import 'services/network_info.dart';
import 'sources/dreamshape_api.dart';

class Repository {
  final DreamShapeApi _api;
  final NetworkInfo _networkInfo;

  Repository({
    @required DreamShapeApi api,
    @required NetworkInfo networkInfo,
  })  : _api = api,
        _networkInfo = networkInfo;

  Future<Either<Failure, List<MarketItem>>> getMarketItems() async {
    if (await _networkInfo.isConnected) {
      try {
        final marketItems = await _api.getMarketItems();
        return Right(marketItems);
      } on ServerException catch (e) {
        return Left(ServerFailure(e.message));
      }
    } else {
      return const Left(ConnectionFailure('Please connect to the internet'));
    }
  }
}

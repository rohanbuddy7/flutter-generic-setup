
import 'package:flutter/foundation.dart';

enum Flavour{
  staging,
  prod
}

class Environment{
  Environment._internal();
  static final Environment _instance = Environment._internal();
  factory Environment(){
    return _instance;
  }

  BaseEnvironment config = StagingEnvironment();
  init(Flavour e){
    switch(e){
      case Flavour.staging:
        config = StagingEnvironment();
        break;
      case Flavour.prod:
        config = ProdEnvironment();
        break;
    }
  }

}

abstract class BaseEnvironment{
  Flavour get envFlavour;
  String get baseUrl;
}

class StagingEnvironment extends BaseEnvironment{
  @override
  String get baseUrl => "https://staging.example.com";

  @override
  Flavour get envFlavour => Flavour.staging;
}

class ProdEnvironment extends BaseEnvironment{
  @override
  String get baseUrl => "https://prod.example.com";

  @override
  Flavour get envFlavour => Flavour.prod;
}


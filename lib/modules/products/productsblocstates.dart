abstract class ProductStates{}
class InitialProductState extends ProductStates{}
class AppScreenState extends ProductStates{}
class LoadingGetProductState extends ProductStates{}
class successGetProductState extends ProductStates{}
class FailedGetProductState extends ProductStates{
  final error;
  FailedGetProductState({required this.error});
}
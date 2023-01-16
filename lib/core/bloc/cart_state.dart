part of 'cart_bloc.dart';

/// [CartState] abstract class is used Auth State
abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}

/// [CartInitial] class is used Auth State Initial
class CartInitial extends CartState {}

/// [CartLoading] class is used Auth State Loading
class CartLoading extends CartState {}

/// [CartResponse] class is used Auth State Response
class CartResponse extends CartState {}

/// [CartFailure] class is used Auth State Failure
class CartFailure extends CartState {}

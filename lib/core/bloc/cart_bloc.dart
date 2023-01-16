import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cart_event.dart';
part 'cart_state.dart';

/// Notifies the [CartBloc] of a new [CartEvent] which triggers
/// [RepositoryCart] This class used to API and bloc connection.
/// [ApiProvider] class is used to network API call.
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartProgress>(_onCartProgress);
  }

  /// Notifies the [_onAuthNewUser] of a new [CartCart] which triggers
  void _onCartProgress(
    CartProgress event,
    Emitter<CartState> emit,
  ) async {
    emit(CartLoading());
    emit(CartResponse());
  }
}

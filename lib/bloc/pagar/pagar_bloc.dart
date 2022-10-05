import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:stripe_second_app/models/tarjeta_credito.dart';

part 'pagar_event.dart';
part 'pagar_state.dart';

class PagarBloc extends Bloc<PagarEvent, PagarState> {
  PagarBloc() : super(PagarState()) {
    //event.tarjeta = viene del evento OnSeleccionarTarjeta se encuentra la propiedad "tarjeta"
    // <OnSeleccionarTarjeta> es el evento que el listener va a escuchar.
    on<OnSeleccionarTarjeta>((event, emit) {
      emit(state.copyWith(tarjetaActiva: true, tarjeta: event.tarjeta));
    });

    on<OnDesactivarTarjeta>((event, emit) {
      emit(state.copyWith(tarjetaActiva: false));
    });
  }
}

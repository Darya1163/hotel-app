
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotels_app/presentation/widgets/booking/expansion_form.dart';

part 'form_event.dart';
part 'form_state.dart';

class TouristFormBloc extends Bloc<TouristFormEvent, TouristFormState> {
  TouristFormBloc() : super(const TouristFormState()) {
    on<AddTouristBloc>(_onAddTourist);
  }

  void _onAddTourist(AddTouristBloc event, Emitter<TouristFormState> emit) {
    final state = this.state;

    emit(TouristFormState(
      tourists: List.from(state.tourists)..add(event.touristForm)
    ));
  }
}

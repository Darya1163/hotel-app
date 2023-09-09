part of 'form_bloc.dart';

sealed class TouristFormEvent extends Equatable {
  const TouristFormEvent();

  @override
  List<Object> get props => [];
}

class AddTouristBloc extends TouristFormEvent {
  final Column touristForm;
  const AddTouristBloc({required this.touristForm});
  
  @override
  List<Object> get props => [touristForm];
}

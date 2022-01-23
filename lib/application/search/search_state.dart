part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  
  const factory SearchState ({
    /// Initial state, hiden profile state, nolikes state and success state
    required SearchStateType stateType, 

     /// A flag that responsible for displaying error message.
    required String errorMessage,

    //List of applicants 
    required List<Applicant> applicants,  

  }) =_SearchState; 

  factory SearchState.initial() =>const SearchState(applicants: [], stateType: SearchStateType.initial, errorMessage: ''); 
}

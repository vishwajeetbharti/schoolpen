import 'package:flutter_bloc/flutter_bloc.dart';

part 'eventBloc.dart';
part 'stateBloc.dart';

class SignUpBloc extends Bloc<SignUpEvents, SignUpStates> {
  SignUpBloc() : super(CameraLoadingState()) {
    on<InitialEvent>((event, emit) {
      emit(CameraLoadingState());
    });
    on<CameraLoadingEvent>((event, emit) {
      emit(CameraState());
    });
    on<FingerPrintEvent>((event, emit) {
      emit(FingerPrintState());
    });
    on<GetNameEvent>((event, emit) => emit(GetNameState()));
    on<GetRegionEvent>((event, emit) {
      emit(GetRegionState());
    });
    on<ChooseProfileEvent>((event, emit) => emit(ChooseProfileState()));
    on<TeacherEvent>((event, emit) => emit(TeacherState()));
    on<StudentEvent>((event, emit) => emit(StudentState()));
    on<ParentEvent>((event, emit) => emit(ParentState()));
  }
}

final SignUpBloc signUpBloc = SignUpBloc();

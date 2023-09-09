part of 'bloc.dart';

abstract class SignUpStates {}

class CameraState extends SignUpStates {
  CameraState();
}

class CameraLoadingState extends SignUpStates {
  CameraLoadingState();
}

class FingerPrintState extends SignUpStates {
  FingerPrintState();
}

class GetNameState extends SignUpStates {
  GetNameState();
}

class GetRegionState extends SignUpStates {
  GetRegionState();
}

class ChooseProfileState extends SignUpStates {
  ChooseProfileState();
}

class TeacherState extends SignUpStates {
  TeacherState();
}

class StudentState extends SignUpStates {
  StudentState();
}

class ParentState extends SignUpStates {
  ParentState();
}

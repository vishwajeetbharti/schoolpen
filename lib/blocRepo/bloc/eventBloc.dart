part of 'bloc.dart';

abstract class SignUpEvents {}

class InitialEvent extends SignUpEvents {
  InitialEvent();
}

class CameraLoadingEvent extends SignUpEvents {
  CameraLoadingEvent();
}

class FingerPrintEvent extends SignUpEvents {
  FingerPrintEvent();
}

class GetNameEvent extends SignUpEvents {
  GetNameEvent();
}

class GetRegionEvent extends SignUpEvents {
  String userName;
  GetRegionEvent({required this.userName});
}

class ChooseProfileEvent extends SignUpEvents {
  String region;
  ChooseProfileEvent({required this.region});
}

class TeacherEvent extends SignUpEvents {
  TeacherEvent();
}

class StudentEvent extends SignUpEvents {
  StudentEvent();
}

class ParentEvent extends SignUpEvents {
  ParentEvent();
}

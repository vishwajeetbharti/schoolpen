import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:schoolpen/signUpScreens/fillName.dart';
import 'package:schoolpen/signUpScreens/profileType.dart';
import 'package:schoolpen/signUpScreens/teacherScreen.dart';

import '../../blocRepo/bloc/bloc.dart';
import '../fingerPrint.dart';
import '../parentScreen.dart';
import '../region.dart';
import '../studentsScreen.dart';
import '../widgets/linearProgressIndicator.dart';

class BlocView extends StatefulWidget {
  const BlocView({super.key});

  @override
  State<BlocView> createState() => _BlocViewState();
}

class _BlocViewState extends State<BlocView> {
  final List<CameraDescription> _cameras = [];
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _regionController = TextEditingController();

  late CameraController _controller;
//----initialization of front Camera with (camera permission)------
  initCamera() async {
    var status = await Permission.camera.request();
    if (status.isGranted) {
      try {
        await availableCameras().then((value) => _cameras.addAll(value));
        _controller = CameraController(_cameras[1], ResolutionPreset.ultraHigh);
        _controller.initialize();
        Future.delayed(const Duration(seconds: 2))
            .then((value) => signUpBloc.add(CameraLoadingEvent()));

//-----After future Delay of 5 seconds triggering new event of fingerPrint Screen(because no button in UI)--------
        Future.delayed(const Duration(seconds: 7))
            .then((value) => signUpBloc.add(FingerPrintEvent()));
      } catch (e) {
        if (kDebugMode) {
          print(e);
        }
      }
//-----After future Delay of 10 seconds triggering new event of fill Name Screen(because no button in UI)--------
      Future.delayed(const Duration(seconds: 12))
          .then((value) => signUpBloc.add(GetNameEvent()));
    }
  }

  @override
  void initState() {
//------At Initial Camera Screen Event starts-------
    signUpBloc.add(InitialEvent());
    initCamera();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocProvider(
        create: (_) => signUpBloc,
        child: BlocBuilder<SignUpBloc, SignUpStates>(
          builder: (context, state) {
            if (state is CameraLoadingState) {
//-------------At Camera Loading State-------------
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/Group3862.png'),
                    const SizedBox(
                      height: 25,
                    ),
                    Image.asset('assets/SchoolPen.png'),
                    const SizedBox(
                      height: 25,
                    ),
                    const CircularProgressIndicator(
                      color: Color(0xFF9163D7),
                    ),
                  ],
                ),
              );
            } else if (state is FingerPrintState) {
//-----------after 5 sec it will automatically came on screen(Finger Print Screen)----------
              return FingerPrint(w: width, h: height);
            } else if (state is CameraState) {
//--------At Camera Loaded state, it will open Camera on Screen----------
              return cameraPreview(height, width);
            } else if (state is GetNameState) {
//-----------after 10 sec it will automatically came on screen(fill Name Screen)----------
              return FillName(
                h: height,
                w: width,
                controller: _nameController,
              );
            } else if (state is GetRegionState) {
//----------after passing from (fillName Screen) it will came (ask for Region)-----------
              return Region(
                h: height,
                w: width,
                controller: _regionController,
                name: state.name,
              );
            } else if (state is ChooseProfileState) {
//----------after passing from (Region Screen) it will came (Profile Type selection)-----------
              return ProfileSelection(h: height, w: width);
            } else if (state is TeacherState) {
//-----------Teacher Screen--------------
              return TeacherScreen(h: height, w: width);
            } else if (state is StudentState) {
//-----------Student Screen--------------
              return StudentScreen(h: height, w: width);
            } else if (state is ParentState) {
//-----------Parent Screen--------------
              return ParentScreen(h: height, w: width);
            } else {
//-----------Loading Screen for Any Error--------------
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }

  Widget cameraPreview(double h, double w) {
    return Stack(
      children: [
        SizedBox(
          child: CameraPreview(
            _controller,
          ),
        ),
        Padding(
          padding: EdgeInsets.all(w * 0.25),
          child: Image.asset('assets/Group 4111.png'),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              height: h * 0.3,
              width: w,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  topLeft: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.05,
                  ),
                  CameraProgressIndicator(h: h, value: w),
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}

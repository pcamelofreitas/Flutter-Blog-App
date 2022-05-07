import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_capyba_challenge/src/shared/design_system/assets/capyba_social_icons.dart';
import 'package:flutter_capyba_challenge/src/shared/design_system/tokens/color_tokens.dart';
import 'package:flutter_capyba_challenge/src/shared/design_system/tokens/spacing_tokens.dart';
import 'package:flutter_capyba_challenge/src/shared/presentation/widgets/capyba_social_circular_progress_indicator.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  final CameraLensDirection cameraLensDirection;
  final void Function() _closeScreen;
  final void Function(String imagePath) _takePicture;

  const CameraScreen({
    Key? key,
    this.cameraLensDirection = CameraLensDirection.back,
    required void Function() closeScreen,
    required void Function(String imagePath) takePicture,
  })  : _closeScreen = closeScreen,
        _takePicture = takePicture,
        super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late CameraLensDirection _selectedCamera;
  Size? _previewSize;

  @override
  void initState() {
    _selectedCamera = widget.cameraLensDirection;
    _initCamera(widget.cameraLensDirection);

    super.initState();
  }

  @override
  void dispose() {
    try {
      _cameraController.dispose();
    } catch (_) {}

    super.dispose();
  }

  void _initCamera(CameraLensDirection selectedCamera) async {
    _getCamera(selectedCamera).then(
      (CameraDescription camera) async {
        try {
          await _openCamera(camera);
        } catch (e) {
          widget._closeScreen();
        }
      },
    );
  }

  Future<CameraDescription> _getCamera(CameraLensDirection dir) async {
    return availableCameras().then(
      (List<CameraDescription> cameras) => cameras.firstWhere(
        (CameraDescription camera) => camera.lensDirection == dir,
      ),
    );
  }

  Future<void> _openCamera(CameraDescription camera) async {
    const ResolutionPreset preset = ResolutionPreset.medium;
    var status = await Permission.camera.status;

    if (!status.isGranted) {
      status = await Permission.camera.request();

      if (!status.isGranted) {
        widget._closeScreen();
      }
    }

    setState(
      () {
        _cameraController = CameraController(
          camera,
          preset,
        );
      },
    );

    if (status.isGranted) {
      try {
        await _cameraController.initialize();
        _previewSize = _cameraController.value.previewSize;
        _cameraController.lockCaptureOrientation();
        setState(() {});
      } catch (_) {}
    }
  }

  void _changeCamera() {
    CameraLensDirection _cameraDirection =
        _selectedCamera == CameraLensDirection.back
            ? CameraLensDirection.front
            : CameraLensDirection.back;
    setState(
      () {
        _selectedCamera = _cameraDirection;
      },
    );
    _initCamera(_cameraDirection);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorTokens.neutralDarkest,
      body: _previewSize != null
          ? Column(
              children: [
                CameraPreview(_cameraController),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: SpacingTokens.tera,
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () => widget._closeScreen(),
                        child: const Icon(
                          CapybaSocialIcons.indexLeft,
                          color: ColorTokens.neutralLightest,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final XFile xFile =
                              await _cameraController.takePicture();
                          widget._takePicture(xFile.path);
                          widget._closeScreen();
                        },
                        child: Container(
                          height: 60.0,
                          width: 60.0,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ColorTokens.neutralLightest,
                            border: Border.all(
                              color: ColorTokens.primary,
                              width: 2.0,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: _changeCamera,
                        child: const Icon(
                          CapybaSocialIcons.autoRenew,
                          color: ColorTokens.neutralLightest,
                        ),
                      ),
                    ],
                  ),
                ),
                // const Spacer(),
                const Spacer(),
              ],
            )
          : const Center(
              child: CapybaSocialCircularProgressIndicator(),
            ),
    );
  }
}

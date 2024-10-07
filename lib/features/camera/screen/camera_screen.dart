import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:permission_handler/permission_handler.dart';

class CameraScreen extends StatefulWidget {
  final Function(XFile) onPictureTaken;

  const CameraScreen({required this.onPictureTaken, super.key});

  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  List<CameraDescription>? cameras;
  bool _isCameraInitialized = false;
  int _selectedCameraIndex = 0;
  bool _isOpenFlash = true;
  double _baseScale = 1.0;
  double _currentScale = 1.0;
  double? _maxZoom;

  @override
  void initState() {
    super.initState();
    _requestPermissionsAndInitializeCamera();
  }

  Future<void> _requestPermissionsAndInitializeCamera() async {
    var status = await Permission.camera.status;
    if (status.isGranted) {
      _initializeCamera();
    } else {
      await Permission.camera.request().then((status) {
        if (status.isGranted) {
          _initializeCamera();
        }
      });
    }
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _controller = CameraController(
          cameras![_selectedCameraIndex], ResolutionPreset.high);
      await _controller!.initialize();
      await _updateFlashMode();
      await _setMaxZoom();
      setState(() {
        _isCameraInitialized = true;
      });
    }
  }

  void _swapCamera() {
    if (cameras != null && cameras!.length > 1) {
      _selectedCameraIndex = (_selectedCameraIndex + 1) % cameras!.length;
      _initializeCamera();
    }
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      final XFile picture = await _controller!.takePicture();
      widget.onPictureTaken(picture);
      Navigator.pop(context);
    }
  }

  Future<void> _setMaxZoom() async {
    final maxZoom = await _controller!.getMaxZoomLevel();
    setState(() {
      _maxZoom = maxZoom;
    });
  }

  Future<void> _updateFlashMode() async {
    await _controller!
        .setFlashMode(_isOpenFlash ? FlashMode.always : FlashMode.off);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || !_controller!.value.isInitialized) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }
    var scale = MediaQuery.of(context).size.aspectRatio *
        _controller!.value.aspectRatio;
    if (scale < 1) scale = 1 / scale;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () async {
              setState(() {
                _isOpenFlash = !_isOpenFlash;
              });
              await _updateFlashMode();
            },
            icon: Icon(_isOpenFlash ? Icons.flash_on : Icons.flash_off,
                color: Colors.white)),
        title: const Text('Camera', style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: _isCameraInitialized
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: GestureDetector(
                    onScaleStart: (_) {
                      _baseScale = _currentScale;
                    },
                    onScaleUpdate: (ScaleUpdateDetails details) {
                      setState(() {
                        _currentScale =
                            (_baseScale * details.scale).clamp(1.0,_maxZoom ?? 4.0);
                        _controller!.setZoomLevel(_currentScale);
                      });
                    },
                    child: Transform.scale(
                      scale: scale,
                      child: Center(
                        child: CameraPreview(_controller!),
                      ),
                    ),
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                      padding: const EdgeInsets.only(left: 12.0, right: 24.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: const Text('Hủy',
                                style: TextStyle(
                                    fontSize: 20, color: Colors.white)),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          InkWell(
                            onTap: _takePicture,
                            child: Container(
                              padding: const EdgeInsets.all(2.5),
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: Colors.white, width: 2.0)),
                              child: const CircleAvatar(
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ),
                          CircleAvatar(
                            backgroundColor:
                                const Color.fromARGB(120, 120, 128, 1),
                            child: IconButton(
                              padding: EdgeInsets.zero,
                              icon: const Icon(Icons.swap_horiz_outlined,
                                  size: 30, color: Colors.white),
                              onPressed: _swapCamera,
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}

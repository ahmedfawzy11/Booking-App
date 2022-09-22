import 'package:flutter/material.dart';

enum ImageSourceType { gallery, camera }

class ProfileWidget extends StatefulWidget {
  late final String imagePath;
  final bool showEditBottom;

  ProfileWidget({
    Key? key,
    required this.imagePath,
    required this.showEditBottom,
  }) : super(key: key);

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  //ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.primary;

    if (widget.showEditBottom) {
      return Center(
        child: Stack(
          children: [
            buildImage(),
            Positioned(
              bottom: 0,
              right: 4,
              child: buildEditIcon(color, context),
            ),
          ],
        ),
      );
    } else {
      return Center(
        child: buildImage(),
      );
    }
  }

  Widget buildImage() {
    final image = NetworkImage(widget.imagePath);

    return ClipOval(
      child: Material(
        color: Colors.transparent,
        child: Ink.image(
          image: image,
          fit: BoxFit.cover,
          width: 80,
          height: 80,
          child: InkWell(
            onTap: () {
              print("Image uplaod");
            },
          ),
        ),
      ),
    );
  }

  Widget buildEditIcon(Color color, BuildContext context) => buildCircle(
        color: Colors.white,
        all: 3,
        child: buildCircle(
          color: color,
          all: 4,
          child: InkWell(
              /*onTap: () async {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return SimpleDialog(
                      title: const Text('Select Photo'),
                      children: <Widget>[
                        SimpleDialogOption(
                          onPressed: () async {
                            var source = ImageSource.gallery;
                            XFile? image = await imagePicker.pickImage(
                                source: source,
                                imageQuality: 50,
                                preferredCameraDevice: CameraDevice.front);
                            setState(() {
                              widget.imagePath = image!.path;
                            });
                            // ignore: use_build_context_synchronously
                            Navigator.pop(context);
                          },
                          child: const Text('Gallary'),
                        ),
                        SimpleDialogOption(
                          onPressed: () async {
                            var source = ImageSource.camera;
                            XFile? image = await imagePicker.pickImage(
                                source: source,
                                imageQuality: 50,
                                preferredCameraDevice: CameraDevice.front);
                            setState(() {
                              widget.imagePath = image!.path;
                            });
                            Navigator.pop(context);
                          },
                          child: const Text('Cameraa'),
                        ),
                      ],
                    );
                  },
                );
              },*/
              child: const Icon(
            Icons.add_a_photo,
            color: Colors.white,
            size: 20,
          )),
        ),
      );

  Widget buildCircle({
    required Widget child,
    required double all,
    required Color color,
  }) =>
      ClipOval(
        child: Container(
          padding: EdgeInsets.all(all),
          color: color,
          child: child,
        ),
      );
}

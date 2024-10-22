import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruit_hub_dashboard/core/utils/app_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged});
  final ValueChanged<File?> onFileChanged ;
  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;
  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            await pickImage();
          } catch (e) {
            setState(() {
              isLoading = false;
            });
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: fileImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(16.0),
                      child: Image.file(fileImage!))
                  : const Icon(
                      Icons.image_outlined,
                      size: 180,
                      color: AppColors.lightPrimaryColor,
                    ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    widget.onFileChanged(fileImage);
                  });
                },
                icon: const CircleAvatar(child: Icon(Icons.delete)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    fileImage = File(image!.path);
    widget.onFileChanged(fileImage!);
  }
}

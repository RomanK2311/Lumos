import 'package:flutter/material.dart';

import 'package:quill/editor/single_image_editor.dart';
import 'package:quill/utility/model.dart';

class ImageLayerDialog extends StatefulWidget {
  final int index;

  final ImageLayerData layerData;

  final Function onUpdate;

  const ImageLayerDialog({
    super.key,
    required this.layerData,
    required this.index,
    required this.onUpdate,
  });

  @override
  createState() => _ImageLayerDialogState();
}

class _ImageLayerDialogState extends State<ImageLayerDialog> {
  double slider = 0.0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: const BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(10), topLeft: Radius.circular(10)),
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Center(
            child: Text(
              'Size Adjust'.toUpperCase(),
              style: const TextStyle(color: Colors.white),
            ),
          ),
          const Divider(),
          Slider(
              activeColor: Colors.white,
              inactiveColor: Colors.grey,
              value: widget.layerData.scale,
              min: 0,
              max: 2,
              divisions: 100,
              onChangeEnd: (v) {
                setState(() {
                  widget.layerData.scale = v.toDouble();
                  widget.onUpdate();
                });
              },
              onChanged: (v) {
                setState(() {
                  slider = v;
                  widget.layerData.scale = v.toDouble();
                  widget.onUpdate();
                });
              }),
          const SizedBox(height: 10),
          Row(children: [
            Expanded(
              child: TextButton(
                onPressed: () {
                  removedLayers.add(layers.removeAt(widget.index));
                  Navigator.pop(context);
                  widget.onUpdate();
                },
                child: const Text(
                  'Remove',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ]),
        ],
      ),
    );
  }
}

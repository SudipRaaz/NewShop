import 'package:flutter/material.dart';

class Profile_tile extends StatelessWidget {
  String? tile_name = '';
  Profile_tile({Key? key, required this.tile_name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsetsDirectional.all(15),
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.all(Radius.circular(12.0)),
          ),
          child: InkWell(
            child: Column(
              children: [
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tile_name.toString(),
                          style: const TextStyle(fontSize: 25),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Active:       "),
                            Text("Inactive:       "),
                            Text("Paused:       "),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.play_arrow_outlined,
                      size: 45,
                    )
                  ],
                )

                //
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:multimedia/models/multimedia.dart';
import 'package:multimedia_grid/multimedia_grid.dart';

class MultimediasGridForMessage extends StatelessWidget {
  final Iterable<Multimedia> medias;
  final String blobServiceUrl;
  final String noMediaPath;
  final String notFoundMediaPath;
  final void Function(int)? onTap;
  
  const MultimediasGridForMessage({
    super.key,
    required this.medias,
    required this.blobServiceUrl,
    required this.noMediaPath,
    required this.notFoundMediaPath,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final topFourMedias = medias.take(4);
    if(medias.length == 1){
      return MultimediaGrid(
        state: topFourMedias.first,
        blobServiceUrl: blobServiceUrl,
        noMediaPath: noMediaPath,
        notFoundMediaPath: notFoundMediaPath,
        aspectRatio: topFourMedias.first.aspectRatio,
        onTap: onTap != null ? () => onTap!(0) : null,
      );
    }
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 1,
        mainAxisSpacing: 1
      ),
      itemCount: topFourMedias.length,
      itemBuilder: (context, index) => Builder(
        builder: (context){
          if(index == 3 && medias.length > 4){
            return Stack(
              alignment:  AlignmentDirectional.center,
              children: [
                MultimediaGrid(
                  state: topFourMedias.elementAt(index),
                  blobServiceUrl: blobServiceUrl,
                  noMediaPath: noMediaPath,
                  notFoundMediaPath: notFoundMediaPath,
                  aspectRatio: 1,
                  onTap: onTap != null ? () => onTap!(index) : null,
                ),
                Container(
                  color: Colors.black.withAlpha(153),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+${medias.length - 4}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            );
          }
          return MultimediaGrid(
            state: topFourMedias.elementAt(index),
            blobServiceUrl: blobServiceUrl,
            noMediaPath: noMediaPath,
            notFoundMediaPath: notFoundMediaPath,
            aspectRatio: 1,
            onTap: onTap != null ? () => onTap!(index) : null,
          );
        }
      )
    );
  }
}
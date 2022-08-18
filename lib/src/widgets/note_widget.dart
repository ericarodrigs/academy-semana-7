import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:algernon/src/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {

  //! Mover para local apropriado
  const NoteWidget({Key? key, required this.note}) : super(key: key);

  //! Usar modelo apropriado
  final note;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        color: AppColors.grey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              margin: EdgeInsets.zero,
              child: Flexible(
                child: Container(
                  decoration: BoxDecoration(
                    color: note.noteColor,
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          note.title,
                          style: TextStyles.white24w700Roboto,
                        ),
                      ),
                    ],
                  ),
                  
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Flexible(
                child: Text(
                  note.description,
                  style: Theme.of(context).textTheme.headline6,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 6,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

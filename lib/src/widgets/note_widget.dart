import 'package:algernon/src/model/note_model.dart';
import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:algernon/src/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';

class NoteWidget extends StatelessWidget {
  //! Mover para local apropriado
  const NoteWidget({Key? key, required this.note}) : super(key: key);

  final NoteModel note;

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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Card(
                  margin: EdgeInsets.zero,
                  child: Flex(direction: Axis.horizontal, children: [
                    Flexible(
                      child: Container(
                        decoration: BoxDecoration(
                          color:
                          AppColors.listColor()[int.parse(note.indexColor)],
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: SizedBox(
                          width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(note.title!,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyles.white16w700Roboto),
                          ),
                        ),
                      ),
                    ),
                  ]),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      note.description!,
                      style: Theme.of(context).textTheme.headline6,
                      softWrap: true,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 4,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Criação: ${note.date}',
                  style: TextStyles.black10w300Roboto,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

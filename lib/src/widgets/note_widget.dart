import 'package:algernon/src/model/note_model.dart';
import 'package:algernon/src/shared/constants/app_colors.dart';
import 'package:algernon/src/shared/constants/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../controller/note_controller.dart';
import '../services/shared_preferences_service.dart';

class NoteWidget extends StatefulWidget {
  const NoteWidget({Key? key, required this.note, required this.action})
      : super(key: key);
  final Function() action;

  final NoteModel note;

  @override
  State<NoteWidget> createState() => _NoteWidgetState();
}

class _NoteWidgetState extends State<NoteWidget> {
  SharedPreferencesService service = SharedPreferencesService();
  late NoteController controller;

  @override
  void initState() {
    controller = NoteController(service);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4.0),
        ),
        color: AppColors.grey,
        child: InkWell(
          onTap: () => Modular.to
            .pushNamed('/empty/new/details/', arguments: widget.note),
          onLongPress: () => showDialog<String>(
            context: context,
            builder: (BuildContext context) => AlertDialog(
              title: const Text('Apagar nota'),
              content: const Text('Tem certeza que deseja apagar?'),
              actions: <Widget>[
                TextButton(
                  onPressed: () => Modular.to.pop(),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => widget.action(),
                  child: const Text('Ok'),
                ),
              ],
            ),
          ),
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
                            color: AppColors.listColor()[
                                int.parse(widget.note.indexColor)],
                            borderRadius: BorderRadius.circular(4.0),
                          ),
                          child: SizedBox(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(widget.note.title!,
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
                        widget.note.description!,
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
                    'Criação: ${widget.note.date}',
                    style: TextStyles.black10w300Roboto,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

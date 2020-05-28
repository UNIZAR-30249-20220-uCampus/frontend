import 'package:async_redux/async_redux.dart';
import 'package:flutter/material.dart';
import 'package:ucampus/core/redux/app_state.dart';
import 'package:ucampus/ui/widgets/home/spaces_carousel.dart';
import 'package:ucampus/core/models/space.dart';

class SpacesCarouselConnector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ViewModel>(
      model: ViewModel(),
      builder: (context, model) => SpacesCarousel(
        spaces: model.spaces
      ),
    );
  }
}

class ViewModel extends BaseModel<AppState> {
  ViewModel();

  List<Space> spaces;

  ViewModel.build({
    @required this.spaces,
  }) : super(equals: [spaces]);

  @override
  BaseModel fromStore() => ViewModel.build(
      spaces: state.featuredSpaces);
}

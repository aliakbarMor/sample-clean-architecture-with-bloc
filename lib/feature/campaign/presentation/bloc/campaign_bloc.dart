import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'campaign_event.dart';
part 'campaign_state.dart';

class CampaignBloc extends Bloc<CampaignEvent, CampaignState> {
  CampaignBloc() : super(CampaignInitial()) {
    on<CampaignEvent>((event, emit) {});
  }
}

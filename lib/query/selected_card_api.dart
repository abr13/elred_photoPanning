import 'dart:convert';

import '../global/global_handler.dart';
import 'model/selected_card_model.dart';

Future<SelectedCardResponse?> postSelectedCardApi(
    context, SelectedCardParams params) async {
  try {
    var response = await GlobalHandler.requestPost(
        "/selectedCardDesignDetails", params.toJson());
    var js = json.decode(response.body);

    SelectedCardResponse res = SelectedCardResponse.fromJson(js);

    return res;
  } catch (e) {
    GlobalHandler.showSnackbar(context, e.toString(), true);
    return null;
  }
}

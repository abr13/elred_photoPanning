import 'package:flutter/material.dart';

import '../query/model/selected_card_model.dart';
import '../query/selected_card_api.dart';

class CardViewViewModel extends ChangeNotifier {
  bool isLoading = false;
  SelectedCardResponse? _selectedCardResponse;

  SelectedCardResponse? get selectedCardResponse => _selectedCardResponse;

  Future<void> getSelectedCard(context, String cardId) async {
    isLoading = true;
    notifyListeners();

    final SelectedCardResponse? response = await postSelectedCardApi(
        context, SelectedCardParams(cardImageId: cardId));
    _selectedCardResponse = response;
    isLoading = false;
    notifyListeners();
  }
}

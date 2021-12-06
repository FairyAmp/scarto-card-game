%checking if card is in hand
function yes_in_hand = card_in_hand(card, hand)
    for i = 1:length(hand)
        if cardEquals(card, hand(i))
            yes_in_hand = 1;
            return
        end
    end
    yes_in_hand = false;
end
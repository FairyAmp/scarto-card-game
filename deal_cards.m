function hands = deal_cards(deck)
    hands.hand1 = repmat(struct('value', 0, 'suit', "", 'points', 0), 25, 1);
    hands.hand2 = repmat(struct('value', 0, 'suit', "", 'points', 0), 25, 1);
    hands.hand3 = repmat(struct('value', 0, 'suit', "", 'points', 0), 25, 1);

    for i = 1:floor(length(deck)/15)
        hands.hand1(i:i+4) = deck(i:i+4);
    end
end
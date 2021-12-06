function equal = card_equals(cardA, cardB)
    if ~strcmp(cardA.suit, cardB.suit) || (cardA.value ~= cardB.value)
        equal = 0;
        return
    end
    equal = 1;
end
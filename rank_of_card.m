function rank = rank_of_card(card)
    if strcmp(card.suit, "swords") || strcmp(card.suit, "batons")
        rank = card.value;
    elseif strcmp(card.suit, "cups") || strcmp(card.suit, "coins")
        if card.value > 10
            rank = card.value;
        else
            rank = 11 - card.value;
        end
    else
        if card.value < 20
            rank = card.value;
        else
            if card.value == 20
                rank = 21;
            elseif card.value == 21
                rank = 20;
                %fool has no rank so function is undefined for fool
            end
        end
    end
end
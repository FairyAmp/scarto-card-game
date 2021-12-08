classdef dealer < player
    %DEALER Summary of this class goes here
    %   DEALER has all attributes of player + extra stuff

    properties
        %Property1
    end

    methods
        

        %check to see if dealer can discard a card
        function discardable = can_discard(dealer_hand, discardCard)

            if discardCard.points == 5
                discardable = 0;
                return
            end
            fool = 22;
            if discardCard.value == fool && strcmp(discardCard.suit, "trump")
                discardable = 0;
                return
            end


            if discardCard.value == 1 && strcmp(discardCard.suit, "trump")

                for i = 1:length(dealer_hand)
                    card = dealer_hand(i);
                    if strcmp(card.suit, "trump") && card.value ~= 1
                        discardable = 0;
                        return
                    end
                end
                discardable = 1;
                return
            end

            if card_in_hand(discardCard, dealer_hand)
                discardable = 1;
                return
            else
                discardable = 0;
                return
            end



        end
    end
end

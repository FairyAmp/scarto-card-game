classdef Dealer < Player
    %DEALER Summary of this class goes here
    %   DEALER has all attributes of player + extra stuff

    properties
        %Property1
    end

    methods
        function deal_cards(obj, player1, player2, deck)
            player1.hand = repmat(Card(-1,""), 25, 1);
            
            player2.hand = repmat(Card(-1,""), 25, 1);
            obj.hand = repmat(Card(-1,""), 28, 1);
            %{
    round 1
        hand 1 gets cards 1-5
        hand 2 gets cards 6-10
        hand 3 gets cards 11-15
    round 2
        hand 1 gets cards 16-20
        hand 2 gets cards 21-25
        hand 3 gets cards 26-30
    round 3
        hand 1 gets cards 31-35
        hand 2 gets cards 36-40
        hand 3 gets cards 41-45
i + 1 = + 15

            %}
            for i = 1:floor(length(deck)/(3*5))
                player1.hand((i*5-4):(i*5)) = deck((i*15-14):(i*15-10));
                player2.hand((i*5-4):(i*5)) = deck((i*15-9):(i*15-5));
                obj.hand((i*5-4):(i*5)) = deck((i*15-4):(i*15));
            end
            obj.hand(26:28) =  deck(76:78);
        end

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

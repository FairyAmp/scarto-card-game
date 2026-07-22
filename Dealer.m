classdef Dealer < Player
    
    %{
     DEALER has all attributes of player + extra stuff

     A dealer is a player with the task of dealing cards.
     In this game, each player is dealt 25 cards
     There will be 3 cards left over, which the dealer takes
     and adds to his own hand.
     Then the dealer chooses 3 cards to "discard" put into his
     own trick/discard pile (the scarto) before play begins
    %}

    properties
        %
    end

    methods
        %deal 5 cards to a player at a time
        function deal_cards(obj, player1, player2, deck)
            player1.hand = repmat(Card(-1,""), 25, 1);
            
            player2.hand = repmat(Card(-1,""), 25, 1);
            obj.hand = repmat(Card(-1,""), 28, 1);
            % considering the remaining 3 cards to be added
            % to the dealer's hand so dealer ends with 28
            %{
deal 5 cards at a time to each player 5 times
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

index is: i + 1 = + 15
    repeat for rounds 4 and 5

            %}
            %had some trouble getting this part right
            for i = 1:floor(length(deck)/(3*5))
                player1.hand((i*5-4):(i*5)) = deck((i*15-14):(i*15-10));
                player2.hand((i*5-4):(i*5)) = deck((i*15-9):(i*15-5));
                obj.hand((i*5-4):(i*5)) = deck((i*15-4):(i*15));
            end
            obj.hand(26:28) =  deck(76:78);
        end

        %need to check and see if dealer can discard a card
        function discardable = can_discard(obj, discardCard)
            %cannot discard cards worth 5 points
            if discardCard.points() == 5
                discardable = false;
                return
            end
            fool = 22; %cannot discard fool
            if discardCard.value == fool && strcmp(discardCard.suit, "trump")
                discardable = false;
                return
            end


            if discardCard.value == 1 && strcmp(discardCard.suit, "trump")
                % can discard trump 1 Magician (il bagatto)
                % only if dealer has no other trumps (includes the Fool)
                for i = 1:length(obj.hand)
                    card = obj.hand(i);
                    if strcmp(card.suit, "trump") && card.value ~= 1
                        discardable = false;
                        return
                    end
                end
                discardable = true;
                return
            end
            %can only discard cards in hand
            if obj.card_in_hand(discardCard)
                discardable = true;
                return
            else
                discardable = false;
                return
            end
        end

        function select_discard(obj)
            fprintf('Select cards to discard.\n');
            obj.print_hand;
            % pick to discard a card
            discard_choices = repmat(Card(-1,""), 3, 1);
            discard_index = 1;
            % using index to refer to the order in which the cards
            % appear in the dealer's hand

            while discard_index <= 3 % display discard option
                x = input("What is the index of the card you would like to discard? ");
                card = obj.hand(x);
                fprintf("You selected %s\n", card.to_string);
                can_discardx = obj.can_discard(card);
                if can_discardx
                    discard_choices(discard_index) = card;
                    discard_index = discard_index + 1;
                else
                    fprintf("You cannot discard that card. Please pick another card.\n");
                end
            end
            % display the discard choices 
            for i = 1:length(discard_choices)
                fprintf("%s\n", discard_choices(i).to_string);
            end
    
            obj.trick_pile = discard_choices;
            
        end
    end
end

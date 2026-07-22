classdef Player < handle & matlab.mixin.Heterogeneous
    %PLAYER 
    %   class for each player in the game

    properties
        hand
        trick_pile
    end

    methods
        %{
        function obj = player(hand)
           
            obj.hand = hand;
        end
        %}
        %checking if a card is in hand
        function yes_in_hand = card_in_hand(obj, card)
            for i = 1:length(obj.hand)
                if card.equals(obj.hand(i))
                    yes_in_hand = true;
                    return
                end
            end
            yes_in_hand = false;
        end

        function outputArg = method1(obj,inputArg)
            outputArg = obj.hand + inputArg;
        end

        %making a method to print player's entire hand
        function print_hand(obj)
            for i = 1:length(obj.hand)
                fprintf("%d:\t%s\n", i, obj.hand(i).to_string);
            end
        end

        %{
        method to dsiplay select a card to play
        first player to play can play any card of any suit.

        Play is counter-clockwise;
        the player to the right of the dealer plays to the first trick.
        Players must follow suit
        otherwise they must play a trump if possible.
        The winner of each trick leads to the next
        until all cards are played.
        %}
        function picked_card = play_card(obj, trick)
            fprintf("Here is your hand.\n");
            obj.print_hand;
            if isempty(trick)
                fprintf("The current trick is empty.\n");
            else
                fprintf("The current trick is\n");
                for i = 1:length(trick)
                    fprintf("%s\n", trick(i).to_string);
                end
            end
            x = input("Please select a card to play in the current trick.\n");
            picked_card = obj.hand(x);
            if isempty(trick)
                obj.hand(x) = [];
                return
            else
                suit = trick(1).suit;
                fprintf(suit);
            end
        end

        %{
        Players must follow suit.

        The fool can be played at any time and excuses a player
        from following suit, but it cannot win any trick.

        After using the fool, the player who played the card
        takes the card and adds it to his own trick pile.

        If there are no cards of the same suit as trick,
        can play any trump.

        If there are no trumps either, can play any card.
        %}
        function playable_cards = get_playable_cards(obj, trick)
            if isempty(trick) %play any card if trick is empty
                playable_cards = repmat(obj.hand, 1);
                return
            else
                suit = trick(1).suit;
                fprintf(suit);
                playable_indices = false(size(obj.hand));
                for index = 1:length(obj.hand)
                    if strcmp(obj.hand(index), suit) %check same suit
                        playable_indices(index) = true;
                    end
                end
                playable_cards = obj.hand(playable_indices);
                if isempty(playable_cards) %check for trump
                    for index = 1:length(obj.hand)
                        if strcmp(obj.hand(index), "trump")
                            playable_indices(index) = true;
                        end
                    end
                    playable_cards = obj.hand(playable_indices);
                end
                if isempty(playable_cards) %play any card if no playable cards in hand
                    playable_cards = repmat(obj.hand, 1);
                    return
                end
            end
        end

    end
end


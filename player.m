classdef player < handle
    %PLAYER Summary of this class goes here
    %   Detailed explanation goes here

    properties
        hand
        trick_pile
    end

    methods
        %{
        function obj = player(hand)
            %PLAYER Construct an instance of this class
            %   Detailed explanation goes here
            obj.hand = hand;
        end
        %}
        %checking if card is in hand
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
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.hand + inputArg;
        end
    end
end


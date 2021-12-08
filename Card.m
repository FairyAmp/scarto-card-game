classdef Card
    %CARD Summary of this class goes here
    %   Detailed explanation goes here

    properties
        value
        suit
    end

    methods
        function obj = Card(value, suit)
            %CARD Construct an instance of this class
            %   Detailed explanation goes here
            obj.value = value;
            obj.suit = suit;
        end

        function outputArg = equals(cardA,cardB)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            if ~strcmp(cardA.suit, cardB.suit) || (cardA.value ~= cardB.value)
                outputArg = false;
                return
            end
            outputArg = true;
        end
        function output = rank(obj)
            if strcmp(obj.suit, "swords") || strcmp(obj.suit, "batons")
                output = obj.value;
            elseif strcmp(obj.suit, "cups") || strcmp(obj.suit, "coins")
                if obj.value > 10
                    output = obj.value;
                else
                    output = 11 - obj.value;
                end
            else
                if obj.value < 20
                    output = obj.value;
                else
                    if obj.value == 20
                        output = 21;
                    elseif obj.value == 21
                        output = 20;
                        %fool has no rank so function is undefined for fool
                    end
                end
            end
        end
    end
end


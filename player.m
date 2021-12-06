classdef player
    %PLAYER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        hand
        trick_pile
    end
    
    methods
        function obj = player(hand)
            %PLAYER Construct an instance of this class
            %   Detailed explanation goes here
            obj.hand = hand;
        end
        
        function outputArg = method1(obj,inputArg)
            %METHOD1 Summary of this method goes here
            %   Detailed explanation goes here
            outputArg = obj.hand + inputArg;
        end
    end
end


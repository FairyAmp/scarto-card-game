classdef Card
    %CARD trump names
    %{
the Angel "l'angelo" (20),
the World "il mondo" (21),
the Sun "il sole" (19),
the Moon "la luna" (18),
the Star "le stelle" (17),
the Tower "la torre" (16),
the Devil "il diavolo" (15),
Temperance "la temperenza" (14),
Death "la morte" (13),
the Hanged Man "l'appeso" (12),
Strength "la forza" (11),
the Wheel of Fortune "rota di fortuna" (10),
the Hermit "l'eremita" (9),
Justice "la giustizia" (8),
the Chariot "il carro" (7),
the Lovers "gli amanti" (6),
the Pope "il papa" (5),
the Emperor "l'imperatore" (4),
the Empress "l'imperatrice" (3),
the Popess "la papessa" (2),
and the Pagat "il bagatto" (1).
    %}

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
        function s = to_string(obj)
            if strcmp(obj.suit, "trump")
                s = obj.trump_string;
            else
                s = obj.value_string + " of " + obj.suit;
            end
        end
        function s = trump_string(obj)
            if obj.value == 1
                s = "I The Magician";
            elseif obj.value == 2
                s = "II High Priestess";
            elseif obj.value == 3
                s = "III The Empress";
            elseif obj.value == 4
                s = "IV The Emperor";
            elseif obj.value == 5
                s = "V The Hierophant";
            elseif obj.value == 6
                s = "VI The Lovers";
            elseif obj.value == 7
                s = "VII The Chariot";
            elseif obj.value == 8
                s = "VIII Justice";
            elseif obj.value == 9
                s = "IX The Hermit";
            elseif obj.value == 10
                s = "X The Wheel of Fortune";
            elseif obj.value == 11
                s = "XI Strength";
            elseif obj.value == 12
                s = "XII The Hanged Man";
            elseif obj.value == 13
                s = "XII Death";
            elseif obj.value == 14
                s = "XIV Temperance";
            elseif obj.value == 15
                s = "XV The Devil";
            elseif obj.value == 16
                s = "XVI The Tower";
            elseif obj.value == 17
                s = "XVII The Stars";
            elseif obj.value == 18
                s = "XVIII The Moon";
            elseif obj.value == 19
                s = "XIX The Sun";
            elseif obj.value == 20
                s = "XX Judgement";
            elseif obj.value == 21
                s = "XXI The World";
            elseif obj.value == 22
                s = "0 The Fool";
            end
        end
        function s = value_string(obj)
            if obj.value < 11
                s = string(obj.value);
            else
                face_cards = ["Knave", "Cavalier", "Queen", "King"];
                s = face_cards(obj.value-10);
            end
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
        function point_output = points(obj)
            king = 14;
            queen = 13;
            fool = 22;
            cavallo = 12;
            knave = 11;
            if (obj.value == king)
                point_output = 5;
            elseif strcmp(obj.suit, "trump") && (obj.value == 1 || obj.value == 20)
                point_output = 5;
            elseif obj.value == queen || obj.value == fool
                point_output = 4;
            elseif obj.value == cavallo
                point_output = 3;
            elseif obj.value == knave
                point_output = 2;
            else
                point_output = 1;
            end

        end
    end
end


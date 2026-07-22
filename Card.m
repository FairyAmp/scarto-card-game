classdef Card
    %{
    cards in this game have 4 suits:
    round suits: cups (coppe) and coins (denari)
    long suits: batons (bastoni) and swords (spade)
    and also a set of cards called trumps
    which can be considered as their own "suit"

    Note: people who use tarot for divination
          call the 4 suits "minor arcana"
          and the trumps "major arcana"

    %CARD trump names
    
Note: using the english names of the cards used by tarot readers
since these names are more familiar to most people

Ranking of trumps:

NOTE: trump 20 ranks higher than 21 in this game
in other trick taking tarot games, 21 is higher

the Angel "l'angelo" (20),
the World "il mondo" (21),
the Sun "il sole" (19),
the Moon "la luna" (18),
the Stars "le stelle" (17),
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
the Pope or Hierophant "il papa" (5),
the Emperor "l'imperatore" (4),
the Empress "l'imperatrice" (3),
the Popess or priestess "la papessa" (2),
and the Pagat (magician in some other decks) "il bagatto" (1).
    %}

    properties
        value
        suit
    end

    methods
        function obj = Card(value, suit)
            % all cards
            % take a value and a suit
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
        %{
        will use english names
        since most english speakers
        wont know the italian
        %}
        function Trump = trump_string(obj)
            if obj.value == 1
                Trump = "I The Magician";
            elseif obj.value == 2
                Trump = "II High Priestess";
            elseif obj.value == 3
                Trump = "III The Empress";
            elseif obj.value == 4
                Trump = "IV The Emperor";
            elseif obj.value == 5
                Trump = "V The Hierophant";
            elseif obj.value == 6
                Trump = "VI The Lovers";
            elseif obj.value == 7
                Trump = "VII The Chariot";
            elseif obj.value == 8
                Trump = "VIII Justice";
            elseif obj.value == 9
                Trump = "IX The Hermit";
            elseif obj.value == 10
                Trump = "X The Wheel of Fortune";
            elseif obj.value == 11
                Trump = "XI Strength";
            elseif obj.value == 12
                Trump = "XII The Hanged Man";
            elseif obj.value == 13
                Trump = "XII Death";
            elseif obj.value == 14
                Trump = "XIV Temperance";
            elseif obj.value == 15
                Trump = "XV The Devil";
            elseif obj.value == 16
                Trump = "XVI The Tower";
            elseif obj.value == 17
                Trump = "XVII The Stars";
            elseif obj.value == 18
                Trump = "XVIII The Moon";
            elseif obj.value == 19
                Trump = "XIX The Sun";
            elseif obj.value == 20
                Trump = "XX Judgement";
            elseif obj.value == 21
                Trump = "XXI The World";
            elseif obj.value == 22
                Trump = "0 The Fool";
                %fool has no number, can be considered the 22nd trump
            end
        end
        function card_val = value_string(obj)
            if obj.value < 11
                card_val = string(obj.value);
            else
                face_cards = ["Jack", "Cavalier", "Queen", "King"];
                card_val = face_cards(obj.value-10);
                %subtract 10 to account for the 14 cards in suit
            end
        end
        function outputArg = equals(cardA,cardB)
            %need to determine if two cards are equal
            
            if ~strcmp(cardA.suit, cardB.suit) || (cardA.value ~= cardB.value)
                outputArg = false;
                return
            end
            outputArg = true;
        end

        %{
        Note: The order of the long suits (swords and batons)
        goes from King, Queen, Cavallo (cavalier), Knave (jack), 10, ..., 1
        Long suits: K Q C J 10 9 8 7 6 5 4 3 2 1

        The order of the round suits (cups and coins)
        goes from King, Queen, Cavalier, Jack, 1, ..., 10
        Round suits: K Q C J 1 2 3 4 5 6 7 8 9 10
        
        Trump 20 outranks Trump 21 like in most Piemontese games
        Trump suit: 20, 21, 19, ..., 1
        %}
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

        %{
        Points gained by each card in trick pile:
        Kings and Trumps 1 and 20: 5 points
        Queens and the Fool: 4 points
        Cavallo
 (Cavaliers/Knights): 3 points
        Knaves (Jacks): 2 points
        All other cards: 1 point
        %}
        function point_output = points(obj)
            king = 14;
            queen = 13;
            fool = 22;
            cavallo = 12;
            jack = 11;
            if (obj.value == king)
                point_output = 5;
            elseif strcmp(obj.suit, "trump") && (obj.value == 1 || obj.value == 20)
                point_output = 5;
            elseif obj.value == queen || obj.value == fool
                point_output = 4;
            elseif obj.value == cavallo
                point_output = 3;
            elseif obj.value == jack
                point_output = 2;
            else
                point_output = 1;
            end

        end
    end
end


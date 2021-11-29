

function [deck] = generate_deck()
    %{
        78 cards total
        trumpsuit of 22 cards
        56 (four 14 card suits of swords battons cups coins)
        face cards: king queen cavalier jack
    the game
  
http://gambiter.com/cards/Scarto.html


  the deck
  
http://gambiter.com/cards/Tarocco_piemontese.html


  78 cards total:
  22. trump suit, including the fool
  56. 4 14 card suits of swords batons cups coins

  for display, trump and pip cards have arabic
  numerals or roman numerals
  face cards are king queen cavalier jack 
    %}
    
    deck = repmat(struct('value', 0, 'suit', "", 'points', 0), 78, 1);
    index = 1;

    king = 14;
    queen = 13;
    fool = 1;
    cavallo = 12;
    jack = 11;

    for suit = ["swords", "batons", "cups", "coins"]
        for value = 1:14
            card.value = value;
            card.suit = suit;
            if (card.value == king)
                card.points = 5;
            elseif (card.value == queen)
                card.points = 4;
            elseif (card.value == cavallo)
                card.points = 3;
            elseif (card.value == jack)
                card.points = 2;
            else
                card.points = 1;
            end
            deck(index) = card;
            index = index + 1;
        end
    end
    for value = 1:22
        card.suit = "trump";
        card.value = value;
        if card.value == fool
            card.points = 4;
        else
            card.points = 5;
        end
        deck(index) = card;
        index = index + 1;
    end
%{
    for index = 1:length(deck)
        card = deck(index);
        %strcmp returns 1 if they are equal in matlab
        if (strcmp(card.suit, "trump") && card.value ~= fool) || (card.value == king)
            card.points = 5;
            "hello1"
        elseif (~strcmp(card.suit, "trump")) && (card.value == queen)
            card.points = 4;
            "hello2"
        elseif (~strcmp(card.suit, "trump")) && card.value == fool
            card.points = 4;
            "hello3"
        elseif (~strcmp(card.suit, "trump")) && (card.value == cavallo)
            card.points = 3;
            "hello4"
        elseif (~strcmp(card.suit, "trump")) && (card.value == jack)
            card.points = 2;
            "hello5"
        else
            card.points = 1;
            "hello6"
        end
    end
%}
end
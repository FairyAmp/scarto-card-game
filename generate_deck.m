

function [deck] = generate_deck()
    %{
        78 cards total
        trumpsuit of 22 cards
        56 (four 14 card suits of swords battons cups coins)
        face cards: king queen cavalier jack (knave)

   check link below for the game description
  
http://gambiter.com/cards/Scarto.html


  the deck description
  
http://gambiter.com/cards/Tarocco_piemontese.html


  78 cards total:
  22. trump suit, including the fool
  56. four 14 card suits of swords batons cups coins

  for display, trump and pip cards have arabic
  numerals or roman numerals
  face cards are king, queen, cavalier/knight, jack 
    %}
    
    deck = repmat(Card(0,""), 78, 1);
    index = 1;

    for suit = ["swords", "batons", "cups", "coins"]
        for value = 1:14 % 14 cards in each suit
            card = Card(value,suit);
            deck(index) = card;
            index = index + 1;
        end
    end

    for value = 1:22 % 22 trumps (including the fool)
        deck(index) = Card(value, "trump");
        index = index + 1;
    end

end

% a matrix with 78 entries (one for each card) would probably run faster
% but this is less tedious than manually inputting 78 entries into a matrix


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
    
    deck = repmat(Card(0,""), 78, 1);
    index = 1;

    for suit = ["swords", "batons", "cups", "coins"]
        for value = 1:14
            card = Card(value,suit);
            deck(index) = card;
            index = index + 1;
        end
    end

    for value = 1:22
        deck(index) = Card(value, "trump");
        index = index + 1;
    end

end
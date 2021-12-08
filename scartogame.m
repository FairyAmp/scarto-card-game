deck1 = shuffle_deck(generate_deck());
dealer = Dealer;
player1 = Player;
player2 = Player;
dealer.deal_cards(player1, player2, deck1);


%{
disp(deck1(59))

hands = deal_cards(shuffle_deck(deck1));

dealer.hand = hands.dealer;
%}
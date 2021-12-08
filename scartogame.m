deck1 = shuffle_deck(generate_deck());
dealer_ = dealer;
player1 = player;
player2 = player;
dealer_.deal_cards(player1, player2, deck1);


%{
disp(deck1(59))

hands = deal_cards(shuffle_deck(deck1));

dealer.hand = hands.dealer;
%}
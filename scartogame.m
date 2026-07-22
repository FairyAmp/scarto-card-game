deck1 = shuffle_deck(generate_deck());
dealer = Dealer;
player1 = Player;
player2 = Player;
dealer.deal_cards(player1, player2, deck1);

dealer.select_discard;

players = [player1, player2, dealer];
player_index = 1;

current_player = players(player_index);
current_trick = [];
current_player.play_card(current_trick);




%{
disp(deck1(59))

hands = deal_cards(shuffle_deck(deck1));

dealer.hand = hands.dealer;
%}
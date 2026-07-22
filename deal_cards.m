function hands = deal_cards(deck)
    hands.hand1 = repmat(struct('value', 0, 'suit', "", 'points', 0), 25, 1);
    hands.hand2 = repmat(struct('value', 0, 'suit', "", 'points', 0), 25, 1);
    hands.dealer = repmat(struct('value', 0, 'suit', "", 'points', 0), 28, 1);
%{
    round 1
        hand 1 gets cards 1-5
        hand 2 gets cards 6-10
        hand 3 gets cards 11-15
    round 2
        hand 1 gets cards 16-20
        hand 2 gets cards 21-25
        hand 3 gets cards 26-30
    round 3
        hand 1 gets cards 31-35
        hand 2 gets cards 36-40
        hand 3 gets cards 41-45
i + 1 = + 15
Took some time to get this part right
%}
    for i = 1:floor(length(deck)/(3*5))
        hands.hand1((i*5-4):(i*5)) = deck((i*15-14):(i*15-10));
        hands.hand2((i*5-4):(i*5)) = deck((i*15-9):(i*15-5));
        hands.dealer((i*5-4):(i*5)) = deck((i*15-4):(i*15));
    end
    hands.dealer(26:28) =  deck(76:78);
    %accounting for the three remaining cards the dealer discards
end
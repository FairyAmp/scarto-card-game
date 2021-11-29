function shuffled_cards = shuffle_deck(deck)
    p = randperm(length(deck));
    shuffled_cards = deck(p);
end
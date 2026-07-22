from scarto import generate_deck

deck = generate_deck()
expected = 78
actual = len(deck)
if expected != actual:

    print(f'{expected = }')
    print(f'{actual = }')

suits = [card.suit for card in deck]
suits = sorted(list(set(suits)))
expected = ['bastoni', 'coppe', 'denari', 'spade', 'trumps']
actual = suits
if actual != expected:
    
    print(f'{expected = }')
    print(f'{actual = }')

normal_suits = ['bastoni', 'coppe', 'denari', 'spade']
for suit in normal_suits:
    cards_of_suit = [card for card in deck if card.suit == suit]
    actual = len(cards_of_suit)
    expected = 14
    if actual != expected:
        print('-'*80)
        print(f'{expected = }')
        print(f'{actual = }')
        print('-'*80)

trumps = [card for card in deck if card.suit == 'trumps']
expected = 22
actual = len(trumps)
if actual != expected:
    print('-'*80)
    print(f'{expected = }')
    print(f'{actual = }')
    print('-'*80)

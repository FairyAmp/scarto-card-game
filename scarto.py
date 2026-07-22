import random
from card import Card

def generate_deck():
    #depends on card
    '''
        78 cards total
        trumpsuit of 22 cards
        56 (four 14 card suits of swords(spade) battons(bastoni) cups(coppe)
        coins (denari))
        face cards: king (re) queen (donna)
        cavalier (cavallo) jack (fante)
        '''
    
    deck = []
    for suit in ['spade', 'bastoni', 'denari', 'coppe']:
        for value in range(1,14+1):
            card = Card(value, suit)
            deck.append(card)
    for value in range(1, 22+1):
        deck.append(Card(value, 'trumps'))
    return deck
        
    

def shuffle_deck(deck):
    shuffled_cards = deck[:]
    random.shuffle(shuffled_cards)
    return shuffled_cards


  #write tests for dealer

#def deal_cards(deck):
  #  for i in 




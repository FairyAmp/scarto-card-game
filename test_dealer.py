from player import Player
from card import Card
import traceback, sys
from scarto import generate_deck
from dealer import Dealer
from pprint import pprint

def full_stack():
    exc = sys.exc_info()[0]
    stack = traceback.extract_stack()[:-2]  # last one would be full_stack()
    if exc is not None:  # i.e. an exception is present
        del stack[-1]       # remove call of full_stack, the printed exception
                            # will contain the caught exception caller instead
    trc = 'Traceback (most recent call last):\n'
    stackstr = trc + ''.join(traceback.format_list(stack))
    if exc is not None:
         stackstr += '  ' + traceback.format_exc().lstrip(trc)
    return stackstr

def check_equal(expected, actual):
    if actual != expected:
        print('-'*72)
        print(f'{expected = }')
        print(f'{actual = }')
        print(full_stack())
        print('-'*72) 

deck = generate_deck()
player0 = Player()
player1 = Player()
dealer = Dealer()

dealer.deal_cards(player0, player1, deck)

##print('player0.hand')
##pprint(player0.hand)
##print('player1.hand')
##pprint(player1.hand)
##print('dealer.hand')
##pprint(dealer.hand)

#check each player gets 25 cards and dealer has 28

check_equal(25, len(player0.hand))
check_equal(25, len(player1.hand))
check_equal(28, len(dealer.hand))

#TODO test Dealer#can_discard

player0_set = set(player0.hand)
player1_set = set(player1.hand)
dealer_set = set(dealer.hand)

check_equal(player0_set, player0_set - player1_set - dealer_set)
check_equal(player1_set, player1_set - player0_set - dealer_set)
check_equal(dealer_set, dealer_set - player0_set - player1_set)

#translate starting at line 9 of scartogame.m into python

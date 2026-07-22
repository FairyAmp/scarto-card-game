from player import Player
from card import Card
import traceback, sys

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

player = Player()
card = Card(1,'denari')
player.hand.append(card)
trick = [Card(2, 'denari')]

#get playable cards


check_equal([card], player.get_playable_cards([]))
check_equal([card], player.get_playable_cards([Card(2, 'denari')]))

fool = Card(22, 'trumps')
player.hand.append(fool)
check_equal([card, fool], player.get_playable_cards([Card(2, 'denari')]))

player.hand = [Card(1, 'denari'), Card(1, 'trumps'), Card(2, 'trumps'), fool]

check_equal([Card(1, 'trumps'), Card(2, 'trumps'), fool],
            player.get_playable_cards([Card(2, 'coppe')]))

player.hand = [card]
check_equal([card], player.get_playable_cards([Card(2, 'coppe')]))

##expected = True
##actual = card in player.hand
###player.card_in_hand(card)
##if actual != expected:
##    print('-'*80)
##    print(f"{card} should be in player's hand")
##    print(f'{expected = }')
##    print(f'{actual = }')
##    print('-'*80)


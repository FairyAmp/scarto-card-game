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
    

card = Card(1, "trumps")
check_equal('card = I il Bagatto', f'{card = }')

card = Card(3, "coppe")
check_equal('card = 3 of coppe', f'{card = }')


##expected = 'card = I il Bagatto'
##actual = f'{card = }'

    
##if expected != actual:
##    print()
##    print(f'{expected = }')
##    print(f'{actual = }')
##
##card = Card(11, "denari")
##expected = 'card = Fante of denari'
##actual = f'{card = }'
##if expected != actual:
##    print()
##    print(f'{expected = }')
##    print(f'{actual = }')


##
##card = Card(10, "denari")
##print(f'{card = }')
##
##card0 = Card(1, 'trumps')
##print(f'{card0 = }')
##
##card1 = Card(1, 'trumps')
##print(f'{card0 = }')
##
##if card1 == card0:
##    print('they are equal')
##else:
##    print('they are not equal')
##card = Card(1, 'trumps')
##print(f'{card} rank is {card.rank()}')

card = Card(1, 'swords')
#print(f'{card} rank is {card.rank()}')
check_equal(1, card.rank())

card = Card(10, 'coppe')
#print(f'{card} rank is {card.rank()}')
check_equal(1, card.rank())

card2 = Card(1, "denari")
#print(f'{card2} rank is {card2.rank()}')
check_equal(1, card.rank())

card = Card(20, 'trumps')
#print(f'{card} rank is {card.rank()}')
check_equal(21, card.rank())

card = Card(21, 'trumps')
#print(f'{card} rank is {card.rank()}')
check_equal(20, card.rank())

card = Card(14, 'coppe')
#print(f'{card} point value is {card.points()}')
check_equal(5, card.points())

card = Card(1, 'trumps')
##print(f'{card} point value is {card.points()}')
check_equal(5, card.points())

card = Card(13, 'coppe')
##print(f'{card} point value is {card.points()}')
check_equal(4, card.points())

card = Card(1, 'coppe')
##print(f'{card} point value is {card.points()}')
check_equal(1, card.points())

card = Card(22, 'trumps')
##print(f'{card} point value is {card.points()}')
check_equal(4, card.points())

card = Card(12, 'coppe')
##print(f'{card} point value is {card.points()}')
check_equal(3, card.points())

card = Card(11, 'coppe')
##print(f'{card} point value is {card.points()}')
check_equal(2, card.points())

card = Card(10, 'coppe')
##print(f'{card} point value is {card.points()}')
check_equal(1, card.points())

from card import Card
from tkinter import *
from tkinter import ttk

class Player:
    def __init__(self):
        self.hand = []
        self.trick_pile = []

##    def card_in_hand(self, card):
##        return card in self.hand
        #use this instead
        #card in player.hand
    
    def hand_string(self):
        result = ""
        for index, card in enumerate(self.hand):
            result += str(index) + ": " + card.__repr__() + "\n"
        return result

    def print_hand(self):
        print(self.hand_string())

    def play_card(self, trick):
        print("Here is your hand:\n")
        self.print_hand()
        if trick:
            print("The current trick is")
            for card in trick:
                print(card)
        else:
             print("The current trick is empty")

        print("Please select a card to play in the current trick.")
        hand_index = int(input())
        picked_card = self.hand[hand_index]
        if trick:
            #Todo
            #test out this branch
            #make sure player picks a card of the correct suit
            #based on the suit of the trick
            #and the suit in hand
            suit = trick[0].suit
            print(f'{suit = }')
        else:
            self.hand = self.hand[:hand_index] + self.hand[hand_index+1:]

        return picked_card
    
    def get_playable_cards(self, trick):
        if trick:
            suit = trick[0].suit
            playable_cards = filter(lambda card: card.suit == suit, self.hand)
            playable_cards = list(playable_cards)
            #when there are cards of the same suit as trick
            if playable_cards:
                #if the fool (il matto) in hand, add it to list of all playable
                fool = Card(22, 'trumps')
                if fool in self.hand and fool not in playable_cards:
                    playable_cards += [fool]
                return playable_cards 

            #play a trump if no cards in hand are the same suit
            else:
                #collect all trumps
                trumps_in_hand = filter(lambda card: card.suit == 'trumps',
                                        self.hand)
                trumps_in_hand = list(trumps_in_hand)
                # play anything if there's no trump either
                if trumps_in_hand:
                    return trumps_in_hand
                else:
                    return self.hand[:]
        else:
            return self.hand[:]
        #write tests for this in test_player
        #create a player, give it a trick, make sure it returns

        

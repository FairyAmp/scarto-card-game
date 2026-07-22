import math

from player import Player

class Dealer(Player):
#TO DO: test out function to see if it works
    def deal_cards(self, player0, player1, deck):
        
        hands = [player0.hand, player1.hand, self.hand]
        round_hand_size = 5
        round_size = len(hands) * round_hand_size

        for round_num in range(len(deck) // round_size):
            for hand_index, hand in enumerate(hands):
              lower_bound = round_num * round_size + (round_hand_size *
                                                      hand_index)
              upper_bound = lower_bound + round_hand_size
              hand += deck[lower_bound : upper_bound]
                
    ##        hand = hands[0]
    ##        lower_bound = i * round_size + (round_hand_size * 0)
    ##        upper_bound = i * round_size + (round_hand_size * 1)
    ##        hand.append(deck[lower_bound : upper_bound])
    ##        
    ##        hand = hands[1]
    ##        lower_bound = i * round_size + (round_hand_size * 1)
    ##        upper_bound = i * round_size + round_hand_size * (1 + 1))
    ##        hand.append(deck[lower_bound : upper_bound])
    ##        
    ##        hand = hands[2]
    ##        lower_bound = i * round_size + (round_hand_size * 2)
    ##        upper_bound = i * round_size + round_hand_size * (2 + 1))
    ##        hand.append(deck[lower_bound : upper_bound])
        # hands.dealer(26:28) =  deck(76:78);
        self.hand += deck[75:78]

        #write tests for deal cards



    

    def select_discard(self):
        #TODO revisit this when making a GUI version
        discard_choices = []

        while len(discard_choices) < 3:
            print('Please select a card to discard.');
            self.print_hand()
            prompt = "What is the index of the card you would like to discard?"

            x = int(input(prompt))
            card = self.hand[x]
            
            print(f"You selected {card}\n")

            can_discard_x = self.can_discard(card)
            if can_discard_x:
                discard_choices.append(card)
                del self.hand[x]
            else:
                print("You cannot discard that card. Please pick another card.")

        print("You discarded the following: ")
        for discard_card in discard_choices:
            print(discard_card)

        self.trick_pile.append(discard_choices)


    def can_discard(self, discardCard):

        if discardCard.points() == 5:
            return False
        
        fool = 22
        
        if discardCard.value == fool and discardCard.suit == "trumps":
            return False

        if discardCard.value == 1 and discardCard.suit != "trumps":
            for card in self.hand:
                if card.suit == "trumps" and card.value != 1:
                    return False
            return True
##            for i in range(length(self.hand)):
##                card = self.hand[i]

        
#can only discard cards that are in hand
        return discardCard in self.hand
##        return self.card_in_hand(discardCard)
##    
##    def card_in_hand(self, card):
##        return card in self.hand



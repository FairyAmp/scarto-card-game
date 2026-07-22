class Card:
    def __init__(self, value, suit):
        self.value = value
        self.suit = suit
        
    def __repr__(self):
        if self.suit == "trumps":
            return self.trump_string()
        else:
            return f'{self.value_string()} of {self.suit}'

    def __hash__(self):
        return 0
        
    def trump_string(self):
        trump_strings = [
            "I il Bagatto",
            "II la Papessa",
            "III l'Imperatrice",
            "IV l'Imperatore",
            "V il Papa",
            "VI gli Amanti",
            "VII il Carro",
            "VIII la Giustizia",
            "IX l'Eremita",
            "X Rota di Fortuna",
            "XI la Forza",
            "XII l'Appeso",
            "XII la Morte",
            "XIV la Temperenza",
            "XV il Diavolo",
            "XVI la Torre",
            "XVII le Stelle",
            "XVIII le Luna",
            "XIX il Sole",
            "XX l'Angelo",
            "XXI il Mondo",
            "0 il Matto"
        ]
        return trump_strings[self.index()]

    def index(self):
        return self.value - 1
    
    def value_string(self):
        if self.value < 11:
            return str(self.value)
        else:
            face_cards = ["Fante", "Cavallo", "Donna", "Re"]
            return face_cards[self.index()-10]

    def __eq__(self, other):
        return self.suit == other.suit and self.value == other.value

    def rank(self):
        #if self.suit == "spade" or self.suit == "bastoni":
        if self.suit in ["spade", "bastoni"]:
            return self.value
        #elif self.suit == "coppe" or self.suit == "denari":
        elif self.suit in ["coppe", "denari"]:
            if 10 < self.value:
                return self.value
            else:
                return 11 - self.value
        else:
            if self.value < 20:
                return self.value
            else:
                #trump 20 is greater than 21
                #il Mondo has lower rank than l'Angelo in this game
                if self.value == 20:
                    return 21
                elif self.value == 21:
                    return 20                

    def points(self):
        re = 14
        donna = 13
        fool = 22
        cavallo = 12
        fante = 11
        if self.value == re:
            return 5
        elif self.suit == 'trumps' and self.value in [1, 20]:
            return 5
        elif self.value in [donna, fool]:
            return 4
        elif self.value == cavallo:
            return 3
        elif self.value == fante:
            return 2
        else:
            return 1

# Scarto: Tarot Card Game Implementation

A custom implementation of **Scarto**, a traditional Italian 3-player tarot trick-taking card game played with a 78-card *Tarocco Piemontese* deck. 

This repository contains the original game engine prototyped in **MATLAB**, along with an active migration/translation to **Python**.

This was originally built in 2021 as an experiment in MATLAB and Python. It is currently unfinished, but the source code is made available here for anyone interested in the algorithms or porting it further.

---

## 📌 Game Overview & Rules

* **Players:** 3
* **Deck:** 78-Card Tarocco Piemontese (21 Trumps / *Trionfi*, 1 Fool / *Il Matto*, and 4 Suits)
* **Mechanics:** Trick-taking, trumping, bidding, and card point valuation.

---

## 🚧 Project Status

> **Status:** Work in Progress (WIP)
>
> The original logic was prototyped in MATLAB to validate deck generation, shuffling, and core player mechanics. The project is currently being translated and refactored into modular, object-oriented **Python**.

### Feature Checklist
- [x] 78-Card Deck Generation & Shuffling
- [x] Dealing Mechanics (`Dealer` class)
- [x] Object-Oriented Player & Card Modules
- [x] Python Unit Test Suite (`pytest`/`unittest`)
- [ ] Complete Trick-Taking Logic & Game Loop
- [ ] Scoring & Card Point Valuation System

---

## 🛠️ Repository Structure

```text
.
├── matlab/                 # Original MATLAB implementation & scripts
│   ├── Card.m
│   ├── Dealer.m
│   ├── Player.m
│   ├── deal_cards.m
│   ├── generate_deck.m
│   ├── scartogame.m
│   └── shuffle_deck.m
├── python/                 # Refactored Python implementation
│   ├── card.py
│   ├── dealer.py
│   ├── player.py
│   └── scarto.py
├── tests/                  # Python unit tests
│   ├── test_card.py
│   ├── test_dealer.py
│   └── test_player.py
└── README.md

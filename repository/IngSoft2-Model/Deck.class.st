Class {
	#name : #Deck,
	#superclass : #Object,
	#instVars : [
		'idForCard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Deck class >> create [
	^ self new initializeWith
]

{ #category : #'as yet unclassified' }
Deck >> giveACard [
    | aCard randomValue cardMapping |
    cardMapping := {
        1 -> Speed.
        2 -> Mercenary.
        3 -> Acceleration.
        4 -> Cancellation.
        5 -> Redo.
        6 -> Repeat.
		  7 -> Double.
        8 -> Freedom.
		  9 -> Reverse.
		  10 -> Skip.
    } asDictionary.
    randomValue := #(1 2 3 4 5 6 7 8 9 10) atRandom.
    aCard := (cardMapping at: randomValue) createWithId: idForCard.
	 idForCard := idForCard + 1.
    
    ^ aCard

]

{ #category : #initialization }
Deck >> initializeWith [
	idForCard := 1
]

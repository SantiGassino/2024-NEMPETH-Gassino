Class {
	#name : #Skip,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Skip >> applyCardEffect: aCardArguments and: aGame [ 

	aGame skipActualTurn.
]

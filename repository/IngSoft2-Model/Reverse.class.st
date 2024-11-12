Class {
	#name : #Reverse,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Reverse >> applyCardEffect: aCardArguments and: aGame [ 

	aGame useSpaceshipsManagerTo reverseSpaceshipsTurns.
	
]

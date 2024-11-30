Class {
	#name : #Unlock,
	#superclass : #LockState,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
Unlock >> isSpaceshipLock [ 

	^ false.
]

{ #category : #'as yet unclassified' }
Unlock >> move: aSpaceship and: positionsToMoveByDices and: extraMovements [

	 aSpaceship requestUpdatePosition: positionsToMoveByDices + extraMovements.
]

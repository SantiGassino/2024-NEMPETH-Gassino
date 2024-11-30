Class {
	#name : #Unlock,
	#superclass : #LockState,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Unlock >> move: aSpaceship and: positionsToMoveByDices and: extraMovements [

	 aSpaceship requestUpdatePosition: positionsToMoveByDices + extraMovements.
]

{ #category : #'as yet unclassified' }
Unlock >> updateStateOfLocking: lockAmount [

	^ Lock create. 
]

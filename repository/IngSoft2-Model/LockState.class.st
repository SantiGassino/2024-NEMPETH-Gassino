Class {
	#name : #LockState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
LockState >> move: aSpaceship and: positionsToMoveByDices and: extraMovements [

	^ self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
LockState >> updateStateOfLocking: lockAmount [

	^ self subclassResponsibility.
]

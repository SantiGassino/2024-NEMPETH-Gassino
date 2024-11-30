Class {
	#name : #LockState,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #testing }
LockState >> isSpaceshipLock [ 

	^ self subclassResponsibility.
]

{ #category : #'as yet unclassified' }
LockState >> move: aSpaceship and: positionsToMoveByDices and: extraMovements [

	^ self subclassResponsibility.
]

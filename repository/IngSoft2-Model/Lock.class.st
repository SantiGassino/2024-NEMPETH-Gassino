Class {
	#name : #Lock,
	#superclass : #LockState,
	#instVars : [
		'dicesAmount'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Lock class >> create [
	
	^ self new initializeWith.
]

{ #category : #'as yet unclassified' }
Lock >> getAmountOfDices [

	^ dicesAmount.
]

{ #category : #'as yet unclassified' }
Lock >> initializeWith [

	dicesAmount := 0.
]

{ #category : #'as yet unclassified' }
Lock >> isSpaceshipLock [

	^ true.
]

{ #category : #'as yet unclassified' }
Lock >> move: aSpaceship and: positionsToMoveByDices and: extraMovements [

    self saveDicesThrow: positionsToMoveByDices.
]

{ #category : #'as yet unclassified' }
Lock >> saveDicesThrow: aDicesAmount [

	dicesAmount := aDicesAmount.
]

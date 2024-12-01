Class {
	#name : #LockBox,
	#superclass : #Box,
	#instVars : [
		'lockAmount'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LockBox class >> createWith: values [
	
	^self subclassResponsibility.
]

{ #category : #accessing }
LockBox >> applyEffect: spaceships and: actualSpaceship [

	self evaluatePrisioner: actualSpaceship.
]

{ #category : #accessing }
LockBox >> evaluateBattle: aSpaceshipManager and: actualSpaceship and: aGame [

	^ aGame.
]

{ #category : #accessing }
LockBox >> evaluatePrisioner: aSpaceship [

	aSpaceship requestUpdateStateOfLocking: lockAmount.
]

{ #category : #'as yet unclassified' }
LockBox >> getActualEffect [ 

	^ NormalBox new.
]

{ #category : #'as yet unclassified' }
LockBox >> getMaxValueOfDices: dices [

	| sum |
	sum := 0.
	dices do: [ :die | sum := sum + die getFaces ].
	^ sum
]

{ #category : #initialization }
LockBox >> initializeWith: value [
	
	^self subclassResponsibility.
]

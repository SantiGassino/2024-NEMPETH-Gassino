Class {
	#name : #LockBox,
	#superclass : #Box,
	#instVars : [
		'lockMount',
		'prisioners'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LockBox class >> createWith: values [
	
	^self subclassResponsibility.
]

{ #category : #accessing }
LockBox >> applyEffect: spaceships and: actualSpaceship [

	((prisioners includes: actualSpaceship) and:
		 actualSpaceship getRequiredUnlockingAmount = -1) 
	ifFalse: [
		actualSpaceship setRequiredUnlockingAmount: lockMount.
		prisioners add: actualSpaceship ].

	prisioners remove: actualSpaceship
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

{ #category : #'as yet unclassified' }
LockBox >> isLockType [

	^ true
]

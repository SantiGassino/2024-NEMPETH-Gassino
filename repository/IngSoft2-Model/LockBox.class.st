Class {
	#name : #LockBox,
	#superclass : #Box,
	#instVars : [
		'prisioners',
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

	self evaluateIncorporatePrisioner: actualSpaceship.
	self evaluateReleasePrisioner: actualSpaceship.
]

{ #category : #accessing }
LockBox >> evaluateIncorporatePrisioner: aSpaceship [

	((prisioners includes: aSpaceship) not and:
		 aSpaceship getRequiredUnlockingAmount = -1) ifFalse: [ ^ self ].
	prisioners add: aSpaceship.
	aSpaceship setRequiredUnlockingAmount: lockAmount
]

{ #category : #accessing }
LockBox >> evaluateReleasePrisioner: aSpaceship [

	((prisioners includes: aSpaceship) and:
		 aSpaceship getRequiredUnlockingAmount = -1) ifFalse: [ ^ self ].
		
	prisioners remove: aSpaceship.
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

{ #category : #initialization }
LockBox >> isUnlockableByFreedomCard [
	
	^self subclassResponsibility.
]

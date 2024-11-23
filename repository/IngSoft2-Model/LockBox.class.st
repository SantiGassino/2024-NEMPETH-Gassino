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

	self evaluateIncorporatePrisioner: actualSpaceship.
	self evaluateReleasePrisioner: actualSpaceship.
]

{ #category : #accessing }
LockBox >> evaluateIncorporatePrisioner: aSpaceship [


	(aSpaceship requestStateOfLocking) ifTrue: [ ^ self ].
	
	aSpaceship updateStateOfLocking: (Lock create).
]

{ #category : #accessing }
LockBox >> evaluateReleasePrisioner: aSpaceship [

	(aSpaceship getAmountOfDicesRoll = lockAmount) ifFalse: [ ^ self ].
		
	aSpaceship updateStateOfLocking: Unlock new.
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

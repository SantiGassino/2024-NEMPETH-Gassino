Class {
	#name : #HyperGravity,
	#superclass : #LockBox,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
HyperGravity class >> createWith: dices [
	
	^self new initializeWith: dices.
]

{ #category : #initialization }
HyperGravity >> getLockAmount [
	
	^ lockAmount 
]

{ #category : #initialization }
HyperGravity >> initializeWith: dices [

	lockAmount := (1 to: (self getMaxValueOfDices: dices)) atRandom.
	prisioners := OrderedCollection new
]

{ #category : #initialization }
HyperGravity >> isUnlockableByFreedomCard [
	
	^ false
]

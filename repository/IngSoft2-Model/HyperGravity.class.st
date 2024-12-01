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

	lockAmount := ((dices size) to: (self getMaxValueOfDices: dices)) atRandom.
]

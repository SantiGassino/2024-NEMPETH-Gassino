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
HyperGravity >> getLockMount [
	
	^ lockMount 
]

{ #category : #initialization }
HyperGravity >> initializeWith: dices [

	lockMount := (1 to: (self getMaxValueOfDices: dices)) atRandom.
	prisioners := OrderedCollection new
]

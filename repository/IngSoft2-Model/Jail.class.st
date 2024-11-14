Class {
	#name : #Jail,
	#superclass : #LockBox,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Jail class >> createWith: dices [
	
	^ self new initializeWith: dices.
]

{ #category : #initialization }
Jail >> initializeWith: dices [
	
	lockAmount := self getMaxValueOfDices: dices.
	prisioners := OrderedCollection new.
	
]

{ #category : #initialization }
Jail >> isUnlockableByFreedomCard [

	^ true
]

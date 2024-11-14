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
	
	lockMount := self getMaxValueOfDices: dices.
	prisioners := OrderedCollection new.
	
]

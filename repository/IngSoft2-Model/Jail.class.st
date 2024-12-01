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
	
]

{ #category : #accessing }
Jail >> release: aSpaceship [

	aSpaceship updateStateOfLocking: Unlock new.
]

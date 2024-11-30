Class {
	#name : #Spaceship,
	#superclass : #Object,
	#instVars : [
		'lapsCompleted',
		'state',
		'id',
		'cards',
		'avaliableForMercenary',
		'mercenaries',
		'lockState',
		'physicalAttributes'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Spaceship class >> createWithId: anId [
	^ self new initializeWith: anId.
]

{ #category : #comparing }
Spaceship >> > aSpaceship [

	^ self lapsCompleted > aSpaceship lapsCompleted
		  ifTrue: [ true ]
		  ifFalse: [
			  self lapsCompleted = aSpaceship lapsCompleted
				  ifTrue: [ self position >= aSpaceship position ]
				  ifFalse: [ false ] ]
]

{ #category : #adding }
Spaceship >> addLap [
	lapsCompleted := lapsCompleted + 1
]

{ #category : #adding }
Spaceship >> addMercenary: aSpaceship [
	mercenaries add: aSpaceship.
	aSpaceship changeAvailabilityForMercenary.
]

{ #category : #'as yet unclassified' }
Spaceship >> cards [
	^ cards
]

{ #category : #'as yet unclassified' }
Spaceship >> changeAvailabilityForMercenary [
	avaliableForMercenary := avaliableForMercenary not. 
]

{ #category : #'as yet unclassified' }
Spaceship >> changeTo: anState [ 
	state := anState.
]

{ #category : #'as yet unclassified' }
Spaceship >> getAmountOfDicesRoll [
	
	^ lockState getAmountOfDices.
]

{ #category : #accessing }
Spaceship >> id [
	^ id
]

{ #category : #initialization }
Spaceship >> initializeWith: anId [

	id := anId.
	avaliableForMercenary := true.
	mercenaries := OrderedCollection new.
	lapsCompleted := 0.
	lockState := Unlock new.
	cards := OrderedCollection new.
	state := AvailableState create.
	physicalAttributes := PhysicalAttributes create.
]

{ #category : #testing }
Spaceship >> isAvaliableForMercenary [
	^ avaliableForMercenary 
]

{ #category : #accessing }
Spaceship >> lapsCompleted [
	^ lapsCompleted
]

{ #category : #accessing }
Spaceship >> mercenaries [

	^ mercenaries
]

{ #category : #'as yet unclassified' }
Spaceship >> mercenaryAvailabilityValidation [

	self isAvaliableForMercenary ifFalse: [
		Error signal: 'A spaceship chose a mercenary already chosen' ]
]

{ #category : #accessing }
Spaceship >> move: positionsToMoveByDices and: extraMovements [

	lockState isSpaceshipLock
		ifTrue: [ lockState saveDicesThrow: positionsToMoveByDices]
		ifFalse: [ physicalAttributes updatePosition:( positionsToMoveByDices + extraMovements) ].
		
]

{ #category : #'as yet unclassified' }
Spaceship >> obtain: aCard [

	cards add: aCard
]

{ #category : #'as yet unclassified' }
Spaceship >> playTurn [

	^ state playTurn: self
]

{ #category : #accessing }
Spaceship >> position [

	^ physicalAttributes getPosition.
]

{ #category : #removing }
Spaceship >> removeMercenary: aSpaceship [ 
	mercenaries remove: aSpaceship.
]

{ #category : #removing }
Spaceship >> removeThis: aCard [
	self cards remove: aCard.
]

{ #category : #'as yet unclassified' }
Spaceship >> requestStateOfLocking [

	^ lockState isSpaceshipLock.
]

{ #category : #adding }
Spaceship >> requestToAddSpeed [

	physicalAttributes addSpeed.
]

{ #category : #accessing }
Spaceship >> requestToMovementBySpeed [

	^ physicalAttributes getMovementBySpeed.
]

{ #category : #'as yet unclassified' }
Spaceship >> requestToRecoverShields [

	physicalAttributes recoverShields.
]

{ #category : #'as yet unclassified' }
Spaceship >> requestToRemoveSpeed [

	physicalAttributes removeSpeed.
]

{ #category : #'as yet unclassified' }
Spaceship >> requestToUpdateShield: amount [
	
	physicalAttributes updateShield: amount.
]

{ #category : #accessing }
Spaceship >> shield [

	^ physicalAttributes getShield.
]

{ #category : #accessing }
Spaceship >> state [
	^ state
]

{ #category : #'as yet unclassified' }
Spaceship >> subtractLap [

	lapsCompleted := lapsCompleted - 1
]

{ #category : #'as yet unclassified' }
Spaceship >> updateStateOfLocking: aStateOfLock [

	lockState := aStateOfLock.
]

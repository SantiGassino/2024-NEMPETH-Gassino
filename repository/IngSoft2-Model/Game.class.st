Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'dices',
		'deck',
		'permanentCardsPlayed',
		'lastCardPlayed',
		'movementByAcceleration',
		'board',
		'spaceshipsManager'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Game class >> createWithNumberOfSpaceships: numberOfSpaceships and: aCollectionOfDices and: aDeck and: aBoard andLapsToWin: amountOfLapsToWin [ 

	self dicesValidation: aCollectionOfDices.

	^ self new
		  initializeWith: numberOfSpaceships
		  and: aCollectionOfDices
		  and: aDeck
		  and: aBoard
		  andLapsToWin: amountOfLapsToWin
]

{ #category : #'instance creation' }
Game class >> dicesValidation: aCollectionOfDices [

	aCollectionOfDices size < 1 ifTrue: [
		Error signal: 'Game should have a least one die' ]
]

{ #category : #adding }
Game >> addAcceleration [

	movementByAcceleration := movementByAcceleration + 1.
	lastCardPlayed := Acceleration.
	
]

{ #category : #'as yet unclassified' }
Game >> addPermanentCardPlayed: aCard [

	permanentCardsPlayed add: aCard
]

{ #category : #'as yet unclassified' }
Game >> applyMercenary: idOfMercenarySpaceship to: idOfActualSpaceship [

	| mercenarySpaceship actualSpaceship |
	self targetSpaceshipExistValidation: idOfMercenarySpaceship.
	mercenarySpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship |
		                      aSpaceship id = idOfMercenarySpaceship ].
	actualSpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship |
		                   aSpaceship id = idOfActualSpaceship ].
	self mercenaryAvailabilityValidation: mercenarySpaceship.

	actualSpaceship addMercenary: mercenarySpaceship.
	lastCardPlayed := Mercenary
]

{ #category : #'as yet unclassified' }
Game >> applyRepeat: idOfTargetSpaceship [ 
	
	| affectedSpaceship index |
	self targetSpaceshipExistValidation: idOfTargetSpaceship.
	affectedSpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship | aSpaceship id = idOfTargetSpaceship ].
	index := spaceshipsManager getSpaceships indexOf: affectedSpaceship.
	spaceshipsManager getSpaceships removeAt: index.
	
	(board getLastBox) applyEffect: spaceshipsManager getSpaceships and: affectedSpaceship.
	
	spaceshipsManager getSpaceships add: affectedSpaceship beforeIndex: index.
	board normalizeAll: spaceshipsManager getSpaceships.
	
	lastCardPlayed := Repeat.
]

{ #category : #'as yet unclassified' }
Game >> applySpeedWith: anIdOfSpaceship [

	| affectedSpaceship |
	self targetSpaceshipExistValidation: anIdOfSpaceship.
	affectedSpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship |
		                     aSpaceship id = anIdOfSpaceship ].
	affectedSpaceship addSpeed.
	lastCardPlayed := Speed
]

{ #category : #'as yet unclassified' }
Game >> getLastCardPlayed [
	^ lastCardPlayed
]

{ #category : #'as yet unclassified' }
Game >> getPermanentCardPlayed [
	^ permanentCardsPlayed
]

{ #category : #initialization }
Game >> initializeWith: numberOfSpaceships and: aCollectionOfDices and: aDeck and: aBoard andLapsToWin: amountOfLapsToWin [ 
	
	permanentCardsPlayed := OrderedCollection new.
	spaceshipsManager := SpaceshipManager createWithNumberOfSpaceships: numberOfSpaceships  and: aDeck andLapsToWin: amountOfLapsToWin.
	movementByAcceleration := 0.
	dices := aCollectionOfDices.
	deck := aDeck.
	board := aBoard.

]

{ #category : #'as yet unclassified' }
Game >> mercenaryAvailabilityValidation: mercenarySpaceship [

	mercenarySpaceship isAvaliableForMercenary ifFalse: [
		Error signal: 'A spaceship chose a mercenary already chosen' ]
]

{ #category : #'as yet unclassified' }
Game >> passTurn [
	
	| actualSpaceship |
	
	actualSpaceship := spaceshipsManager manageTurns.
	actualSpaceship recoverShields.
	
	
]

{ #category : #'as yet unclassified' }
Game >> playCard: aCardArguments [

	| idOfSpaceship actualSpaceship idOfCard card |
	idOfSpaceship := aCardArguments at: 'idSpaceship'.
	self spaceshipExistValidation: idOfSpaceship.

	actualSpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship |
		                   aSpaceship id = idOfSpaceship ].
	idOfCard := aCardArguments at: 'idCardToUse'.

	self validation: actualSpaceship hasTheCard: idOfCard.

	card := actualSpaceship cards detect: [ :aCard | aCard id = idOfCard ].

	card applyCardEffect: aCardArguments and: self.
	actualSpaceship removeThis: card
]

{ #category : #'as yet unclassified' }
Game >> playTurn [

	| actualSpaceship boxToCheck winner |

	actualSpaceship := spaceshipsManager manageTurns.

	actualSpaceship playTurn ifFalse: [ ^ self ].
	actualSpaceship move: self throwDices + movementByAcceleration
		+ actualSpaceship movementBySpeed.

	board normalizeOne: actualSpaceship.

	boxToCheck := board findBoxIn: actualSpaceship position.	
	boxToCheck applyEffect: (spaceshipsManager getSpaceshipsWithOut: actualSpaceship) and: actualSpaceship.

	board normalizeAll: spaceshipsManager getSpaceships.

	winner := spaceshipsManager checkWinner.
	winner ifNotNil: [ ^ self ].

	spaceshipsManager verifyBattleWith: actualSpaceship and: self.
	
]

{ #category : #removing }
Game >> removeAcceleration [
	movementByAcceleration := movementByAcceleration - 1.

]

{ #category : #removing }
Game >> removeMercenary: idOfMercenarySpaceship and: idOfActualSpaceship [ 
	
	| mercenarySpaceship actualSpaceship |
	mercenarySpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship | aSpaceship id = idOfMercenarySpaceship ].
	actualSpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship | aSpaceship id = idOfActualSpaceship ].
	
	actualSpaceship removeMercenary: mercenarySpaceship.
	mercenarySpaceship changeAvailabilityForMercenary

]

{ #category : #removing }
Game >> removePermanentCardPlayed: aCard [ 
	permanentCardsPlayed remove: aCard.
	lastCardPlayed := Cancellation.
]

{ #category : #'as yet unclassified' }
Game >> removeSpeedWith: anIdOfSpaceship [ 
	| affectedSpaceship |
	affectedSpaceship := spaceshipsManager getSpaceships detect: [ :aSpaceship |
		                      aSpaceship id = anIdOfSpaceship ].
	
	affectedSpaceship removeSpeed. 
]

{ #category : #'as yet unclassified' }
Game >> spaceshipExistValidation: idOfSpaceship [

	(spaceshipsManager checkRanking includes: idOfSpaceship) ifFalse: [
		Error signal:
			'The spaceship that wants to play the card does not exist' ]
]

{ #category : #'as yet unclassified' }
Game >> targetSpaceshipExistValidation: anIdOfSpaceship [

	(spaceshipsManager checkRanking includes: anIdOfSpaceship) ifFalse: [
		Error signal: 'The target spaceship does not exist' ]
]

{ #category : #'as yet unclassified' }
Game >> throwDices [

	| sum |
	sum := 0.
	dices do: [ :die | sum := sum + die throw ].
	^ sum
]

{ #category : #accessing }
Game >> useSpaceshipsManagerTo [

	^ spaceshipsManager
]

{ #category : #'as yet unclassified' }
Game >> validation: actualSpaceship hasTheCard: idOfCard [

	(actualSpaceship cards noneSatisfy: [ :aCard | aCard id = idOfCard ])
		ifTrue: [
			Error signal:
				'A spaceship is trying to play a card that does not have' ]
]

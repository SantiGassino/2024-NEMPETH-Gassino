Class {
	#name : #SpaceshipManager,
	#superclass : #Object,
	#instVars : [
		'repeatTurn',
		'spaceships',
		'lapsToWin'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SpaceshipManager class >> amountOfLapsToWinValidation: amountOfLapsToWin [

	amountOfLapsToWin < 1 ifTrue: [
		Error signal: 'Laps to win should be greater than zero' ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager class >> createWithNumberOfSpaceships: numberOfSpaceships and: aDeck andLapsToWin: amountOfLapsToWin [ 

	self spaceshipsValidation: numberOfSpaceships.
	self amountOfLapsToWinValidation: amountOfLapsToWin.

	^ self new initializeWith: numberOfSpaceships and: aDeck andLapsToWin: amountOfLapsToWin
]

{ #category : #'instance creation' }
SpaceshipManager class >> spaceshipsValidation: numberOfSpaceships [

	numberOfSpaceships < 2 ifTrue: [
		Error signal: 'Game should have a least two spaceships' ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> adjustToQueueThe: actualSpaceship [

	repeatTurn 
    ifTrue: [ spaceships addFirst: actualSpaceship. self changeRepeatState.]
    ifFalse: [ spaceships add: actualSpaceship ].
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> changeRepeatState [
	
	repeatTurn := repeatTurn not.
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> checkAmountOfCardsOfSpaceships [
	| spaceshipsSortedById |
	spaceshipsSortedById := spaceships copy sort: [ :a :b | (a id) < (b id) ].
	^ spaceshipsSortedById collect: [ :spaceship | (spaceship cards) size ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> checkPositionsOfSpaceships [
	| spaceshipsSortedById |
	spaceshipsSortedById := spaceships copy sort: [ :a :b | (a id) < (b id) ].
	^ spaceshipsSortedById collect: [ :spaceship | spaceship position ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> checkRanking [
	| sortedSpaceships |
	sortedSpaceships := spaceships copy sort: [ :a :b | a > b ].

	^ sortedSpaceships collect: [ :spaceship | spaceship id ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> checkShieldsOfSpaceships [
	| spaceshipsSortedById |
	spaceshipsSortedById := spaceships copy sort: [ :a :b | (a id) < (b id) ].
	^ spaceshipsSortedById collect: [ :spaceship | spaceship shield ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> checkWinner [

	^ spaceships
		  detect: [ :aSpaceship | aSpaceship lapsCompleted >= lapsToWin ]
		  ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> createSpaceships: numberOfSpaceships and: deck [

	| aCollectionOfSpaceships anSpaceship |
	aCollectionOfSpaceships := OrderedCollection new: numberOfSpaceships.
	1 to: numberOfSpaceships do: [ :i |
		anSpaceship := (Spaceship createWithId: i).
		anSpaceship obtain: (deck giveACard). 
		anSpaceship obtain: (deck giveACard).
	aCollectionOfSpaceships add: anSpaceship ].
	^ aCollectionOfSpaceships
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> getIdOfSpaceshipAtTurn [

	^ spaceships first id
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> getSpaceships [
	^ spaceships.
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> getSpaceshipsWithOut: aSpaceship [

	^ (self getSpaceships) select: [:spaceship | spaceship ~= aSpaceship].
]

{ #category : #initialization }
SpaceshipManager >> initializeWith: numberOfSpaceships and: aDeck andLapsToWin: amountOfLapsToWin [ 
	
	lapsToWin := amountOfLapsToWin.
	repeatTurn := false.
	spaceships := self createSpaceships: numberOfSpaceships and: aDeck.
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> manageTurns [
	
	|actualSpaceship|

	actualSpaceship := spaceships removeFirst.
	self adjustToQueueThe: actualSpaceship.
	
	^ actualSpaceship.
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> reverseSpaceshipsTurns [

	spaceships := spaceships reverse.
]

{ #category : #'as yet unclassified' }
SpaceshipManager >> skipActualTurn [
	
	|skipSpaceship|
	
	skipSpaceship := spaceships removeFirst.
	spaceships add: skipSpaceship.
]

{ #category : #accessing }
SpaceshipManager >> verifyBattleWith: actualSpaceship and: aGame [

	| spaceshipsToFight sumOfThrowsActualSpaceship sumOfThrowsCounterSpaceship counterSpaceship |
	actualSpaceship position = 1 ifTrue: [ ^ aGame ].
	
	sumOfThrowsActualSpaceship := 0.
	sumOfThrowsCounterSpaceship := 0.
	
	spaceshipsToFight := spaceships select: [ :spaceship |
                           (spaceship position = actualSpaceship position) and: [ spaceship ~= actualSpaceship ]].

	spaceshipsToFight := spaceshipsToFight reject: [ :aSpaceship |
		                     aSpaceship mercenaries includes:
			                     actualSpaceship ].
		
	spaceshipsToFight size = 1 ifFalse: [ ^ aGame ].


	counterSpaceship := spaceshipsToFight first.

	1 to: (1 + actualSpaceship mercenaries size) do: [ :i | sumOfThrowsActualSpaceship := sumOfThrowsActualSpaceship + aGame throwDices  ].
	1 to: (1 + counterSpaceship mercenaries size) do: [ :i | sumOfThrowsCounterSpaceship := sumOfThrowsCounterSpaceship + aGame throwDices  ].

	 sumOfThrowsCounterSpaceship >= sumOfThrowsActualSpaceship
		ifTrue: [
			actualSpaceship move: 0 and: -1 * actualSpaceship position + 1.
			actualSpaceship updateShield: -1.
			actualSpaceship mercenaries do: [ :aMercenary | aMercenary updateShield: -1 ]]
		ifFalse: [
			counterSpaceship move: 0 and: -1 * counterSpaceship position + 1.
			counterSpaceship updateShield: -1.
			counterSpaceship mercenaries do: [ :aMercenary | aMercenary updateShield: -1 ]].
]

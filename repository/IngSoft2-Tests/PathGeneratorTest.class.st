Class {
	#name : #PathGeneratorTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
PathGeneratorTest >> should: anErrorBlock raise: anErrorClass withMessage: anErrorMessage [ 
	self should: anErrorBlock raise: anErrorClass withExceptionDo: [ :error | self assert: error messageText equals: anErrorMessage ]
]

{ #category : #running }
PathGeneratorTest >> test001WhenPathIsCreateThenTheFisrtBoxisKindOfNormalBox [

	| aPathGenerator cards aDeck aDices |
	
	cards := {
        1 -> Acceleration.
        2 -> Speed.
    } asDictionary.
	aDeck := LoadedDeck createWith: cards.
	
	aDices := OrderedCollection with: (Die of: 3).
	
	aPathGenerator := PathGenerator createWith: 10 and: 5 and: aDeck and: aDices.
	
	self assert: (((aPathGenerator path) at: 1) isKindOf: NormalBox).
]

{ #category : #running }
PathGeneratorTest >> test002VerifyCorrectDistributionsOfBoxes [

	| aDeck aPathGenerator pathOfTheBoard percent normalBoxes cardBoxes blackHoleBoxes hyperSpaceJumpBoxes hypergravityBoxes
	 moonwalkBoxes hyperJumpBoxes jailBoxes atomicBombBoxes aDices|
	
	aDeck := Deck create.
	aDices := OrderedCollection with: (Die of: 3).
	
	aPathGenerator := PathGenerator createWith: 7500 and: 5 and: aDeck and: aDices.
	
	pathOfTheBoard := aPathGenerator path.

	normalBoxes := pathOfTheBoard select: [ :box | box isKindOf: NormalBox ].
	percent := normalBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between:  0.20 and: 0.30).
	
	cardBoxes := pathOfTheBoard select: [ :box | box isKindOf: CardBox ].
	percent := cardBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between:  0.05 and: 0.15).
	
	
	blackHoleBoxes := pathOfTheBoard select: [ :box | box isKindOf: BlackHole ].
	percent := blackHoleBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between: 0.15 and: 0.25).
	
	
	hyperSpaceJumpBoxes := pathOfTheBoard select: [ :box | box isKindOf: HyperSpaceJump ].
	percent := hyperSpaceJumpBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between: 0.15 and: 0.25).
	
	
	moonwalkBoxes := pathOfTheBoard select: [ :box | box isKindOf: MoonWalk ].
	percent := moonwalkBoxes size/pathOfTheBoard size.

	self assert: ((percent) between: 0.05 and: 0.15).
	
	hyperJumpBoxes := pathOfTheBoard select: [ :box | box isKindOf: HyperJump ].
	percent := hyperJumpBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between: 0.03 and: 0.12).

	atomicBombBoxes := pathOfTheBoard select: [ :box | box isKindOf: AtomicBomb ].
	percent := atomicBombBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between: 0 and: 0.07).
	
	hypergravityBoxes := pathOfTheBoard select: [ :box | box isKindOf: HyperGravity ].
	percent := hypergravityBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between: 0.03 and: 0.07).
	
	jailBoxes := pathOfTheBoard select: [ :box | box isKindOf: Jail ].
	percent := jailBoxes size/pathOfTheBoard size.
	
	self assert: ((percent) between: 0 and: 0.02).

]

{ #category : #running }
PathGeneratorTest >> test003WhenRatioParsecToBoxesIsEqualOrLessThanZeroThenThorwError [
	
	| cards aDeck aDices|
	cards := {
        1 -> Acceleration.
        2 -> Speed.
    } asDictionary.
	aDeck := LoadedDeck createWith: cards.
	aDices := OrderedCollection with: (Die of: 3).
	
	self
		should: [ PathGenerator createWith: 50 and: 0 and: aDeck and: aDices. ]
		raise: Error
		withMessage: 'Parsec to boxes ratio should be greater that zero'
]

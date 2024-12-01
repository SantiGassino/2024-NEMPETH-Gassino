Class {
	#name : #Box,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
Box >> applyEffect: spaceships and: actualSpaceship [

	self subclassResponsibility.
]

{ #category : #accessing }
Box >> evaluateBattle: aSpaceshipManager and: actualSpaceship and: aGame [

	aSpaceshipManager verifyBattleWith: actualSpaceship and: aGame.
]

{ #category : #'as yet unclassified' }
Box >> getActualEffect [

	^ self
]

{ #category : #accessing }
Box >> position [

	^ position
]

{ #category : #accessing }
Box >> position: aPosition [

	position := aPosition
]

{ #category : #accessing }
Box >> release: aSpaceship [

	^ self.

	
]

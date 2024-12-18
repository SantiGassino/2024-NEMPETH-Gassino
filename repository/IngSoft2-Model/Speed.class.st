Class {
	#name : #Speed,
	#superclass : #PermanentCard,
	#instVars : [
		'idOfAffectedSpaceship'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Speed >> applyCardEffect: aCardArguments and: aGame [

	| idOfSpaceship idOfSpaceshipAtTurn |
	idOfAffectedSpaceship := aCardArguments at: 'idTargetSpaceship'.
	idOfSpaceship := aCardArguments at: 'idSpaceship'.
	idOfSpaceshipAtTurn := aGame requestIdOfSpaceshipAtTurn.
	self
		permanentCardValidationWith: idOfSpaceship
		and: idOfSpaceshipAtTurn.
	
	aGame applySpeedWith: idOfAffectedSpaceship.
	aGame addPermanentCardPlayed: self.
	
]

{ #category : #removing }
Speed >> removeCardEffect: aCardArguments and: aGame [ 

	aGame removeSpeedWith: idOfAffectedSpaceship.
	aGame removePermanentCardPlayed: self.
]

Class {
	#name : #HyperSpaceJump,
	#superclass : #Box,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
HyperSpaceJump >> applyEffect: spaceships and: actualSpaceship [

	actualSpaceship move: 0 and: 4.
	actualSpaceship requestToUpdateShield: -1
]

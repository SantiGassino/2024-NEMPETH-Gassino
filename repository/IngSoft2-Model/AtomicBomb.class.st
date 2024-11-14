Class {
	#name : #AtomicBomb,
	#superclass : #Box,
	#category : #'IngSoft2-Model'
}

{ #category : #accessing }
AtomicBomb >> applyEffect: spaceships and: actualSpaceship [

	spaceships do: [ :aSpaceship |
		aSpaceship position ~= 1 ifTrue: [
			aSpaceship move: 0 and: (-1 * aSpaceship position + 1).
			 ].
		aSpaceship updateShield:  -1].
		

	actualSpaceship move: 0 and: (-1 * actualSpaceship position + 1).
	actualSpaceship updateShield: -1
]

{ #category : #accessing }
AtomicBomb >> isLockType [
	^ false
]

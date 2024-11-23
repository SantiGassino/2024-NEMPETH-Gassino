Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'path',
		'lastBox'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> createWith: aPath [

	self lengthValidation: aPath.
	^ self new initializeWith: aPath.
]

{ #category : #'instance creation' }
Board class >> lengthValidation: aPath [

	(aPath size <= 0) ifTrue: [
		Error signal:
			'Path should have a least three box']
]

{ #category : #'as yet unclassified' }
Board >> findBoxIn: aPosition [

	| actualBox |
	actualBox := path at: aPosition.

	actualBox isLockType ifFalse: [ lastBox := actualBox ].

	^ actualBox
]

{ #category : #'as yet unclassified' }
Board >> getLastBox [

	^ lastBox
]

{ #category : #initialization }
Board >> initializeWith: aPath [
	
	path := aPath.
	lastBox := NormalBox new.
	path withIndexDo: [ :box :index | box position: index ].
]

{ #category : #accessing }
Board >> length [
	^ path size.
]

{ #category : #'as yet unclassified' }
Board >> normalizeAll: spaceships [

	self normalizeForwards: spaceships.
	self normalizeFirstBox: spaceships.
	self normalizeBackwards: spaceships
]

{ #category : #'as yet unclassified' }
Board >> normalizeBackwards: spaceships [

	spaceships do: [ :aSpaceship |
		aSpaceship position < 1 ifTrue: [
			aSpaceship move: 0 and: self length.
			aSpaceship subtractLap ] ]
	
]

{ #category : #'as yet unclassified' }
Board >> normalizeFirstBox: spaceships [

	spaceships do: [ :aSpaceship |
		(aSpaceship lapsCompleted = 0 and: aSpaceship position < 1) ifTrue: [
			aSpaceship move: 0 and: -1 * aSpaceship position + 1 ] ]
]

{ #category : #'as yet unclassified' }
Board >> normalizeForwards: spaceships [

	spaceships do: [ :aSpaceship |
		[ aSpaceship position > self length ] whileTrue: [
			aSpaceship move: 0 and: -1 * self length.
			aSpaceship addLap ] ]
]

{ #category : #private }
Board >> normalizeOne: aSpaceship [

	[ aSpaceship position > self length ] whileTrue: [
		aSpaceship move: 0 and: -1 * self length.
		aSpaceship addLap ]
]

{ #category : #accessing }
Board >> validationOfJailBoxAt: actualPosition [

	| actualBox |
	actualBox := self findBoxIn: actualPosition.

	(actualBox isUnlockableByFreedomCard) ifFalse: [
		Error signal:
			'A ship is attempting to play a freedom card when it is not in a JailBox' ]
]

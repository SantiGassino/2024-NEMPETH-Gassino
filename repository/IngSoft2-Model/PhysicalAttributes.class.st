Class {
	#name : #PhysicalAttributes,
	#superclass : #Object,
	#instVars : [
		'position',
		'shield',
		'movementBySpeed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
PhysicalAttributes class >> create [ 

	^self new initializateWith.
]

{ #category : #removing }
PhysicalAttributes >> addSpeed [

	movementBySpeed := movementBySpeed + 1.
]

{ #category : #removing }
PhysicalAttributes >> getMovementBySpeed [

	^ movementBySpeed
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> getPosition [

	^ position
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> getShield [
	^ shield
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> initializateWith [

	position := 1.
	movementBySpeed := 0.
	shield := 3.
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> recoverShields [

	shield := 3
]

{ #category : #removing }
PhysicalAttributes >> removeSpeed [
	movementBySpeed := movementBySpeed - 1.
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> updatePosition: aPosition [

	position := position + aPosition.
]

{ #category : #'as yet unclassified' }
PhysicalAttributes >> updateShield: amount [
	shield := shield + amount.
]

Class {
	#name : #Freedom,
	#superclass : #InstantCard,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
Freedom >> applyCardEffect: aCardArguments and: aGame [ 
	
	| idOfSpaceship |

	idOfSpaceship := aCardArguments at: 'idSpaceship'.
	
	aGame applyFreedom: idOfSpaceship.	
]

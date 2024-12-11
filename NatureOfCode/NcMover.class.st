"
A generic Mover, from the Nature of Code chapter 1
"
Class {
	#name : 'NcMover',
	#superclass : 'NcCircle',
	#instVars : [
		'velocity',
		'spaceW',
		'spaceH'
	],
	#category : 'NatureOfCode-Chapter 1',
	#package : 'NatureOfCode',
	#tag : 'Chapter 1'
}

{ #category : 'updating' }
NcMover >> checkEdges [
	"When it reaches one edge, set the position to the other edge"
| currentX currentY |
currentX := self position x.
currentY := self position y.
	currentX  > spaceW ifTrue: [ self position: 0@currentY ].
	currentX < 0 ifTrue: [ self position: spaceW@currentY ].
	
   currentY  > spaceH ifTrue: [ self position: currentX@0 ].
	currentY < 0 ifTrue: [ self position: currentX@spaceH ].
]

{ #category : 'initialization' }
NcMover >> initialize [

	| posX posY velX velY |
	super initialize.
	spaceW := NcSpace extent x.
	spaceH := NcSpace extent y.
	posX := Random new nextIntegerBetween: 0 and: spaceW.
	posY := Random new nextIntegerBetween: 0 and: spaceH.
	velX := Random new nextIntegerBetween: -5 and: 5.
	velY := Random new nextIntegerBetween: -5 and: 5.

	velocity := velX @ velY.
	self
		position: posX @ posY;
		diameter: 50
]

{ #category : 'accessing' }
NcMover >> spaceH [

	^ spaceH
]

{ #category : 'accessing' }
NcMover >> spaceW [

	^ spaceW
]

{ #category : 'updating' }
NcMover >> update [
	"The mover moves"
 
	self position: self position + self velocity
]

{ #category : 'accessing' }
NcMover >> velocity [

	^ velocity
]

{ #category : 'accessing' }
NcMover >> velocity: aPoint [

	velocity := aPoint
]

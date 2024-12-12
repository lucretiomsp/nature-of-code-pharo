"
A generic Mover, from the Nature of Code chapter 1
"
Class {
	#name : 'NcMover',
	#superclass : 'NcCircle',
	#instVars : [
		'velocity',
		'spaceW',
		'spaceH',
		'acceleration',
		'topSpeed'
	],
	#category : 'NatureOfCode-Chapter 1',
	#package : 'NatureOfCode',
	#tag : 'Chapter 1'
}

{ #category : 'accessing' }
NcMover >> acceleration [

	^ acceleration
]

{ #category : 'accessing' }
NcMover >> acceleration: aPoint [

	acceleration := aPoint 
]

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

	"both acceleration and topSpeed are vectors. in Pharo we have a min: method for Points that requires a Point as argument, hence we dont need to implement a limit method as in the book"
	acceleration := -0.001 @ 0.01.
	topSpeed := 10 @ 10.

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

{ #category : 'accessing' }
NcMover >> topSpeed [

	^ topSpeed
]

{ #category : 'accessing' }
NcMover >> topSpeed: anObject [

	topSpeed := anObject
]

{ #category : 'updating' }
NcMover >> update [
	"The mover moves"

	| location |
	self velocity: self velocity + self acceleration.
	location := self position + (self velocity min: topSpeed).

	self position: location
]

{ #category : 'accessing' }
NcMover >> velocity [

	^ velocity
]

{ #category : 'accessing' }
NcMover >> velocity: aPoint [

	velocity := aPoint
]

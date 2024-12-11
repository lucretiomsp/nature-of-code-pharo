"
Convenience high level abstraction to draw a Rectangle a la p5js.
Basic creation:
NCRect new
creates a black Retangle, 160x20 rectangle positioned at the center of an NcSpace
"
Class {
	#name : 'NcRect',
	#superclass : 'NcShape',
	#category : 'NatureOfCode-Shapes',
	#package : 'NatureOfCode',
	#tag : 'Shapes'
}

{ #category : 'initialization' }
NcRect >> initialize [

	super initialize.
	self
		geometry: BlRectangleGeometry new;
		size: 60 @ 20;
		position: NcSpace centerCoordinates;
		background: Color black.
]

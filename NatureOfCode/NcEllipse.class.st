"
Convenience high level abstraction to draw an Ellipse a la p5js.

NcEllopse new
creates a black Circle, 10@20 extent , positioned at the center of an NcSpace
"
Class {
	#name : 'NcEllipse',
	#superclass : 'NcShape',
	#category : 'NatureOfCode-Shapes',
	#package : 'NatureOfCode',
	#tag : 'Shapes'
}

{ #category : 'initialization' }
NcEllipse >> initialize [

	super initialize.
	self
		geometry: BlCircleGeometry new;
		background: Color black;
		position: NcSpace centerCoordinates;
		size: 20 @ 10
]

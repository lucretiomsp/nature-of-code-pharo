"
Convenience high level abstraction to draw a Circle a la p5js.
Basic creation:
NCCircle new
creates a black Circle, 10px diameter positioned at the center of an NcSpace
"
Class {
	#name : 'NcCircle',
	#superclass : 'BlElement',
	#instVars : [
		'diameter'
	],
	#category : 'NatureOfCode-Shapes',
	#package : 'NatureOfCode',
	#tag : 'Shapes'
}

{ #category : 'accessing' }
NcCircle >> diameter [

	^ diameter
]

{ #category : 'accessing' }
NcCircle >> diameter: anInteger [ 
   
   self extent: anInteger@anInteger.
	diameter := anInteger
]

{ #category : 'initialization' }
NcCircle >> initialize [

	super initialize.
	self
		geometry: BlCircleGeometry new;
		extent: 10 @ 10;
		background: Color black;
		size: NcSpace centerCoordinates
]

{ #category : 'accessing' }
NcCircle >> strokeColor: aColor [ 
	self border: (BlBorder  paint: aColor width: self border width)
]

{ #category : 'accessing' }
NcCircle >> strokeWidth: anInteger [ 
	self border: (BlBorder paint: self border paint width: anInteger) 
]

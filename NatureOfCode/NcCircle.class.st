"
Convenience high level abstraction to draw a circle a la p5js.
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

{ #category : 'instance creation' }
NcCircle >> initialize [

super initialize.
	self 	  geometry: BlCircleGeometry new;
		  extent: 10 @ 10;
		  background: Color black;
		  position: NcSpace centerCoordinates;
		  yourself
]

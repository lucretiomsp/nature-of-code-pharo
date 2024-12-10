"
Syntactic sugar for an Ellipse element a la p5.js
"
Class {
	#name : 'NcEllipse',
	#superclass : 'BlElement',
	#category : 'NatureOfCode-Shapes',
	#package : 'NatureOfCode',
	#tag : 'Shapes'
}

{ #category : 'initialization' }
NcEllipse >> initialize [

^ BlElement new
		  geometry: BlCircleGeometry new; yourself 
]

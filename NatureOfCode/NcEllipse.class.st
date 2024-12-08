"
Syntactic sugar for an Ellipse element a la p5.js
"
Class {
	#name : 'NcEllipse',
	#superclass : 'BlElement',
	#category : 'NatureOfCode-setup',
	#package : 'NatureOfCode',
	#tag : 'setup'
}

{ #category : 'initialization' }
NcEllipse >> initialize [

^ BlElement new
		  geometry: BlCircleGeometry new; yourself 
]

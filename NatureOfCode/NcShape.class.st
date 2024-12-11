"
Super class for all high level classe with shapes a la p5js
"
Class {
	#name : 'NcShape',
	#superclass : 'BlElement',
	#category : 'NatureOfCode-Shapes',
	#package : 'NatureOfCode',
	#tag : 'Shapes'
}

{ #category : 'accessing' }
NcShape >> strokeColor: aColor [
	"change the width of the line"

	| borderWidth |
	borderWidth := self border width.
	self border: (BlBorder paint: aColor width: borderWidth)
]

{ #category : 'accessing' }
NcShape >> strokeWidth: anInteger [
"change the width of the line"
| color |
color := self border paint.
self border: (BlBorder paint: color width: anInteger ).
]

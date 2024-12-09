"
Convenience high level abstraction to draw a line a la p5js.
Basic creation:
NCLine from: aPoint to: anotherPoint
creates a black line, 5px border,
"
Class {
	#name : 'NcLine',
	#superclass : 'BlElement',
	#category : 'NatureOfCode-Shapes',
	#package : 'NatureOfCode',
	#tag : 'Shapes'
}

{ #category : 'instance creation' }
NcLine class >> from: aStartPoint to: anEndPoint [

	| line |
	line := self new
		        extent: NcSpace extent;
		        border: (BlBorder paint: Color black width: 5);
		        geometry:
			        (BlLineGeometry new from: aStartPoint to: anEndPoint).


	^ line
]

{ #category : 'instance creation' }
NcLine >> from: aStartPoint to: anEndPoint [
	"change the startPoint and endPoint of the line"

	self geometry:  (self geometry from: aStartPoint to: anEndPoint)
]

{ #category : 'accessing' }
NcLine >> strokeColor: aColor [
	"change the width of the line"

	| borderWidth |
	borderWidth := self border width.
	self border: (BlBorder paint: aColor width: borderWidth)
]

{ #category : 'accessing' }
NcLine >> strokeWidth: anInteger [
"change the width of the line"
| color |
color := self border paint.
self border: (BlBorder paint: color width: anInteger ).
]

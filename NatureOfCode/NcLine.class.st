"
Convenience high level abstraction to draw a line a la p5js.
Basic creation:
NCLine from: aPoint to: anotherPoint
creates a black line, 5px border,
"
Class {
	#name : 'NcLine',
	#superclass : 'NcShape',
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

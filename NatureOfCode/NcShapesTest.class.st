Class {
	#name : 'NcShapesTest',
	#superclass : 'TestCase',
	#category : 'NatureOfCode-Tests',
	#package : 'NatureOfCode',
	#tag : 'Tests'
}

{ #category : 'tests' }
NcShapesTest >> testNcCircleCreation [

	| blocEllipse ncEllipse |
	blocEllipse := BlElement new geometry: BlCircleGeometry new.

	ncEllipse := NcCircle new.
	self assert: blocEllipse geometry equals: ncEllipse geometry
]

{ #category : 'tests' }
NcShapesTest >> testNcCircleDiameter [

	| ncCircle |
	ncCircle := NcCircle new diameter: 30.
	self assert: ncCircle diameter equals: 30 
]

{ #category : 'tests' }
NcShapesTest >> testNcLineCreation [

	| blocLine ncLine |
	blocLine := BlElement new
		            border: (BlBorder paint: Color lightGreen width: 3);
		            geometry:
			            (BlLineGeometry new from: 10 @ 10 to: 200 @ 100);
		            outskirts: BlOutskirts centered.

	ncLine := (NcLine from: 10 @ 10 to: 200 @ 100)
		          border: (BlBorder paint: Color lightGreen width: 3);
		          outskirts: BlOutskirts centered.
	self assert: blocLine geometry  equals: ncLine geometry.

	self assert: blocLine outskirts  equals: ncLine outskirts .
	self assert: blocLine border  equals: ncLine border.
]

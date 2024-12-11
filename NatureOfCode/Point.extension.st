Extension { #name : 'Point' }

{ #category : '*NatureOfCode' }
Point >> magnitude [

"return the magnitude of the Point, considered as an Euclidean vector"
^ (self x squared + self y squared ) sqrt 
]

{ #category : '*NatureOfCode' }
Point >> normalize [

	| mag newX newY|
	mag := self magnitude.
	newX := self x / mag.
	newY :=  self y / mag.
	^ newX@newY
]

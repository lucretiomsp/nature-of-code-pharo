"
The random Walker from chapter 0 of the book.
"
Class {
	#name : 'NcWalker',
	#superclass : 'BlElement',
	#instVars : [
		'directions'
	],
	#category : 'NatureOfCode-Chapter 0',
	#package : 'NatureOfCode',
	#tag : 'Chapter 0'
}

{ #category : 'examples' }
NcWalker class >> example1 [
<script>
	| space walker |
	space := NcSpace new.
	space root background: Color transparent.

	space show.


	walker := self new.
	walker position: space center.
	space root addChild: walker.

	space drawAnimation: [ walker step ]
]

{ #category : 'accessing' }
NcWalker >> directions [

	^ directions
]

{ #category : 'accessing' }
NcWalker >> directions: anArrayOfPoints [

	directions := anArrayOfPoints 
]

{ #category : 'initialization' }
NcWalker >> initialize [

	super initialize.
	self
		size: 40 @ 40;
		background: Color red;
		geometry: BlCircleGeometry new;
		border: (BlBorder paint: Color white width: 3);
		position: NcSpace center.

	directions := {
		              (1 @ 0).
		              (-1 @ 0).
		              (0 @ 1).
		              (0 @ -1) }
]

{ #category : 'stepping' }
NcWalker >> step [

	| choice |
	choice := Random new nextIntegerBetween: 1 and: 4.
	self position: self position + (directions at: choice).

]

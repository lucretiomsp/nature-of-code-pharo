"
The random Walker from chapter 0 of the book.
"
Class {
	#name : 'NcWalker',
	#superclass : 'BlElement',
	#category : 'NatureOfCode-Chapter 0',
	#package : 'NatureOfCode',
	#tag : 'Chapter 0'
}

{ #category : 'initialization' }
NcWalker >> initialize [

super initialize .
self size: 10@10 ; background: Color red ; geometry: BlCircleGeometry new ; position: NcSpace center
	
]

{ #category : 'stepping' }
NcWalker >> step [

self position: self position + 1
]

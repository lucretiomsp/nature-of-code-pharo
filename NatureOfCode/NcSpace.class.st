"
A BlSpace used to display the examples
"
Class {
	#name : 'NcSpace',
	#superclass : 'BlSpace',
	#instVars : [
		'frameRate'
	],
	#category : 'NatureOfCode-setup',
	#package : 'NatureOfCode',
	#tag : 'setup'
}

{ #category : 'accessing' }
NcSpace class >> extent [ 
"fixed extent"
^ 800@800.
]

{ #category : 'accessing' }
NcSpace >> center [

	^ self class extent / 2
]

{ #category : 'animation' }
NcSpace >> drawAnimation: aBlock [

	| task |
	task := BlRepeatedTaskAction new
		        delay: (1000 / frameRate) milliSeconds ;
		        action: aBlock;
		        yourself.
	self enqueueTask: task
]

{ #category : 'accessing' }
NcSpace >> frameRate [

	^ frameRate
]

{ #category : 'accessing' }
NcSpace >> frameRate: anObject [

	frameRate := anObject
]

{ #category : 'initialization' }
NcSpace >> initialize [

	super initialize.
	self extent: self class extent.
	self frameRate: 40.
	self root background: Color white
]

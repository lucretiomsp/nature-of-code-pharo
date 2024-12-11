Class {
	#name : 'NcExtensionsTest',
	#superclass : 'TestCase',
	#category : 'NatureOfCode-Tests',
	#package : 'NatureOfCode',
	#tag : 'Tests'
}

{ #category : 'tests' }
NcExtensionsTest >> testPointMagnitude [

| vec |
vec := 3@4.

self assert: vec magnitude equals: 5
]

{ #category : 'tests' }
NcExtensionsTest >> testPointNormalize [

	| vec newX newY |
	vec := 3 @ 4.
	newX := 3 / vec magnitude.
	newY := 4 / vec magnitude.
	self assert: vec normalize equals: newX @ newY
]

"
1 dimensional Perlin Noise
Perlin noise is a type of gradient noise developed by Ken Perlin in 1983. It has many uses, including but not limited to: procedurally generating terrain, applying pseudo-random changes to a variable, and assisting in the creation of image textures. 
"
Class {
	#name : 'NcPerlin1d',
	#superclass : 'Object',
	#instVars : [
		'gradients',
		'permutation'
	],
	#category : 'NatureOfCode-setup',
	#package : 'NatureOfCode',
	#tag : 'setup'
}

{ #category : 'as yet unclassified' }
NcPerlin1d >> gradientDot: aGradient withOffset: anOffset [ 
	 ^ aGradient * anOffset.
]

{ #category : 'accessing' }
NcPerlin1d >> gradients [

	^ gradients
]

{ #category : 'accessing' }
NcPerlin1d >> gradients: anObject [

	gradients := anObject
]

{ #category : 'accessing' }
NcPerlin1d >> hash: aNumber [ 
	^ permutation at: ((aNumber \\ 256) + 1).
]

{ #category : 'initialization' }
NcPerlin1d >> initialize [
    gradients := Array new: 256.
    gradients withIndexDo: [ :each :index |
        gradients at: index put: (2 * (index asFloat / 255) - 1) ].
    gradients := gradients shuffled.

    permutation := (1 to: 256) shuffled, (1 to: 256) shuffled. "Repeat for smooth wrapping"
]

{ #category : 'accessing' }
NcPerlin1d >> nextAt: anInteger [ 

	| x0 x1 t g0 g1 v0 v1 |
    x0 := anInteger floor.
    x1 := x0 + 1.
    t := self smoothStep: (anInteger - x0).

    g0 := gradients at: (self hash: x0).
    g1 := gradients at: (self hash: x1).

    v0 := self gradientDot: g0 withOffset: (anInteger - x0).
    v1 := self gradientDot: g1 withOffset: (anInteger - x1).

    ^ v0 + t * (v1 - v0).
]

{ #category : 'accessing' }
NcPerlin1d >> permutation [

	^ permutation
]

{ #category : 'accessing' }
NcPerlin1d >> permutation: anObject [

	permutation := anObject
]

{ #category : 'smoot' }
NcPerlin1d >> smoothStep: anInteger [ 
	 ^ anInteger * anInteger * (3 - 2 * anInteger ).
]

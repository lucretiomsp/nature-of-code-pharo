Class {
	#name : 'PerlinTest',
	#superclass : 'TestCase',
	#category : 'NatureOfCode-Tests',
	#package : 'NatureOfCode',
	#tag : 'Tests'
}

{ #category : 'tests' }
PerlinTest >> test1dSmothness [

    | previous current difference noise  |
noise := NcPerlin1d new.
    previous := noise nextAt: 0.
    (0.1 to: 10 by: 0.1) do: [ :x |
        current := noise nextAt: x.
        difference := (current - previous) abs.
        self assert: difference < 0.5. "Adjust threshold based on your gradient and interpolation"
        previous := current.
    ].

]

{ #category : 'tests' }
PerlinTest >> testNextAt [

	| perlin |
	perlin := NcPerlin1d new.
	1 to: 1000 do: [:i |
		| next |
		next := perlin nextAt: i.
		self assert: next >= 0.
		self assert: next < 1 ]
]

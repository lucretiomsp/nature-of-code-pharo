"
I contain all the examples
"
Class {
	#name : 'NcExample',
	#superclass : 'Object',
	#category : 'NatureOfCode-examples',
	#package : 'NatureOfCode',
	#tag : 'examples'
}

{ #category : 'as yet unclassified' }
NcExample class >> chapter1Example1 [
	"a bouncing ball with no vectors"

	<script>
	| space x y xSpeed ySpeed ball |
	x := 100.
	y := 100.
	xSpeed := 2.5.
	ySpeed := 2.
	space := NcSpace new.
	space root background: Color white.
	ball := NcEllipse new
		        size: 50 @ 50;
		        background: Color black;
		        position: 0 @ 0.
	space root addChild: ball.
   space show.
	space drawAnimation: [ "move the ball according to speed"
		x := x + xSpeed.
		y := y + ySpeed.
		"check for bouncing"
		(x > space extent x or: x < 0) ifTrue: [ xSpeed := xSpeed * -1 ].
		(y > space extent y or: y < 0) ifTrue: [ ySpeed := ySpeed * -1 ].

		ball position: x @ y
		"move the ball" ]
]

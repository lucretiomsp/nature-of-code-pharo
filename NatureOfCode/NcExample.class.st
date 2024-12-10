"
I contain all the examples as executable scripts on my class side
"
Class {
	#name : 'NcExample',
	#superclass : 'Object',
	#category : 'NatureOfCode-examples',
	#package : 'NatureOfCode',
	#tag : 'examples'
}

{ #category : 'example' }
NcExample class >> chapter1Example1 [
	"a bouncing ball with no vectors"

	<script>
	| space x y xSpeed ySpeed ball ballRadius |
	x := 100.
	y := 100.
	xSpeed := 6.5.
	ySpeed := 3.
	ballRadius := 25.
	space := NcSpace new.
	space root background: Color white.
	ball := NcEllipse new
		        size: 50 @ 50;
		        background: Color darkGray;
		        border: (BlBorder paint: Color black width: 3);
		        position: 0 @ 0.
	space root addChild: ball.
	space show.
	space drawAnimation: [ "move the ball according to speed"
		x := x + xSpeed.
		y := y + ySpeed.
		"check for bouncing"
		(x > (space width - ballRadius) or: x < (0 - ballRadius)) ifTrue: [
			xSpeed := xSpeed * -1 ].
		(y > (space height - ballRadius) or: y < (0 - ballRadius)) ifTrue: [
			ySpeed := ySpeed * -1 ].

		ball position: x @ y
		"move the ball" ]
]

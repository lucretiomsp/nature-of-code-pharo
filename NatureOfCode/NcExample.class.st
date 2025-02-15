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

{ #category : 'example' }
NcExample class >> chapter1Example2 [
	"a bouncing ball with vectors - in Pharo we can use Points as p5Vectors, or not?"

	<script>
	| space position velocity ball  ballRadius |
	position := 100 @ 100.
	velocity := 6 @ 3.

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

	space drawAnimation: [ "changing ballLocation summing Points"
		position := position + velocity.
		"check for bouncing"
		(position x > (space width - ballRadius) or:
			 position x < (0 - ballRadius)) ifTrue: [
			"Point class doesnt have a setter for x or y so we  have to multiplicate the value for another Point"	
			velocity := velocity * (-1 @ 1) ].
		(position y > (space height - ballRadius) or:
			 position y < (0 - ballRadius)) ifTrue: [
			velocity := velocity * (1 @ -1) ].

		ball position: position
		"move the ball" ]
]

{ #category : 'example' }
NcExample class >> chapter1Example3 [
	"vector subtraction in Pharo we can use Points as p5Vectors, or not?"

	<script>
	| space mousePosition line1 center line2 line3 |
	mousePosition := 0 @ 0.
	center := NcSpace centerCoordinates.
	space := NcSpace new.
	line1 := (NcLine from: 0 @ 0 to: center) strokeColor: Color orange.
	line2 := (NcLine from: 0 @ 0 to: mousePosition) strokeColor:
		         Color orange.
	line3 := (NcLine from: 0 @ 0 to: center) strokeColor: Color black.
	"subtraction Result"

	space root
		addChild: line1;
		addChild: line2;
		addChild: line3.
	space show.

	"we dont need to call drawAnimation now"
	space addEventHandlerOn: BlMouseMoveEvent do: [ :mousePos |
		line2 from: 0 @ 0 to: mousePos position.
		line3 from: 0 @ 0 to: mousePos position - center.
		line3 transform
			translateBy: 300 @ 300;
			apply ]
]

{ #category : 'example' }
NcExample class >> chapter1Example4 [
	"vector multiplication/ in Pharo we can use Points as p5Vectors"

	<script>
	| space mousePosition line1 center line2 |
	mousePosition := 0 @ 0.
	center := NcSpace centerCoordinates.
	space := NcSpace new.
	line1 := (NcLine from: 0@0 to: center) strokeColor: Color red.
	line2 := (NcLine from: center to: mousePosition)
		         strokeColor: Color black;
		         strokeWidth: 7.


	space root
		addChild: line1;
		addChild: line2.
	space show.

	space addEventHandlerOn: BlMouseMoveEvent do: [ :mousePos |
	
		line1 from: 0@0 to: mousePos position - center.
      line1 transform translateBy: 300@300; apply.
		line2 from: 0@0 to: (mousePos position - center) * 0.5 .
		line2 transform translateBy: 300@300; apply.]
]

{ #category : 'example' }
NcExample class >> chapter1Example5 [
	"vector magnitude - we implemented a magnitude method as en extension of the Point class"

	<script>
	| space mousePosition line1 center rect mag |
	mousePosition := 0 @ 0.
	mag := 0.
	center := NcSpace centerCoordinates.
	space := NcSpace new.
	line1 := (NcLine from: 0 @ 0 to: center) strokeColor: Color gray.
	rect := NcRect new
		        position: 0 @ 0;
		        size: 200 @ 40.


	space root
		addChild: line1;
		addChild: rect.
	space show.

	space addEventHandlerOn: BlMouseMoveEvent do: [ :mousePos |
		line1 from: 0 @ 0 to: mousePos position - center.
		line1 transform
			translateBy: 300 @ 300;
			apply.
			mag := (mousePos position - center )magnitude.
		rect size: mag @ 40 ]
]

{ #category : 'example' }
NcExample class >> chapter1Example6 [
	"normalizing a Vector - we implemented a normalize method as en extension of the Point class"

	<script>
	| space mousePosition line1 center line2 |
	mousePosition := 0 @ 0.

	center := NcSpace centerCoordinates.
	space := NcSpace new.
	line1 := (NcLine from: 0 @ 0 to: center) strokeColor: Color gray.
	line2 := (NcLine from: 0 @ 0 to: center)
		         strokeColor: Color black;
		         strokeWidth: 28.


	space root
		addChild: line1;
		addChild: line2.
	space show.

	space addEventHandlerOn: BlMouseMoveEvent do: [ :mousePos |
		line1 from: 0 @ 0 to: mousePos position - center.
		line1 transform
			translateBy: 300 @ 300;
			apply.
		"In this example, after the vector is normalized, it’s multiplied by 50. Note that no matter where the mouse is, the vector always has the same length (50) because of the normalization process."
		line2 from: 0 @ 0 to: (mousePos position - center) normalize * 50.
		line2 transform
			translateBy: 300 @ 300;
			apply ]
]

{ #category : 'example' }
NcExample class >> chapter1Example7 [
	"motion 101 (velocity)"

	<script>
	| mover space |
	space := NcSpace new.
	mover := NcMover new
		         strokeColor: Color red;
		         strokeWidth: 4.
	"in this example there is no acceleration"
	mover acceleration: 0@0.
	space root addChild: mover.
	space show.
	space drawAnimation: [
		mover update.
		mover checkEdges ]
]

{ #category : 'example' }
NcExample class >> chapter1Example8 [
	"motion 101 (velocity and costant acceleration)"

	<script>
	| mover space |
	space := NcSpace new.
	mover := NcMover new
		         strokeColor: Color red;
		         strokeWidth: 4.
	space root addChild: mover.
	space show.
	space drawAnimation: [
		mover update.
		mover checkEdges ]
]

{ #category : 'example' }
NcExample class >> chapter1Example9 [
	"motion 101 (velocity and random acceleration)"

	<script>
	| mover space |
	space := NcSpace new.
	mover := NcMover new
		         strokeColor: Color red;
		         strokeWidth: 4.
	space root addChild: mover.
	space show.
	space drawAnimation: [ "we randomize the acceleration at every frame"
		mover acceleration:
			(Random new nextBetween: -1 and: 1) @ (Random new nextBetween: -1 and: 1)
			* (Random new nextBetween: 0 and: 2).
		mover acceleration traceCr.
		mover update.
		mover checkEdges ]
]

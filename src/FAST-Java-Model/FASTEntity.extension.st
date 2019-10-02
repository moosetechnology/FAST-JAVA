Extension { #name : #FASTEntity }

{ #category : #'*FAST-Java-Model-accessing' }
FASTEntity >> javaLambdaExpressionOwner [
	"Relation named: #javaLambdaExpressionOwner type: #FASTJavaLambdaExpression opposite: #expression"

	<generated>
	<MSEComment: 'The expression owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaLambdaExpressionOwner type: #FASTJavaLambdaExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaLambdaExpressionOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTEntity >> javaLambdaExpressionOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaLambdaExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaLambdaExpressionOwner.
		self privateState attributeAt: #javaLambdaExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaLambdaExpressionOwner put: anObject.
		anObject expression: self ]
]

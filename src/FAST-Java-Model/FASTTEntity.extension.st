Extension { #name : 'FASTTEntity' }

{ #category : '*FAST-Java-Model-accessing' }
FASTTEntity >> javaLambdaExpressionOwner [
	"Relation named: #javaLambdaExpressionOwner type: #FASTJavaLambdaExpression opposite: #expression"

	<generated>
	<FMComment: 'The expression owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #javaLambdaExpressionOwner type: #FASTJavaLambdaExpression opposite: #expression>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #javaLambdaExpressionOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTEntity >> javaLambdaExpressionOwner: anObject [

	<generated>
	(self attributeAt: #javaLambdaExpressionOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaLambdaExpressionOwner.
		self attributeAt: #javaLambdaExpressionOwner put: anObject.
		otherSide expression: nil ]
	ifNotNil: [ 
		self attributeAt: #javaLambdaExpressionOwner put: anObject.
		anObject expression: self ]
]

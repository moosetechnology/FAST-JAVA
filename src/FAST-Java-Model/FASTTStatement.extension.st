Extension { #name : 'FASTTStatement' }

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> forIncrementorOwner [
	"Relation named: #forIncrementorOwner type: #FASTJavaForStatement opposite: #incrementor"

	<generated>
	<FMComment: 'I am the incrementor of the for'>
	<container>
	<derived>
	<FMProperty: #forIncrementorOwner type: #FASTJavaForStatement opposite: #incrementor>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #forIncrementorOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> forIncrementorOwner: anObject [

	<generated>
	(self attributeAt: #forIncrementorOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forIncrementorOwner.
		self attributeAt: #forIncrementorOwner put: anObject.
		otherSide incrementor: nil ]
	ifNotNil: [ 
		self attributeAt: #forIncrementorOwner put: anObject.
		anObject incrementor: self ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> forIninitializerOwner [
	"Relation named: #forIninitializerOwner type: #FASTJavaForStatement opposite: #initializer"

	<generated>
	<FMComment: 'I am the initializer of the for'>
	<container>
	<derived>
	<FMProperty: #forIninitializerOwner type: #FASTJavaForStatement opposite: #initializer>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #forIninitializerOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> forIninitializerOwner: anObject [

	<generated>
	(self attributeAt: #forIninitializerOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forIninitializerOwner.
		self attributeAt: #forIninitializerOwner put: anObject.
		otherSide initializer: nil ]
	ifNotNil: [ 
		self attributeAt: #forIninitializerOwner put: anObject.
		anObject initializer: self ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> ifElsePartOwner [
	"Relation named: #ifElsePartOwner type: #FASTJavaIfStatement opposite: #elsePart"

	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #ifElsePartOwner type: #FASTJavaIfStatement opposite: #elsePart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #ifElsePartOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> ifElsePartOwner: anObject [

	<generated>
	(self attributeAt: #ifElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifElsePartOwner.
		self attributeAt: #ifElsePartOwner put: anObject.
		otherSide elsePart: nil ]
	ifNotNil: [ 
		self attributeAt: #ifElsePartOwner put: anObject.
		anObject elsePart: self ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> ifThenPartOwner [
	"Relation named: #ifThenPartOwner type: #FASTJavaIfStatement opposite: #thenPart"

	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #ifThenPartOwner type: #FASTJavaIfStatement opposite: #thenPart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #ifThenPartOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> ifThenPartOwner: anObject [

	<generated>
	(self attributeAt: #ifThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifThenPartOwner.
		self attributeAt: #ifThenPartOwner put: anObject.
		otherSide thenPart: nil ]
	ifNotNil: [ 
		self attributeAt: #ifThenPartOwner put: anObject.
		anObject thenPart: self ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> labelStatementOwner [
	"Relation named: #labelStatementOwner type: #FASTJavaLabeledStatement opposite: #labeledStatement"

	<generated>
	<FMComment: 'Label Statement entity containing this statement'>
	<container>
	<derived>
	<FMProperty: #labelStatementOwner type: #FASTJavaLabeledStatement opposite: #labeledStatement>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #labelStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model-accessing' }
FASTTStatement >> labelStatementOwner: anObject [

	<generated>
	(self attributeAt: #labelStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self labelStatementOwner.
		self attributeAt: #labelStatementOwner put: anObject.
		otherSide labeledStatement: nil ]
	ifNotNil: [ 
		self attributeAt: #labelStatementOwner put: anObject.
		anObject labeledStatement: self ]
]

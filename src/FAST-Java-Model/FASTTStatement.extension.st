Extension { #name : 'FASTTStatement' }

{ #category : '*FAST-Java-Model' }
FASTTStatement >> forIncrementorOwner [
	"Relation named: #forIncrementorOwner type: #FASTJavaForStatement opposite: #incrementors"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'I am an incrementor of the for'>
	<container>
	<FMProperty: #forIncrementorOwner type: #FASTJavaForStatement opposite: #incrementors>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #forIncrementorOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> forIncrementorOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	self attributeAt: #forIncrementorOwner put: (FMMultivalueLink on: self update: #incrementors from: self forIncrementorOwner to: anObject).
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> forIninitializerOwner [
	"Relation named: #forIninitializerOwner type: #FASTJavaForStatement opposite: #initializers"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'I am an initializer of the for'>
	<container>
	<FMProperty: #forIninitializerOwner type: #FASTJavaForStatement opposite: #initializers>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #forIninitializerOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> forIninitializerOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	self attributeAt: #forIninitializerOwner put: (FMMultivalueLink on: self update: #initializers from: self forIninitializerOwner to: anObject).
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> ifElsePartOwner [
	"Relation named: #ifElsePartOwner type: #FASTJavaIfStatement opposite: #elsePart"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #ifElsePartOwner type: #FASTJavaIfStatement opposite: #elsePart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #ifElsePartOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> ifElsePartOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #ifElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifElsePartOwner.
		self attributeAt: #ifElsePartOwner put: anObject.
		otherSide elsePart: nil ]
	ifNotNil: [ 
		self attributeAt: #ifElsePartOwner put: anObject.
		anObject elsePart: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> ifThenPartOwner [
	"Relation named: #ifThenPartOwner type: #FASTJavaIfStatement opposite: #thenPart"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<FMProperty: #ifThenPartOwner type: #FASTJavaIfStatement opposite: #thenPart>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #ifThenPartOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> ifThenPartOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #ifThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifThenPartOwner.
		self attributeAt: #ifThenPartOwner put: anObject.
		otherSide thenPart: nil ]
	ifNotNil: [ 
		self attributeAt: #ifThenPartOwner put: anObject.
		anObject thenPart: self ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> labelStatementOwner [
	"Relation named: #labelStatementOwner type: #FASTJavaLabeledStatement opposite: #labeledStatement"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'Label Statement entity containing this statement'>
	<container>
	<derived>
	<FMProperty: #labelStatementOwner type: #FASTJavaLabeledStatement opposite: #labeledStatement>
	<package: #'FAST-Java-Model'>
	^ self attributeAt: #labelStatementOwner ifAbsent: [ nil ]
]

{ #category : '*FAST-Java-Model' }
FASTTStatement >> labelStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	<package: #'FAST-Java-Model'>

	(self attributeAt: #labelStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self labelStatementOwner.
		self attributeAt: #labelStatementOwner put: anObject.
		otherSide labeledStatement: nil ]
	ifNotNil: [ 
		self attributeAt: #labelStatementOwner put: anObject.
		anObject labeledStatement: self ]
]

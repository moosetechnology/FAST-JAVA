Extension { #name : #FASTStatement }

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> doBodyOwner [
	"Relation named: #doBodyOwner type: #FASTJavaDoWhileStatement opposite: #body"

	<generated>
	<MSEComment: 'I am the body of the do'>
	<container>
	<derived>
	<MSEProperty: #doBodyOwner type: #FASTJavaDoWhileStatement opposite: #body>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #doBodyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> doBodyOwner: anObject [

	<generated>
	(self privateState attributeAt: #doBodyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self doBodyOwner.
		self privateState attributeAt: #doBodyOwner put: anObject.
		otherSide body: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #doBodyOwner put: anObject.
		anObject body: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forBodyOwner [
	"Relation named: #forBodyOwner type: #FASTJavaForStatement opposite: #body"

	<generated>
	<MSEComment: 'I am the body of the for'>
	<container>
	<derived>
	<MSEProperty: #forBodyOwner type: #FASTJavaForStatement opposite: #body>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forBodyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forBodyOwner: anObject [

	<generated>
	(self privateState attributeAt: #forBodyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forBodyOwner.
		self privateState attributeAt: #forBodyOwner put: anObject.
		otherSide body: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #forBodyOwner put: anObject.
		anObject body: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIncrementorOwner [
	"Relation named: #forIncrementorOwner type: #FASTJavaForStatement opposite: #incrementor"

	<generated>
	<MSEComment: 'I am the incrementor of the for'>
	<container>
	<derived>
	<MSEProperty: #forIncrementorOwner type: #FASTJavaForStatement opposite: #incrementor>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forIncrementorOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIncrementorOwner: anObject [

	<generated>
	(self privateState attributeAt: #forIncrementorOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forIncrementorOwner.
		self privateState attributeAt: #forIncrementorOwner put: anObject.
		otherSide incrementor: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #forIncrementorOwner put: anObject.
		anObject incrementor: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIninitializerOwner [
	"Relation named: #forIninitializerOwner type: #FASTJavaForStatement opposite: #initializer"

	<generated>
	<MSEComment: 'I am the initializer of the for'>
	<container>
	<derived>
	<MSEProperty: #forIninitializerOwner type: #FASTJavaForStatement opposite: #initializer>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forIninitializerOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIninitializerOwner: anObject [

	<generated>
	(self privateState attributeAt: #forIninitializerOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self forIninitializerOwner.
		self privateState attributeAt: #forIninitializerOwner put: anObject.
		otherSide initializer: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #forIninitializerOwner put: anObject.
		anObject initializer: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifElsePartOwner [
	"Relation named: #ifElsePartOwner type: #FASTJavaIfStatement opposite: #elsePart"

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #ifElsePartOwner type: #FASTJavaIfStatement opposite: #elsePart>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #ifElsePartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifElsePartOwner: anObject [

	<generated>
	(self privateState attributeAt: #ifElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifElsePartOwner.
		self privateState attributeAt: #ifElsePartOwner put: anObject.
		otherSide elsePart: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #ifElsePartOwner put: anObject.
		anObject elsePart: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifThenPartOwner [
	"Relation named: #ifThenPartOwner type: #FASTJavaIfStatement opposite: #thenPart"

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #ifThenPartOwner type: #FASTJavaIfStatement opposite: #thenPart>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #ifThenPartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifThenPartOwner: anObject [

	<generated>
	(self privateState attributeAt: #ifThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self ifThenPartOwner.
		self privateState attributeAt: #ifThenPartOwner put: anObject.
		otherSide thenPart: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #ifThenPartOwner put: anObject.
		anObject thenPart: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaCatchPartStatementOwner [
	"Relation named: #javaCatchPartStatementOwner type: #FASTJavaCatchPartStatement opposite: #body"

	<generated>
	<MSEComment: 'The javaCatchPartStatementOwner owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaCatchPartStatementOwner type: #FASTJavaCatchPartStatement opposite: #body>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCatchPartStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaCatchPartStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCatchPartStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaCatchPartStatementOwner.
		self privateState attributeAt: #javaCatchPartStatementOwner put: anObject.
		otherSide body: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaCatchPartStatementOwner put: anObject.
		anObject body: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaForEachStatementOwner [
	"Relation named: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #body"

	<generated>
	<MSEComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaForEachStatementOwner type: #FASTJavaForEachStatement opposite: #body>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaForEachStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaForEachStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaForEachStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaForEachStatementOwner.
		self privateState attributeAt: #javaForEachStatementOwner put: anObject.
		otherSide body: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaForEachStatementOwner put: anObject.
		anObject body: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaTryCatchOwner [
	"Relation named: #javaTryCatchOwner type: #FASTJavaTryCatchStatement opposite: #try"

	<generated>
	<MSEComment: 'The javaTryCatch owner (if possible)'>
	<container>
	<derived>
	<MSEProperty: #javaTryCatchOwner type: #FASTJavaTryCatchStatement opposite: #try>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaTryCatchOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaTryCatchOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaTryCatchOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self javaTryCatchOwner.
		self privateState attributeAt: #javaTryCatchOwner put: anObject.
		otherSide try: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #javaTryCatchOwner put: anObject.
		anObject try: self ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> whileBodyOwner [
	"Relation named: #whileBodyOwner type: #FASTJavaWhileStatement opposite: #body"

	<generated>
	<MSEComment: 'I am the body of the do'>
	<container>
	<derived>
	<MSEProperty: #whileBodyOwner type: #FASTJavaWhileStatement opposite: #body>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #whileBodyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> whileBodyOwner: anObject [

	<generated>
	(self privateState attributeAt: #whileBodyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self whileBodyOwner.
		self privateState attributeAt: #whileBodyOwner put: anObject.
		otherSide body: nil ]
	ifNotNil: [ 
		self privateState attributeAt: #whileBodyOwner put: anObject.
		anObject body: self ]
]

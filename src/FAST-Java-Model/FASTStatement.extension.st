Extension { #name : #FASTStatement }

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> doBodyOwner [

	<generated>
	<MSEComment: 'I am the body of the do'>
	<container>

	<MSEProperty: #doBodyOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #doBodyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> doBodyOwner: anObject [

	<generated>
	(self privateState attributeAt: #doBodyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #doBodyOwner put: anObject.
	anObject body: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forBodyOwner [

	<generated>
	<MSEComment: 'I am the body of the for'>
	<container>

	<MSEProperty: #forBodyOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forBodyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forBodyOwner: anObject [

	<generated>
	(self privateState attributeAt: #forBodyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #forBodyOwner put: anObject.
	anObject body: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIncrementorOwner [

	<generated>
	<MSEComment: 'I am the incrementor of the for'>
	<container>

	<MSEProperty: #forIncrementorOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forIncrementorOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIncrementorOwner: anObject [

	<generated>
	(self privateState attributeAt: #forIncrementorOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #forIncrementorOwner put: anObject.
	anObject incrementor: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIninitializerOwner [

	<generated>
	<MSEComment: 'I am the initializer of the for'>
	<container>

	<MSEProperty: #forIninitializerOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #forIninitializerOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> forIninitializerOwner: anObject [

	<generated>
	(self privateState attributeAt: #forIninitializerOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #forIninitializerOwner put: anObject.
	anObject initializer: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifElsePartOwner [

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>

	<MSEProperty: #ifElsePartOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #ifElsePartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifElsePartOwner: anObject [

	<generated>
	(self privateState attributeAt: #ifElsePartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #ifElsePartOwner put: anObject.
	anObject elsePart: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifThenPartOwner [

	<generated>
	<MSEComment: 'The if owner (if possible)'>
	<container>

	<MSEProperty: #ifThenPartOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #ifThenPartOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> ifThenPartOwner: anObject [

	<generated>
	(self privateState attributeAt: #ifThenPartOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #ifThenPartOwner put: anObject.
	anObject thenPart: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaCatchPartStatementOwner [

	<generated>
	<MSEComment: 'The javaCatchPartStatementOwner owner (if possible)'>
	<container>

	<MSEProperty: #javaCatchPartStatementOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaCatchPartStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaCatchPartStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaCatchPartStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaCatchPartStatementOwner put: anObject.
	anObject body: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaForEachStatementOwner [

	<generated>
	<MSEComment: 'The javaForEachStatement owner (if possible)'>
	<container>

	<MSEProperty: #javaForEachStatementOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaForEachStatementOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaForEachStatementOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaForEachStatementOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaForEachStatementOwner put: anObject.
	anObject body: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaTryCatchOwner [

	<generated>
	<MSEComment: 'The javaTryCatch owner (if possible)'>
	<container>

	<MSEProperty: #javaTryCatchOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #javaTryCatchOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> javaTryCatchOwner: anObject [

	<generated>
	(self privateState attributeAt: #javaTryCatchOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #javaTryCatchOwner put: anObject.
	anObject try: self
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> whileBodyOwner [

	<generated>
	<MSEComment: 'I am the body of the do'>
	<container>

	<MSEProperty: #whileBodyOwner type: #Object>
	<package: #'FAST-Java-Model'>
	^ self privateState attributeAt: #whileBodyOwner ifAbsent: [ nil ]
]

{ #category : #'*FAST-Java-Model-accessing' }
FASTStatement >> whileBodyOwner: anObject [

	<generated>
	(self privateState attributeAt: #whileBodyOwner ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #whileBodyOwner put: anObject.
	anObject body: self
]

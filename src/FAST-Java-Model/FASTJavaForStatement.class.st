"
A node of a for loop statement.

eg.
for(_;_;_) {
...
}
"
Class {
	#name : #FASTJavaForStatement,
	#superclass : #FASTStatement,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaForStatement class >> annotation [

	<MSEClass: #ForStatement super: #FASTStatement>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaForStatement class >> generatedSlotNames [
	<generated>
	'FASTJavaForStatement class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaForStatement class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaForStatement class >> requirements [

	<generated>
	^ {  }
]

{ #category : #accessing }
FASTJavaForStatement >> body [

	<generated>
	<MSEComment: 'A statement to be evaluated in the loop'>
	<MSEProperty: #body type: #Object>
	^ self privateState attributeAt: #body ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> body: anObject [

	<generated>
	(self privateState attributeAt: #body ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #body put: anObject.
	anObject forBodyOwner: self
]

{ #category : #navigation }
FASTJavaForStatement >> bodyGroup [

	<generated>
	<navigation: 'Body'>
	^ MooseGroup
			with: (self body)
]

{ #category : #accessing }
FASTJavaForStatement >> condition [

	<generated>
	<MSEComment: 'The condition of the statement'>
	<MSEProperty: #condition type: #Object>
	^ self privateState attributeAt: #condition ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> condition: anObject [

	<generated>
	(self privateState attributeAt: #condition ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #condition put: anObject.
	anObject forConditionOwner: self
]

{ #category : #navigation }
FASTJavaForStatement >> conditionGroup [

	<generated>
	<navigation: 'Condition'>
	^ MooseGroup
			with: (self condition)
]

{ #category : #accessing }
FASTJavaForStatement >> incrementor [

	<generated>
	<MSEComment: 'Expression evaluated at the end of each loop'>
	<MSEProperty: #incrementor type: #Object>
	^ self privateState attributeAt: #incrementor ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> incrementor: anObject [

	<generated>
	(self privateState attributeAt: #incrementor ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #incrementor put: anObject.
	anObject forIncrementorOwner: self
]

{ #category : #navigation }
FASTJavaForStatement >> incrementorGroup [

	<generated>
	<navigation: 'Incrementor'>
	^ MooseGroup
			with: (self incrementor)
]

{ #category : #accessing }
FASTJavaForStatement >> initializer [

	<generated>
	<MSEComment: 'Expression used at initialization phase of a for loop'>
	<MSEProperty: #initializer type: #Object>
	^ self privateState attributeAt: #initializer ifAbsent: [ nil ]
]

{ #category : #accessing }
FASTJavaForStatement >> initializer: anObject [

	<generated>
	(self privateState attributeAt: #initializer ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	self privateState attributeAt: #initializer put: anObject.
	anObject forIninitializerOwner: self
]

{ #category : #navigation }
FASTJavaForStatement >> initializerGroup [

	<generated>
	<navigation: 'Initializer'>
	^ MooseGroup
			with: (self initializer)
]

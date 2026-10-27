Class {
	#name : 'JavaSmaCCQualifiedSuperTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedSuperTest >> invocationNamed: aName [

	^ (fastModel allWithType: FASTJavaMethodInvocation) detect: [ :each | each name = aName ]
]

{ #category : 'resources' }
JavaSmaCCQualifiedSuperTest >> javaMethod [
	^ 'void newMethod() {
	Walker.super.walk();
	super.run();
	int depth = Walker.super.depth;
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedSuperTest >> testFieldAccessQualifiedBySuperKeepsBothNames [
	"JLS 15.11.2: `Walker.super.depth` reads the depth the superinterface Walker declares,
	which is not the depth Walker itself declares."

	| access |
	access := (fastModel allWithType: FASTJavaFieldAccess) detect: [ :each | each fieldName = 'depth' ].
	self assert: access receiver fieldName equals: 'super'.
	self assert: access receiver receiver name equals: 'Walker'
]

{ #category : 'tests' }
JavaSmaCCQualifiedSuperTest >> testInvocationOnSuperAloneKeepsItsReceiver [
	"JLS 15.12.1: `super.run()` names no type before super, and the one name it writes
	stays the receiver."

	self assert: (self invocationNamed: 'run') receiver name equals: 'super'
]

{ #category : 'tests' }
JavaSmaCCQualifiedSuperTest >> testInvocationQualifiedBySuperKeepsBothNames [
	"JLS 15.12.1: `Walker.super.walk()` calls the walk the superinterface Walker declares,
	so the receiver is Walker and super together; Walker alone would call another method."

	| receiver |
	receiver := (self invocationNamed: 'walk') receiver.
	self assert: receiver class equals: FASTJavaFieldAccess.
	self assert: receiver fieldName equals: 'super'.
	self assert: receiver receiver name equals: 'Walker'
]

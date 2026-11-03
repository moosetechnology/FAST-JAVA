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
JavaSmaCCQualifiedSuperTest >> testAReferenceOnSuperAloneKeepsItsReceiver [
	"JLS 15.13: `super::m` names a method of the superclass, and the keyword it writes is
	the receiver, as it is for an invocation and for a field access."

	| model reference |
	model := self parseMethodString: 'void m() { Runnable r = super::run; }'.
	reference := (model allWithType: FASTJavaMethodReference) anyOne.
	self assert: reference receiver class equals: FASTJavaSuper.
	self assert: reference receiver type isNil
]

{ #category : 'tests' }
JavaSmaCCQualifiedSuperTest >> testFieldAccessQualifiedBySuperKeepsBothNames [
	"JLS 15.11.2: `Walker.super.depth` reads the depth the superinterface Walker declares,
	which is not the depth Walker itself declares."

	| access |
	access := (fastModel allWithType: FASTJavaFieldAccess) detect: [ :each | each fieldName = 'depth' ].
	self assert: access receiver class equals: FASTJavaSuper.
	self assert: access receiver type fullName equals: 'Walker'
]

{ #category : 'tests' }
JavaSmaCCQualifiedSuperTest >> testInvocationOnSuperAloneKeepsItsReceiver [
	"JLS 15.12.1: `super.run()` writes no type name before the keyword, and the keyword is
	still the receiver."

	| receiver |
	receiver := (self invocationNamed: 'run') receiver.
	self assert: receiver class equals: FASTJavaSuper.
	self assert: receiver type isNil
]

{ #category : 'tests' }
JavaSmaCCQualifiedSuperTest >> testInvocationQualifiedBySuperKeepsBothNames [
	"JLS 15.12.1: `Walker.super.walk()` calls the walk the superinterface Walker declares,
	so the receiver is the keyword qualified by Walker; Walker alone would call another
	method."

	| receiver |
	receiver := (self invocationNamed: 'walk') receiver.
	self assert: receiver class equals: FASTJavaSuper.
	self assert: receiver type fullName equals: 'Walker'
]

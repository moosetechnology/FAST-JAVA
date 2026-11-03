Class {
	#name : 'JavaSmaCCQualifiedThisTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedThisTest >> javaMethod [
	^ 'void outerThis() {
	call(Hello.this);
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedThisTest >> testQualifiedThisAsChild [
	self assert: (fastModel allWithType: FASTJavaThis) anyOne equals: fastMethod statements anyOne expression arguments anyOne
]

{ #category : 'tests' }
JavaSmaCCQualifiedThisTest >> testQualifiedThisParent [
	self assert: (fastModel allWithType: FASTJavaThis) anyOne parentNode equals: fastMethod statements anyOne expression
]

{ #category : 'tests' }
JavaSmaCCQualifiedThisTest >> testQualifiedThisSize [
	self assert: (fastModel allWithType: FASTJavaThis) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCQualifiedThisTest >> testQualifiedThisType [
	self assert: (fastModel allWithType: FASTJavaThis) anyOne type name equals: 'Hello'
]

{ #category : 'tests' }
JavaSmaCCQualifiedThisTest >> testQualifierIsATypeName [
	"JLS 15.8.4: a qualified `this` writes a type name before the dot, so a dotted qualifier
	is a chain of type names and not the ambiguous dotted name a value would be read as."

	| model qualifiedThis |
	model := self parseMethodString: 'void m() { call(p.q.Outer.this); }'.
	qualifiedThis := (model allWithType: FASTJavaThis) anyOne.
	self assert: qualifiedThis type class equals: FASTJavaQualifiedTypeName.
	self assert: qualifiedThis type fullName equals: 'p.q.Outer'
]

{ #category : 'tests' }
JavaSmaCCQualifiedThisTest >> testThisAloneIsTheSameEntityWithNoQualifier [
	"JLS 15.8.3: `this` alone names the innermost instance, and it is the same keyword as
	the one `Outer.this` qualifies — one entity, wherever it stands."

	| model |
	model := self parseMethodString: 'void m() { call(this); this.go(); return this; }'.
	self assert: (model allWithType: FASTJavaThis) size equals: 3.
	self assert: ((model allWithType: FASTJavaThis) allSatisfy: [ :each | each type isNil ])
]

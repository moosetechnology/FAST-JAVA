Class {
	#name : 'JavaSmaCCOuterThisTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCOuterThisTest >> javaMethod [
	^ 'void outerThis() {
	call(Hello.this);
}'
]

{ #category : 'tests' }
JavaSmaCCOuterThisTest >> testOuterThisAsChild [
	self assert: (fastModel allWithType: FASTJavaOuterThis) anyOne equals: fastMethod statements anyOne expression arguments anyOne
]

{ #category : 'tests' }
JavaSmaCCOuterThisTest >> testOuterThisParent [
	self assert: (fastModel allWithType: FASTJavaOuterThis) anyOne parentNode equals: fastMethod statements anyOne expression
]

{ #category : 'tests' }
JavaSmaCCOuterThisTest >> testOuterThisQualifierIsATypeName [
	"JLS 15.8.4: a qualified `this` writes a type name before the dot, so a dotted qualifier
	is a chain of type names and not the ambiguous dotted name a value would be read as."

	| model outerThis |
	model := self parseMethodString: 'void m() { call(p.q.Outer.this); }'.
	outerThis := (model allWithType: FASTJavaOuterThis) anyOne.
	self assert: outerThis type class equals: FASTJavaQualifiedTypeName.
	self assert: outerThis type fullName equals: 'p.q.Outer'
]

{ #category : 'tests' }
JavaSmaCCOuterThisTest >> testOuterThisSize [
	self assert: (fastModel allWithType: FASTJavaOuterThis ) size equals: 1
]

{ #category : 'tests' }
JavaSmaCCOuterThisTest >> testOuterThisType [
	self assert: (fastModel allWithType: FASTJavaOuterThis) anyOne type name equals: 'Hello'
]

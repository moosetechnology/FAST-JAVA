Class {
	#name : #JavaSmaCCSourceTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #tests }
JavaSmaCCSourceTest >> classString [
	^ 'class A {
	void hello() {
		int i = 0;
	}
}' 
]

{ #category : #tests }
JavaSmaCCSourceTest >> methodString [
	^ 'void hello() {
	int i = 0;
}' 
]

{ #category : #tests }
JavaSmaCCSourceTest >> testAccessToClassSourceText [
	| model |
	model := self parseClassString: self classString.
	self assert: (model allWithType: FASTJavaMethodEntity) anyOne sourceText equals: self classString.
	self assert: (model allWithType: FASTJavaClassDeclaration) anyOne sourceText equals: self classString.
	self assert: (model allWithType: FASTJavaMethodEntity) anyOne sourceCode equals: 'void hello() {
		int i = 0;
	}'
]

{ #category : #tests }
JavaSmaCCSourceTest >> testAccessToMethodSourceText [
	| model |
	model := self parseMethodString: self methodString.
	self assert: (model allWithType: FASTJavaMethodEntity) anyOne sourceText equals: self methodString
]

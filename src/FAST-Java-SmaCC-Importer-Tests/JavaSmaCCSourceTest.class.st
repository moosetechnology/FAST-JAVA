Class {
	#name : 'JavaSmaCCSourceTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaClass [
	^ 'class A {
	void hello() {
		int i = 0;
	}
}' 
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> javaMethod [
	^ 'void hello() {
	int i = 0;
}' 
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testAccessToClassSourceText [

	fastModel := self parseClassString: self javaClass.

	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: self javaClass.
	self assert: (fastModel allWithType: FASTJavaClassDeclaration) anyOne sourceText equals: self javaClass.
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceCode equals: 'void hello() {
		int i = 0;
	}'
]

{ #category : 'tests' }
JavaSmaCCSourceTest >> testAccessToMethodSourceText [

	fastModel := self parseMethodString: self javaMethod.
	
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: self javaMethod
]

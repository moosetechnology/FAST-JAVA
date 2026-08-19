Class {
	#name : 'JavaSmaCCEmptyMethodDeclarationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCEmptyMethodDeclarationTest >> javaMethod [
	^ 'void newMethod() {
	new Patate() {
		;
	};
}'
]

{ #category : 'tests' }
JavaSmaCCEmptyMethodDeclarationTest >> testEmptyDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaEmptyMethodDeclaration) size equals: 1
]

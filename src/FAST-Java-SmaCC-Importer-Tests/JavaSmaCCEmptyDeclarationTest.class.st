Class {
	#name : 'JavaSmaCCEmptyDeclarationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCEmptyDeclarationTest >> javaMethod [
	^ 'void newMethod() {
	new Patate() {
		;
	};
}'
]

{ #category : 'tests' }
JavaSmaCCEmptyDeclarationTest >> testEmptyDeclarationIsNotAMethod [
	"JLS 8.1.6: a bare `;` declares nothing, so it is not one of the methods a reader asks the
	model for."

	self assert: (fastModel allWithType: FASTJavaMethodEntity) size equals: 1.
	self deny: ((fastModel allWithType: FASTJavaEmptyDeclaration) anyOne isKindOf: FASTJavaMethodEntity)
]

{ #category : 'tests' }
JavaSmaCCEmptyDeclarationTest >> testEmptyDeclarationSize [
	self assert: (fastModel allWithType: FASTJavaEmptyDeclaration) size equals: 1
]

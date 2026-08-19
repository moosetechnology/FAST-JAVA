Class {
	#name : 'JavaSmaCCAttributeInitializationInEnumTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAttributeInitializationInEnumTest >> javaClass [
	^ 'enum AnEnum {
	CONST1, CONST2;
	AnEnum aField = CONST1;
}'
]

{ #category : 'as yet unclassified' }
JavaSmaCCAttributeInitializationInEnumTest >> testNumberOfDeclarationsInEnum [
	self
		assert: (fastModel allWithType: FASTJavaEnumDeclaration) anyOne declarations size
equals: 1
]

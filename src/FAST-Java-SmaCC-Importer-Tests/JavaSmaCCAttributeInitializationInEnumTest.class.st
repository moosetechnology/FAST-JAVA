Class {
	#name : 'JavaSmaCCAttributeInitializationInEnumTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCAttributeInitializationInEnumTest >> enumString [
	
	^ 'enum AnEnum {
  CONST1, CONST2;
  AnEnum aField = CONST1;
}'
]

{ #category : 'running' }
JavaSmaCCAttributeInitializationInEnumTest >> javaMethod [
	self shouldNotImplement
]

{ #category : 'running' }
JavaSmaCCAttributeInitializationInEnumTest >> setUp [

	fastModel := self parseClassString: self enumString
]

{ #category : 'tests' }
JavaSmaCCAttributeInitializationInEnumTest >> testNumberOfDeclarationsInEnum [
	self
		assert: (fastModel allWithType: FASTJavaEnumDeclaration) anyOne declarations size
equals: 1
]

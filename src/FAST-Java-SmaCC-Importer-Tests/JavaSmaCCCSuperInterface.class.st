Class {
	#name : 'JavaSmaCCCSuperInterface',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCSuperInterface >> javaClass [
	^ 'public interface AnInterface extends ASuperInterface {
}'
]

{ #category : 'initialization' }
JavaSmaCCCSuperInterface >> testSuperInterface [

	| interfaceDecl |
	interfaceDecl := (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne.

	self assert: interfaceDecl interfaces size equals: 1.
	self
		assert: interfaceDecl interfaces anyOne typeName name
		equals: #ASuperInterface
]

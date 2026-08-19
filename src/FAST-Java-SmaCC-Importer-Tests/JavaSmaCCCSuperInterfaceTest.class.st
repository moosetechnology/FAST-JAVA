Class {
	#name : 'JavaSmaCCCSuperInterfaceTest',
	#superclass : 'JavaSmaCCClassImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCCSuperInterfaceTest >> javaClass [
	^ 'public interface AnInterface extends ASuperInterface {}'
]

{ #category : 'initialization' }
JavaSmaCCCSuperInterfaceTest >> testSuperInterface [

	| interfaceDecl |
	interfaceDecl := (fastModel allWithType: FASTJavaInterfaceDeclaration) anyOne.

	self assert: interfaceDecl interfaces size equals: 1.
	self
		assert: interfaceDecl interfaces anyOne typeName name
		equals: #ASuperInterface
]

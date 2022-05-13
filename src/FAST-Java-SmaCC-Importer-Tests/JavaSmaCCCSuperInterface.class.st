Class {
	#name : #JavaSmaCCCSuperInterface,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'interface'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
JavaSmaCCCSuperInterface >> aSuperInterface [
	^ 'public interface AnInterface extends ASuperInterface {
}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCCSuperInterface >> setUp [
	super setUp.
	interface := ((self parseClassString: self aSuperInterface)
		allWithType: FASTJavaInterfaceDeclaration) anyOne
]

{ #category : #'as yet unclassified' }
JavaSmaCCCSuperInterface >> testSuperInterface [

	self assert: interface interfaces size equals: 1.
	self
		assert: interface interfaces anyOne typeName name
		equals: #ASuperInterface
]

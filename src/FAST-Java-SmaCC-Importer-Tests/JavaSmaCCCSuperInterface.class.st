Class {
	#name : #JavaSmaCCCSuperInterface,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCCSuperInterface >> aSuperInterface [
	^ 'public interface AnInterface extends ASuperInterface {
}'
]

{ #category : #initialization }
JavaSmaCCCSuperInterface >> setUp [
	fastModel := ((self parseClassString: self aSuperInterface)
		allWithType: FASTJavaInterfaceDeclaration) anyOne
]

{ #category : #initialization }
JavaSmaCCCSuperInterface >> testSuperInterface [

	self assert: fastModel interfaces size equals: 1.
	self
		assert: fastModel interfaces anyOne typeName name
		equals: #ASuperInterface
]

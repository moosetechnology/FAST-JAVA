Class {
	#name : 'JavaSmaCCArrayInitializationTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCArrayInitializationTest >> javaMethod [
	^ 'void arrayAccess() {
	String[] hello = {"hello", "world"};
}'
]

{ #category : 'tests' }
JavaSmaCCArrayInitializationTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaArrayInitializer) first initializers size equals: 2
]

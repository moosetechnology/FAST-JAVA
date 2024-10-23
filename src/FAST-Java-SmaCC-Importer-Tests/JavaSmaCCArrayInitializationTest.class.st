Class {
	#name : 'JavaSmaCCArrayInitializationTest',
	#superclass : 'JavaSmaCCImporterTest',
	#instVars : [
		'methodNewArray'
	],
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'accessing' }
JavaSmaCCArrayInitializationTest >> javaMethod [
	^ 'void arrayAccess() {
   String[] hello = {"hello", "world"};
}'
]

{ #category : 'tests' }
JavaSmaCCArrayInitializationTest >> testNumberOfInitializedElement [
	self assert: (fastModel allWithType: FASTJavaArrayInitializer) first initializers size equals: 2
]

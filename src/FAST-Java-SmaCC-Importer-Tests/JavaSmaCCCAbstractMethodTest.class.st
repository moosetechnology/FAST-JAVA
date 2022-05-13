Class {
	#name : #JavaSmaCCCAbstractMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'method'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCCAbstractMethodTest >> abstractMethod [
	^ 'public interface AnInterface {
	void anAbstractMethod(Map<String, Serializable> mapObjects, Map<String, Serializable> mapIds);
}'
]

{ #category : #resources }
JavaSmaCCCAbstractMethodTest >> setUp [
	super setUp.
	method := (self parseClassString: self abstractMethod)
		allFASTJavaMethodEntity first
]

{ #category : #resources }
JavaSmaCCCAbstractMethodTest >> testAbstractMethodName [

	self assert: method name equals: #anAbstractMethod
]

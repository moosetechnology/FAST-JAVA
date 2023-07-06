Class {
	#name : #JavaSmaCCCAbstractMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCCAbstractMethodTest >> abstractMethod [
	^ 'public interface AnInterface {
	void anAbstractMethod(Map<String, Serializable> mapObjects, Map<String, Serializable> mapIds);
}'
]

{ #category : #accessing }
JavaSmaCCCAbstractMethodTest >> javaMethod [
	^ self shouldBeImplemented
]

{ #category : #running }
JavaSmaCCCAbstractMethodTest >> setUp [

	fastModel := (self parseClassString: self abstractMethod)
		allFASTJavaMethodEntity first
]

{ #category : #resources }
JavaSmaCCCAbstractMethodTest >> testAbstractMethodName [

	self assert: fastModel name equals: #anAbstractMethod
]

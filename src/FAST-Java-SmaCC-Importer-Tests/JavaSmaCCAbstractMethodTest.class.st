Class {
	#name : 'JavaSmaCCAbstractMethodTest',
	#superclass : 'JavaSmaCCImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCAbstractMethodTest >> abstractMethod [
	^ 'public interface AnInterface {
	void anAbstractMethod(Map<String, Serializable> mapObjects, Map<String, Serializable> mapIds);
}'
]

{ #category : 'accessing' }
JavaSmaCCAbstractMethodTest >> javaMethod [
	^ self shouldBeImplemented
]

{ #category : 'running' }
JavaSmaCCAbstractMethodTest >> parseExpressionString: aString [

	^ JavaSmaCCProgramNodeImporterVisitor new getExpressionAST: aString
]

{ #category : 'running' }
JavaSmaCCAbstractMethodTest >> setUp [

	fastModel := (self parseClassString: self abstractMethod)
		allFASTJavaMethodEntity first
]

{ #category : 'resources' }
JavaSmaCCAbstractMethodTest >> testAbstractMethodName [

	self assert: fastModel name equals: #anAbstractMethod
]

Class {
	#name : #JavaSmaCCMethodNoTypeTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #accessing }
JavaSmaCCMethodNoTypeTest >> javaMethod [
	 ^ 'hello(){}'
]

{ #category : #tests }
JavaSmaCCMethodNoTypeTest >> testMethodTypeType [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne type equals: nil
]

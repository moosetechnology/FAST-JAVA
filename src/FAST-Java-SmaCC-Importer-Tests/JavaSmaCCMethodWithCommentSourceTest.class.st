Class {
	#name : #JavaSmaCCMethodWithCommentSourceTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCMethodWithCommentSourceTest >> javaMethod [
	^ '//Hello
public void ifContinue() {}'
]

{ #category : #tests }
JavaSmaCCMethodWithCommentSourceTest >> testContinueSourceText [
	self assert: (fastModel allWithType: FASTJavaMethodEntity) anyOne sourceText equals: self javaMethod
]

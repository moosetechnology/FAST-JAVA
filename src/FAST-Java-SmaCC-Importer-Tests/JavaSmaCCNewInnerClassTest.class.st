"
This class contains tests
"
Class {
	#name : 'JavaSmaCCNewInnerClassTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCNewInnerClassTest >> javaMethod [
	^ 'public void onClick(ClickEvent event) {
  view.setDisplayView(view.new InnerClass());
}'
]

{ #category : 'tests' }
JavaSmaCCNewInnerClassTest >> testNewClassType [
	self assert: fastMethod statements first children anyOne arguments anyOne class equals: FASTJavaNewExpression
]

{ #category : 'tests' }
JavaSmaCCNewInnerClassTest >> testNewName [
	self assert: fastMethod statements anyOne children anyOne arguments anyOne type fullName equals: 'InnerClass'
]

{ #category : 'tests' }
JavaSmaCCNewInnerClassTest >> testNewType [
	self assert: fastMethod statements first children anyOne class equals: FASTJavaMethodInvocation
]

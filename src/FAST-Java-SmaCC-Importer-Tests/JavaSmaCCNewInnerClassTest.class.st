"
This class contains tests
"
Class {
	#name : 'JavaSmaCCNewInnerClassTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCNewInnerClassTest >> javaMethod [
	^ 'public void onClick(ClickEvent event) {
	view.setDisplayView(view.new InnerClass());
}'
]

{ #category : 'tests' }
JavaSmaCCNewInnerClassTest >> testNewClassType [

	self assert: fastMethod statements first containedEntities anyOne arguments anyOne class equals: FASTJavaNewExpression
]

{ #category : 'tests' }
JavaSmaCCNewInnerClassTest >> testNewName [

	self assert: fastMethod statements anyOne containedEntities anyOne arguments anyOne type fullName equals: 'InnerClass'
]

{ #category : 'tests' }
JavaSmaCCNewInnerClassTest >> testNewType [

	self assert: fastMethod statements first containedEntities anyOne class equals: FASTJavaMethodInvocation
]

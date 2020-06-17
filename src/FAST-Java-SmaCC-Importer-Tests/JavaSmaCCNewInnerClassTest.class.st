"
This class contains tests
"
Class {
	#name : #JavaSmaCCNewInnerClassTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNewInnerClassTest >> methodNew [
	^ 'public void onClick(ClickEvent event) {
  view.setDisplayView(view.new InnerClass());
}'
]

{ #category : #running }
JavaSmaCCNewInnerClassTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'new') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCNewInnerClassTest >> testNewClassType [
	self assert: methodNew statements first children anyOne arguments anyOne class equals: FASTJavaNewExpression
]

{ #category : #tests }
JavaSmaCCNewInnerClassTest >> testNewName [
	self assert: methodNew statements anyOne children anyOne arguments anyOne type fullName equals: 'InnerClass'
]

{ #category : #tests }
JavaSmaCCNewInnerClassTest >> testNewType [
	self assert: methodNew statements first children anyOne class equals: FASTJavaMethodInvocation
]

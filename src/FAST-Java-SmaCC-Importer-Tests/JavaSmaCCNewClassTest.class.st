Class {
	#name : #JavaSmaCCNewClassTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNewClassTest >> methodNew [
	^ 'void newMethod() {
	new Patate() {
		public void onSuccess(){
			System.out.println("Success");
		}
		
		public void onFail(){
			System.out.println("Fail");
		}
	};
}'
]

{ #category : #running }
JavaSmaCCNewClassTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'new')
]

{ #category : #tests }
JavaSmaCCNewClassTest >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCNewClassTest >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCNewClassTest >> testNewParent [

	self
		assert:
		(methodNew allWithType: FASTJavaNewClassExpression) anyOne
			parentNode
		equals:
			(methodNew detect: [ :entity | entity mooseName = 'newMethod' ])
				statements anyOne
]

{ #category : #tests }
JavaSmaCCNewClassTest >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]

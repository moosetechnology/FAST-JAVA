Class {
	#name : #JavaSmaCCNewClassAffectedTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCNewClassAffectedTest >> methodNew [
	^ 'void newMethod() {
	new Hello().new Patate() {
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
JavaSmaCCNewClassAffectedTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'new')
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNewParent [

	self
		assert:
		(methodNew allWithType: FASTJavaNewClassExpression) anyOne
			parentNode
		equals:
			(methodNew detect: [ :entity | entity mooseName = 'newMethod' ])
				statements anyOne
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]

{ #category : #tests }
JavaSmaCCNewClassAffectedTest >> testNumberOfNewClass [
	self
		assert: (methodNew allWithType: FASTJavaNewClassExpression) size
		equals: 1
]

Class {
	#name : #JavaSmaCCArgumentNewClassTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCArgumentNewClassTest >> methodArgumentNewClass [
	^ 'void innerNewClass() {
	new Hello(new Patate() {
		public void onSuccess(){
			System.out.println("Success");
		}
		
		public void onFail(){
			System.out.println("Fail");
		}
	});
}'
]

{ #category : #running }
JavaSmaCCArgumentNewClassTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'argumentNewClass')
]

{ #category : #tests }
JavaSmaCCArgumentNewClassTest >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCArgumentNewClassTest >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCArgumentNewClassTest >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew allWithType: FASTJavaNewExpression) anyOne
]

{ #category : #tests }
JavaSmaCCArgumentNewClassTest >> testNewParentChildren [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne equals: (methodNew allWithType: FASTJavaNewExpression) anyOne arguments anyOne
]

{ #category : #tests }
JavaSmaCCArgumentNewClassTest >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]

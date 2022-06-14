Class {
	#name : #JavaSmaCCArgumentNewClassInMethodTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'methodNew'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCArgumentNewClassInMethodTest >> methodArgumentNewClass [
	^ 'void innerNewClass() {
	hello.say(new Patate() {
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
JavaSmaCCArgumentNewClassInMethodTest >> setUp [
	super setUp.
	methodNew := (self parseMethod: 'argumentNewClass')
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testDeclaredMethodSize [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNewName [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNewParent [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (methodNew allWithType: FASTJavaMethodInvocation) anyOne
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNewParentChildren [
	self assert: (methodNew allWithType: FASTJavaNewClassExpression) anyOne equals: (methodNew allWithType: FASTJavaMethodInvocation) anyOne arguments anyOne
]

{ #category : #tests }
JavaSmaCCArgumentNewClassInMethodTest >> testNumberOfMethod [
	self assert: methodNew allFASTJavaMethodEntity size equals: 3
]

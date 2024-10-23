Class {
	#name : 'JavaSmaCCNewClassTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCNewClassTest >> javaMethod [
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

{ #category : 'tests' }
JavaSmaCCNewClassTest >> testDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : 'tests' }
JavaSmaCCNewClassTest >> testNewName [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : 'tests' }
JavaSmaCCNewClassTest >> testNewParent [

	self
		assert:
		(fastModel allWithType: FASTJavaNewClassExpression) anyOne
			parentNode
		equals:
			(fastModel detect: [ :entity | entity mooseName = 'newMethod' ])
				statements anyOne
]

{ #category : 'tests' }
JavaSmaCCNewClassTest >> testNumberOfMethod [
	self assert: fastModel allFASTJavaMethodEntity size equals: 3
]

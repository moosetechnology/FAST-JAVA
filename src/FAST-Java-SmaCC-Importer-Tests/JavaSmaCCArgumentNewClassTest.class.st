Class {
	#name : 'JavaSmaCCArgumentNewClassTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCArgumentNewClassTest >> javaMethod [
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

{ #category : 'tests' }
JavaSmaCCArgumentNewClassTest >> testDeclaredMethodSize [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne declarations size equals: 2
]

{ #category : 'tests' }
JavaSmaCCArgumentNewClassTest >> testNewName [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne type fullName equals: 'Patate'
]

{ #category : 'tests' }
JavaSmaCCArgumentNewClassTest >> testNewParent [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne parentNode equals: (fastModel allWithType: FASTJavaNewExpression) anyOne
]

{ #category : 'tests' }
JavaSmaCCArgumentNewClassTest >> testNewParentChildren [
	self assert: (fastModel allWithType: FASTJavaNewClassExpression) anyOne equals: (fastModel allWithType: FASTJavaNewExpression) anyOne arguments anyOne
]

{ #category : 'tests' }
JavaSmaCCArgumentNewClassTest >> testNumberOfMethod [
	self assert: fastModel allFASTJavaMethodEntity size equals: 3
]

Class {
	#name : #JavaSmaCCInitializerTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCInitializerTest >> javaMethod [
	^ 'void initializer() {
	Button b = new Button("param1") { 
	{ addClickListener(new ClickListener(){}); }
	 };
	}'
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerAsChild [
	self assert: (fastMethod mooseModel allWithType: FASTJavaInitializer) anyOne equals: fastMethod statements anyOne declarators anyOne expression declarations anyOne
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerHasStatementBlock [
	self assert: (fastMethod mooseModel allWithType: FASTJavaInitializer) anyOne statementBlock isNotNil
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerHasStatementBlockMethodSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaInitializer) anyOne statementBlock statements size equals: 1
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerParent [
	self assert: (fastMethod mooseModel allWithType: FASTJavaInitializer) anyOne parentNode equals: fastMethod statements anyOne declarators anyOne expression
]

{ #category : #tests }
JavaSmaCCInitializerTest >> testInitializerSize [
	self assert: (fastMethod mooseModel allWithType: FASTJavaInitializer) size equals: 1 
]

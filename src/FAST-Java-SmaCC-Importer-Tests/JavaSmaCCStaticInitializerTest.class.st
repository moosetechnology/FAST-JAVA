Class {
	#name : #JavaSmaCCStaticInitializerTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCStaticInitializerTest >> javaMethod [
	^ 'void initializer() {
	Button b = new Button("param1") { 
	static { addClickListener(new ClickListener(){}); }
	 };
	}'
]

{ #category : #tests }
JavaSmaCCStaticInitializerTest >> testInitializerIsStatic [

	self assert:
		(fastMethod mooseModel allWithType: FASTJavaInitializer) anyOne
			isStatic
]

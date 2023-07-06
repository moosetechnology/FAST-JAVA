Class {
	#name : #JavaSmaCCSwitchWithInvocationConditionTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSwitchWithInvocationConditionTest >> javaMethod [
	^ 
'void switchMethod() {
	switch(a.call()) { 
		case HELLO:
			doStuff();
			break;
		case WORLD:
			doing();
		default:
			done();
	}
}
'
]

{ #category : #tests }
JavaSmaCCSwitchWithInvocationConditionTest >> testSwitchCondition [

	| switchStatement |
	switchStatement := (fastModel allWithType:
		                    FASTJavaSwitchStatement) anyOne.
	self assert: switchStatement condition class equals: FASTJavaMethodInvocation
]

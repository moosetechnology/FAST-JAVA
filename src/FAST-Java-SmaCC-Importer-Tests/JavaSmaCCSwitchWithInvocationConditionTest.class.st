Class {
	#name : #JavaSmaCCSwitchWithInvocationConditionTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'switchMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCSwitchWithInvocationConditionTest >> methodSwitch [
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

{ #category : #running }
JavaSmaCCSwitchWithInvocationConditionTest >> setUp [
	super setUp.
	switchMethod := (self parseMethod: 'switch') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCSwitchWithInvocationConditionTest >> testSwitchCondition [

	| switchStatement |
	switchStatement := (switchMethod mooseModel allWithType:
		                    FASTJavaSwitchStatement) anyOne.
	self assert: switchStatement condition class equals: FASTJavaMethodInvocation
]

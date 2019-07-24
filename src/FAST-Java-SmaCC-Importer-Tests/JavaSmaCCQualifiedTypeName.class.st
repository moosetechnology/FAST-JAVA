Class {
	#name : #JavaSmaCCQualifiedTypeName,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'qualifiedTypeNameMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCQualifiedTypeName >> methodQualifiedTypeName [
	^ 'public void patate () {
	Object b = new Patate.Canard();	
}'
]

{ #category : #running }
JavaSmaCCQualifiedTypeName >> setUp [
	super setUp.
	qualifiedTypeNameMethod := (self parseMethod: 'qualifiedTypeName') allFASTJavaMethodEntity first
]

{ #category : #tests }
JavaSmaCCQualifiedTypeName >> testQualifiedTypeName [
	self assert: (qualifiedTypeNameMethod mooseModel allWithType: FASTJavaNewExpression) anyOne type typeName class equals: FASTJavaQualifiedTypeName.
	self assert: (qualifiedTypeNameMethod mooseModel allWithType: FASTJavaNewExpression) anyOne type typeName name equals: 'Canard'.
	self assert: (qualifiedTypeNameMethod mooseModel allWithType: FASTJavaNewExpression) anyOne type typeName namespace name equals: 'Patate'.
	self assert: (qualifiedTypeNameMethod mooseModel allWithType: FASTJavaNewExpression) anyOne type fullName equals: 'Patate.Canard'.
	self assert: (qualifiedTypeNameMethod mooseModel allWithType: FASTJavaNewExpression) anyOne type typeName fullName equals: 'Patate.Canard'.
]

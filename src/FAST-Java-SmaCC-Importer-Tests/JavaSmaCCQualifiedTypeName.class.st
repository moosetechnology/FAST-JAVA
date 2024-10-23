Class {
	#name : 'JavaSmaCCQualifiedTypeName',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCQualifiedTypeName >> javaMethod [
	^ 'public void patate () {
	Object b = new Patate.Canard();	
}'
]

{ #category : 'tests' }
JavaSmaCCQualifiedTypeName >> testQualifiedTypeName [
	self assert: (fastModel allWithType: FASTJavaNewExpression) anyOne type typeName class equals: FASTJavaQualifiedTypeName.
	self assert: (fastModel allWithType: FASTJavaNewExpression) anyOne type typeName name equals: 'Canard'.
	self assert: (fastModel allWithType: FASTJavaNewExpression) anyOne type typeName namespace name equals: 'Patate'.
	self assert: (fastModel allWithType: FASTJavaNewExpression) anyOne type fullName equals: 'Patate.Canard'.
	self assert: (fastModel allWithType: FASTJavaNewExpression) anyOne type typeName fullName equals: 'Patate.Canard'.
]

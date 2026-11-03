Class {
	#name : 'JavaSmaCCForEachTest',
	#superclass : 'JavaSmaCCMethodImporterAbstractTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'resources' }
JavaSmaCCForEachTest >> javaMethod [
	^ 'void forEachMethod() {
	for(HandlerRegistration hr: SamplePageInputsAndLabels.hrList) {
		hr.removeHandler();
	}
}'
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachBodyParentNode [
		self assert: fastMethod statements first body parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachBodyType [
	self assert: fastMethod statements first body class equals: FASTJavaStatementBlock 
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachListParent [
	self assert: fastMethod statements first list parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachListType [
	self assert: fastMethod statements first list class equals: FASTJavaQualifiedName
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachType [
	self assert: fastMethod statements first class equals: FASTJavaForEachStatement
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachTypeName [
	self assert: fastMethod statements first type fullName equals: 'HandlerRegistration'
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachTypeType [
	self assert: fastMethod statements first type class equals: FASTJavaClassTypeExpression
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachVariableName [
	self assert: fastMethod statements first variable name equals: 'hr'
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachVariableParent [
	self assert: fastMethod statements first variable parentNode equals: fastMethod statements first
]

{ #category : 'tests' }
JavaSmaCCForEachTest >> testForEachVariableType [
	"JLS 14.14.2: a for-each header is a local variable declaration, so what it declares is
	a variable like the one a parameter or a declarator declares."

	self assert: fastMethod statements first variable class equals: FASTJavaVariableExpression
]

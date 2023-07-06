Class {
	#name : #JavaSmaCCForEachTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCForEachTest >> javaMethod [
	^ 'void forEachMethod() {
	for(HandlerRegistration hr: SamplePageInputsAndLabels.hrList) {
		hr.removeHandler();
	}
}'
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachBodyParentNode [
		self assert: fastMethod statements first body parentNode equals: fastMethod statements first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachBodyType [
	self assert: fastMethod statements first body class equals: FASTJavaStatementBlock 
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachFieldName [
	self assert: fastMethod statements first fieldname name equals: 'hr'
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachFieldNameParent [
	self assert: fastMethod statements first fieldname parentNode equals: fastMethod statements first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachFieldNameType [
	self assert: fastMethod statements first fieldname class equals: FASTJavaIdentifier
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachListParent [
	self assert: fastMethod statements first list parentNode equals: fastMethod statements first
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachListType [
	self assert: fastMethod statements first list class equals: FASTJavaClassProperty
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachType [
	self assert: fastMethod statements first class equals: FASTJavaForEachStatement
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachTypeName [
	self assert: fastMethod statements first type fullName equals: 'HandlerRegistration'
]

{ #category : #tests }
JavaSmaCCForEachTest >> testForEachTypeType [
	self assert: fastMethod statements first type class equals: FASTJavaClassTypeExpression
]

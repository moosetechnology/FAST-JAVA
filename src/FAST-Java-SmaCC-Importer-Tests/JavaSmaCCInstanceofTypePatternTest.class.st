Class {
	#name : #JavaSmaCCInstanceofTypePatternTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCInstanceofTypePatternTest >> javaMethod [
	
	^ 'void f(Object obj) {
		return obj instanceof Number num;
	}'
]

{ #category : #tests }
JavaSmaCCInstanceofTypePatternTest >> testTypePatternExists [

	self assert: (fastModel allWithType: FASTJavaTypePattern) isNotEmpty
]

{ #category : #tests }
JavaSmaCCInstanceofTypePatternTest >> testTypePatternInstanceof [

	self
		assert:
		(fastModel allWithType: FASTJavaTypePattern) anyOne parentNode
		equals: (fastModel allWithType: FASTJavaInfixOperation) anyOne
]

{ #category : #tests }
JavaSmaCCInstanceofTypePatternTest >> testTypePatternType [

	self
		assert:
		(fastModel allWithType: FASTJavaTypePattern) anyOne type typeName
			name
		equals: 'Number'
]

{ #category : #tests }
JavaSmaCCInstanceofTypePatternTest >> testTypePatternVariable [

	self
		assert:
		(fastModel allWithType: FASTJavaTypePattern) anyOne variable name
		equals: 'num'
]

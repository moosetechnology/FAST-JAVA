Class {
	#name : 'JavaSmaCCAssignmentTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'running' }
JavaSmaCCAssignmentTest >> javaMethod [
	^ 'public ApplicationView(ContentPanel navView,
                           ContentPanel deviceView,
                           ContentPanel mapView,
                           ContentPanel archiveView) {
        navPanel = navView;
        devicePanel = deviceView;
        mapPanel = mapView;
        archivePanel = archiveView;
        this.var = 5;
        array[3] += 5.3;
	}'
]

{ #category : 'tests' }
JavaSmaCCAssignmentTest >> testAssignmentInArrayAccess [

	(fastModel allWithType: FASTJavaAssignmentExpression) entities
		detect: [ :assignment |
		assignment expression class = FASTJavaFloatLiteral ]
		ifFound: [ :assignment |
			self assert: assignment variable class equals: FASTJavaArrayAccess ]
		ifNone: [ self fail ]
]

{ #category : 'tests' }
JavaSmaCCAssignmentTest >> testAssignmentInFieldAccess [

	(fastModel allWithType: FASTJavaAssignmentExpression) entities
		detect: [ :assignment |
		assignment expression class = FASTJavaIntegerLiteral ]
		ifFound: [ :assignment |
			self assert: assignment variable class equals: FASTJavaFieldAccess ]
		ifNone: [ self fail ]
]

{ #category : 'tests' }
JavaSmaCCAssignmentTest >> testAssignmentOperator [
	| sortedAssignments |

	self assert: (fastModel allWithType: FASTJavaAssignmentExpression) size equals: 6.

	sortedAssignments := (fastModel allWithType: FASTJavaAssignmentExpression)
		sorted: [ :a :b | a startPos < b startPos ].

	sortedAssignments entities allButLast do: [ :assign |
		self assert: assign operator equals: '='
	].

	self assert: sortedAssignments last operator equals: '+='
]

{ #category : 'tests' }
JavaSmaCCAssignmentTest >> testAssignmentParameter [
	(fastModel allWithType: FASTJavaAssignmentExpression) entities
		detect: [ :assignment | assignment expression name = 'navView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'navPanel' ]
		ifNone: [ self fail ].
	(fastModel allWithType: FASTJavaAssignmentExpression) entities
		detect: [ :assignment | assignment expression name = 'deviceView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'devicePanel' ]
		ifNone: [ self fail ].
	(fastModel allWithType: FASTJavaAssignmentExpression) entities
		detect: [ :assignment | assignment expression name = 'mapView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'mapPanel' ]
		ifNone: [ self fail ].
	(fastModel allWithType: FASTJavaAssignmentExpression) entities
		detect: [ :assignment | assignment expression name = 'archiveView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'archivePanel' ]
		ifNone: [ self fail ]
]

{ #category : 'tests' }
JavaSmaCCAssignmentTest >> testExpressionParentNode [
	self assert: (fastModel allWithType: FASTJavaAssignmentExpression) size equals: 6.
	(fastModel allWithType: FASTJavaAssignmentExpression) do: [ :assignment | self assert: assignment expression parentNode equals: assignment ]
]

{ #category : 'tests' }
JavaSmaCCAssignmentTest >> testVariableParentNode [
	self assert: (fastModel allWithType: FASTJavaAssignmentExpression) size equals: 6.
	(fastModel allWithType: FASTJavaAssignmentExpression) do: [ :assignment | self assert: assignment variable parentNode equals: assignment ]
]

Class {
	#name : #JavaSmaCCAssignementTest,
	#superclass : #JavaSmaCCImporterTest,
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #running }
JavaSmaCCAssignementTest >> javaMethod [
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

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignementOperator [
	| sortedAssignements |

	self assert: (fastModel allWithType: FASTJavaAssignmentExpression) size equals: 6.

	sortedAssignements := (fastModel allWithType: FASTJavaAssignmentExpression)
		sorted: [ :a :b | a startPos < b startPos ].

	sortedAssignements allButLast do: [ :assign |
		self assert: assign operator equals: '='
	].

	self assert: sortedAssignements last operator equals: '+='
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignmentInArrayAccess [
	(fastModel allWithType: FASTJavaAssignmentExpression) detect:  [ :assignment | assignment expression class = FASTJavaFloatLiteral ]
		 ifFound: [ :assignment | self assert: assignment variable class equals: FASTJavaArrayAccess ] ifNone: [ self fail ].
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignmentInFieldAccess [
	(fastModel allWithType: FASTJavaAssignmentExpression) detect:  [ :assignment | assignment expression class = FASTJavaIntegerLiteral ]
		 ifFound: [ :assignment | self assert: assignment variable class equals: FASTJavaFieldAccess ] ifNone: [ self fail ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignmentParameter [
	(fastModel allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'navView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'navPanel' ]
		ifNone: [ self fail ].
	(fastModel allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'deviceView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'devicePanel' ]
		ifNone: [ self fail ].
	(fastModel allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'mapView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'mapPanel' ]
		ifNone: [ self fail ].
	(fastModel allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'archiveView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'archivePanel' ]
		ifNone: [ self fail ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testExpressionParentNode [
	self assert: (fastModel allWithType: FASTJavaAssignmentExpression) size equals: 6.
	(fastModel allWithType: FASTJavaAssignmentExpression) do: [ :assignment | self assert: assignment expression parentNode equals: assignment ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testVariableParentNode [
	self assert: (fastModel allWithType: FASTJavaAssignmentExpression) size equals: 6.
	(fastModel allWithType: FASTJavaAssignmentExpression) do: [ :assignment | self assert: assignment variable parentNode equals: assignment ]
]

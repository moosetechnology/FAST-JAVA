Class {
	#name : #JavaSmaCCAssignementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'assignmentMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCAssignementTest >> methodAssignment [
	^ 'public ApplicationView(ContentPanel navView,
                           ContentPanel deviceView,
                           ContentPanel mapView,
                           ContentPanel archiveView) {
        navPanel = navView;
        devicePanel = deviceView;
        mapPanel = mapView;
        archivePanel = archiveView;
        this.var = 5;
        array[3] = 5.3;
	}'
]

{ #category : #running }
JavaSmaCCAssignementTest >> setUp [
	super setUp.
	assignmentMethod := (self parseMethod: 'assignment')
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignmentInArrayAccess [
	(assignmentMethod allWithType: FASTJavaAssignmentExpression) detect:  [ :assignment | assignment expression class = FASTJavaFloatLiteral ]
		 ifFound: [ :assignment | self assert: assignment variable class equals: FASTJavaArrayAccess ] ifNone: [ self fail ].
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignmentInFieldAccess [
	(assignmentMethod allWithType: FASTJavaAssignmentExpression) detect:  [ :assignment | assignment expression class = FASTJavaIntegerLiteral ]
		 ifFound: [ :assignment | self assert: assignment variable class equals: FASTJavaFieldAccess ] ifNone: [ self fail ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignmentParameter [
	(assignmentMethod allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'navView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'navPanel' ]
		ifNone: [ self fail ].
	(assignmentMethod allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'deviceView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'devicePanel' ]
		ifNone: [ self fail ].
	(assignmentMethod allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'mapView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'mapPanel' ]
		ifNone: [ self fail ].
	(assignmentMethod allWithType: FASTJavaAssignmentExpression)
		detect: [ :assignment | assignment expression name = 'archiveView' ]
		ifFound: [ :assignment | self assert: assignment variable name equals: 'archivePanel' ]
		ifNone: [ self fail ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testExpressionParentNode [
	self assert: (assignmentMethod allWithType: FASTJavaAssignmentExpression) size equals: 6.
	(assignmentMethod allWithType: FASTJavaAssignmentExpression) do: [ :assignment | self assert: assignment expression parentNode equals: assignment ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testVariableParentNode [
	self assert: (assignmentMethod allWithType: FASTJavaAssignmentExpression) size equals: 6.
	(assignmentMethod allWithType: FASTJavaAssignmentExpression) do: [ :assignment | self assert: assignment variable parentNode equals: assignment ]
]

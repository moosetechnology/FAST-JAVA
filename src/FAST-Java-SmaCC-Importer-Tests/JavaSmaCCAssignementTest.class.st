Class {
	#name : #JavaSmaCCAssignementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'assignementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #resources }
JavaSmaCCAssignementTest >> methodAssignement [
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
	assignementMethod := (self parseMethod: 'assignement')
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignementInArrayAccess [
	(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression class = FASTJavaFloatLiteral ]
		 ifFound: [ :assignement | self assert: assignement variable class equals: FASTJavaArrayAccess ] ifNone: [ self fail ].
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignementInFieldAccess [
	(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression class = FASTJavaIntegerLiteral ]
		 ifFound: [ :assignement | self assert: assignement variable class equals: FASTJavaFieldAccess ] ifNone: [ self fail ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testAssignementParameter [
	(assignementMethod allWithType: FASTJavaAssignementExpression)
		detect: [ :assignement | assignement expression name = 'navView' ]
		ifFound: [ :assignement | self assert: assignement variable name equals: 'navPanel' ]
		ifNone: [ self fail ].
	(assignementMethod allWithType: FASTJavaAssignementExpression)
		detect: [ :assignement | assignement expression name = 'deviceView' ]
		ifFound: [ :assignement | self assert: assignement variable name equals: 'devicePanel' ]
		ifNone: [ self fail ].
	(assignementMethod allWithType: FASTJavaAssignementExpression)
		detect: [ :assignement | assignement expression name = 'mapView' ]
		ifFound: [ :assignement | self assert: assignement variable name equals: 'mapPanel' ]
		ifNone: [ self fail ].
	(assignementMethod allWithType: FASTJavaAssignementExpression)
		detect: [ :assignement | assignement expression name = 'archiveView' ]
		ifFound: [ :assignement | self assert: assignement variable name equals: 'archivePanel' ]
		ifNone: [ self fail ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testExpressionParentNode [
	self assert: (assignementMethod allWithType: FASTJavaAssignementExpression) size equals: 6.
	(assignementMethod allWithType: FASTJavaAssignementExpression) do: [ :assignement | self assert: assignement expression parentNode equals: assignement ]
]

{ #category : #tests }
JavaSmaCCAssignementTest >> testVariableParentNode [
	self assert: (assignementMethod allWithType: FASTJavaAssignementExpression) size equals: 6.
	(assignementMethod allWithType: FASTJavaAssignementExpression) do: [ :assignement | self assert: assignement variable parentNode equals: assignement ]
]

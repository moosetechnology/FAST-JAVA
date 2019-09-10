Class {
	#name : #JavaSmaCCAssignementTest,
	#superclass : #JavaSmaCCImporterTest,
	#instVars : [
		'assignementMethod'
	],
	#category : #'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
JavaSmaCCAssignementTest >> setUp [
	super setUp.
	assignementMethod := (self parseMethod: 'assignement')
]

{ #category : #'as yet unclassified' }
JavaSmaCCAssignementTest >> testAssignementInArrayAccess [
	(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression class = FASTJavaFloatLiteral ]
		 ifFound: [ :assignement | self assert: assignement variable class equals: FASTJavaArrayAccess ] ifNone: [ self fail ].
]

{ #category : #'as yet unclassified' }
JavaSmaCCAssignementTest >> testAssignementInFieldAccess [
	(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression class = FASTJavaIntegerLiteral ]
		 ifFound: [ :assignement | self assert: assignement variable class equals: FASTJavaFieldAccess ] ifNone: [ self fail ].
]

{ #category : #'as yet unclassified' }
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

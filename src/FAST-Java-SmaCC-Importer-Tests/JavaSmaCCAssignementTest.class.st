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
	}'
]

{ #category : #'as yet unclassified' }
JavaSmaCCAssignementTest >> setUp [
	super setUp.
	assignementMethod := (self parseMethod: 'assignement')
]

{ #category : #'as yet unclassified' }
JavaSmaCCAssignementTest >> testAssertNodeConditionParentNode [
	(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression name = 'navView' ]
		 ifFound: [ :assignement | self assert: assignement variable name equals: 'navPanel' ] ifNone: [ self fail ].
(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression name = 'deviceView' ]
		 ifFound: [ :assignement | self assert: assignement variable name equals: 'devicePanel' ] ifNone: [ self fail ].
		(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression name = 'mapView' ]
		 ifFound: [ :assignement | self assert: assignement variable name equals: 'mapPanel' ] ifNone: [ self fail ].
		(assignementMethod allWithType: FASTJavaAssignementExpression) detect:  [ :assignement | assignement expression name = 'archiveView' ]
		 ifFound: [ :assignement | self assert: assignement variable name equals: 'archivePanel' ] ifNone: [ self fail ]
]

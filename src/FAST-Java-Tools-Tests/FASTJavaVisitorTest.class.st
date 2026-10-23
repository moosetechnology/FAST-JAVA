Class {
	#name : 'FASTJavaVisitorTest',
	#superclass : 'TestCase',
	#category : 'FAST-Java-Tools-Tests-visitor',
	#package : 'FAST-Java-Tools-Tests',
	#tag : 'visitor'
}

{ #category : 'tests' }
FASTJavaVisitorTest >> testVisitsEveryConcreteEntity [

	| visitor |
	visitor := FASTJavaVisitor new.
	(FASTJavaEntity withAllSubclasses reject: [ :each | each isAbstract ]) do: [ :entityClass |
		self
			shouldnt: [ entityClass new accept: visitor ]
			raise: MessageNotUnderstood
			description: 'FASTJavaVisitor does not visit ' , entityClass name ]
]

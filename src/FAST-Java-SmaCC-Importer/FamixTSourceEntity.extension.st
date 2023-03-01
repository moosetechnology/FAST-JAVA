Extension { #name : #FamixTSourceEntity }

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTSourceEntity >> bindFASTModel [
	| fastModel |
	self assert: self sourceAnchor isNotNil.
	fastModel := self getFASTModel
		metamodel: CRFModel metamodel;
		yourself.
	self bindFastModel: fastModel usingBinder: CRFBinderVisitor new.
	^ fastModel
]

{ #category : #'*FAST-Java-SmaCC-Importer' }
FamixTSourceEntity >> getFASTModel [
	self explicitRequirement 
]

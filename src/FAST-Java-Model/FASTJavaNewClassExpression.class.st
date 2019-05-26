"
I represent a new class expression (which is most of the time a new anonymous class)
	
	
ex. for SecureAsyncCallback

new SecureAsyncCallback<Void>() {
	@Override
	public void onSuccess(final Void result) {}
	
	@Override
	public void onFailure(final Throwable caught) {
		super.onFailure(caught);
	}
}
"
Class {
	#name : #FASTJavaNewClassExpression,
	#superclass : #FASTJavaNewExpression,
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNewClassExpression class >> annotation [

	<MSEClass: #NewClassExpression super: #FASTJavaNewExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #generator }
FASTJavaNewClassExpression class >> generatedSlotNames [
	<generated>
	'FASTJavaNewClassExpression class>>#generatedSlotNames'.
	^ #()
]

{ #category : #generator }
FASTJavaNewClassExpression class >> generatedTraitNames [
	<generated>
	^ #()
]

{ #category : #meta }
FASTJavaNewClassExpression class >> requirements [

	<generated>
	^ {  }
]

{ #category : #adding }
FASTJavaNewClassExpression >> addDeclarations: anObject [
			
	<generated>
	^ self declarations add: anObject
]

{ #category : #accessing }
FASTJavaNewClassExpression >> declarations [

	<generated>
	<MSEComment: 'The methods defined in the class'>
	<MSEProperty: #declarations type: #Object>
	^ self privateState attributeAt: #declarations ifAbsentPut: [ FMMultivalueLink on: self opposite: #newClassOwner: ]
]

{ #category : #accessing }
FASTJavaNewClassExpression >> declarations: anObject [

	<generated>
	self declarations value: anObject
]

{ #category : #navigation }
FASTJavaNewClassExpression >> declarationsGroup [

	<generated>
	<navigation: 'Declarations'>
	^ MooseGroup
			withAll: (self declarations asSet)
]

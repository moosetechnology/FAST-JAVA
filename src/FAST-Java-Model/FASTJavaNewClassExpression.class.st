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

	<FMClass: #NewClassExpression super: #FASTJavaNewExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #adding }
FASTJavaNewClassExpression >> addDeclaration: anObject [
	<generated>
	^ self declarations add: anObject
]

{ #category : #accessing }
FASTJavaNewClassExpression >> declarations [
	"Relation named: #declarations type: #FASTTScopableEntity opposite: #newClassOwner"

	<generated>
	<FMComment: 'The methods defined in the class'>
	<derived>
	<FMProperty: #declarations type: #FASTTScopableEntity opposite: #newClassOwner>
	^ self attributeAt: #declarations ifAbsentPut: [ FMMultivalueLink on: self opposite: #newClassOwner: ]
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
	^ MooseSpecializedGroup withAll: self declarations asSet
]

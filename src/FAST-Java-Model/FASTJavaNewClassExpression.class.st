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
	#traits : 'FASTJavaTWithDeclarations + FASTTWithArguments',
	#classTraits : 'FASTJavaTWithDeclarations classTrait + FASTTWithArguments classTrait',
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaNewClassExpression class >> annotation [

	<FMClass: #NewClassExpression super: #FASTJavaNewExpression>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

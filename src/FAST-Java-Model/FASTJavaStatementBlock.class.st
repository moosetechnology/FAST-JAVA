Class {
	#name : #FASTJavaStatementBlock,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTStatementBlock',
	#classTraits : 'FASTTStatementBlock classTrait',
	#instVars : [
		'#javaTryCatchOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #try',
		'#javaTryFinallyOwner => FMOne type: #FASTJavaTryCatchStatement opposite: #finally',
		'#javaCatchPartStatementOwner => FMOne type: #FASTJavaCatchPartStatement opposite: #body'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaStatementBlock class >> annotation [

	<FMClass: #StatementBlock super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^ self
]

{ #category : #accessing }
FASTJavaStatementBlock >> javaCatchPartStatementOwner [
	"Relation named: #javaCatchPartStatementOwner type: #FASTJavaCatchPartStatement opposite: #body"

	<generated>
	<FMComment: 'The javaCatchPartStatementOwner owner (if possible)'>
	<container>
	<derived>
	^ javaCatchPartStatementOwner
]

{ #category : #accessing }
FASTJavaStatementBlock >> javaCatchPartStatementOwner: anObject [

	<generated>
	javaCatchPartStatementOwner := anObject
]

{ #category : #navigation }
FASTJavaStatementBlock >> javaCatchPartStatementOwnerGroup [
	<generated>
	<navigation: 'JavaCatchPartStatementOwner'>
	^ MooseSpecializedGroup with: self javaCatchPartStatementOwner
]

{ #category : #accessing }
FASTJavaStatementBlock >> javaTryCatchOwner [
	"Relation named: #javaTryCatchOwner type: #FASTJavaTryCatchStatement opposite: #try"

	<generated>
	<FMComment: 'The javaTryCatch owner (if possible)'>
	<container>
	<derived>
	^ javaTryCatchOwner
]

{ #category : #accessing }
FASTJavaStatementBlock >> javaTryCatchOwner: anObject [

	<generated>
	javaTryCatchOwner := anObject
]

{ #category : #navigation }
FASTJavaStatementBlock >> javaTryCatchOwnerGroup [
	<generated>
	<navigation: 'JavaTryCatchOwner'>
	^ MooseSpecializedGroup with: self javaTryCatchOwner
]

{ #category : #accessing }
FASTJavaStatementBlock >> javaTryFinallyOwner [
	"Relation named: #javaTryFinallyOwner type: #FASTJavaTryCatchStatement opposite: #finally"

	<generated>
	<FMComment: 'The try/finally part that owns me'>
	<container>
	<derived>
	^ javaTryFinallyOwner
]

{ #category : #accessing }
FASTJavaStatementBlock >> javaTryFinallyOwner: anObject [

	<generated>
	javaTryFinallyOwner := anObject
]

{ #category : #navigation }
FASTJavaStatementBlock >> javaTryFinallyOwnerGroup [
	<generated>
	<navigation: 'JavaTryFinallyOwner'>
	^ MooseSpecializedGroup with: self javaTryFinallyOwner
]

Class {
	#name : #FASTJavaComment,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#content => FMProperty',
		'#attachedTo => FMProperty'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #accessing }
FASTJavaComment >> attachedTo [

	<FMProperty: #content type: #FASTJavaEntity>
	<FMComment: 'FAST Node to which this comment is attached'>
	^attachedTo
]

{ #category : #accessing }
FASTJavaComment >> attachedTo: anObject [

	attachedTo := anObject 
]

{ #category : #accessing }
FASTJavaComment >> content [

	<FMProperty: #content type: #String>
	<FMComment: 'Content of the comment as a String'>
	^ content
]

{ #category : #accessing }
FASTJavaComment >> content: anObject [
	
	content := anObject
]

{ #category : #testing }
FASTJavaComment >> isBlockComment [
	^self content beginsWith: '/*'
]

{ #category : #testing }
FASTJavaComment >> isJavadocComment [
	^self content beginsWith: '/**'
]

{ #category : #testing }
FASTJavaComment >> isLineComment [
	^self content beginsWith: '//'
]

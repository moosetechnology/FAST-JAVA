Class {
	#name : #FASTJavaVariableExpression,
	#superclass : #FASTJavaEntity,
	#traits : 'FASTJavaTAssigneable + FASTJavaTReceiver + FASTTVariableExpression',
	#classTraits : 'FASTJavaTAssigneable classTrait + FASTJavaTReceiver classTrait + FASTTVariableExpression classTrait',
	#instVars : [
		'#javaVariableDeclaratorOwner => FMOne type: #FASTJavaVariableDeclarator opposite: #variable',
		'#javaCastExpressionTypeOwner => FMOne type: #FASTJavaCastExpression opposite: #type',
		'#javaClassPropertyOwner => FMOne type: #FASTJavaClassProperty opposite: #type',
		'#javaNewExpressionOwner => FMOne type: #FASTJavaNewExpression opposite: #type',
		'#javaOuterThisOwner => FMOne type: #FASTJavaOuterThis opposite: #type',
		'#javaForEachStatementFieldNameOwner => FMOne type: #FASTJavaForEachStatement opposite: #fieldname',
		'#javaForEachStatementTypeOwner => FMOne type: #FASTJavaForEachStatement opposite: #type',
		'#javaCatchParameterOwnler => FMOne type: #FASTJavaCatchPartStatement opposite: #parameter',
		'#javaMethodReferenceOwner => FMOne type: #FASTJavaMethodReference opposite: #receiver',
		'#javaMethodTypeOwner => FMOne type: #FASTJavaMethodEntity opposite: #type',
		'#javaParameterTypeOwner => FMOne type: #FASTJavaParameter opposite: #type',
		'#javaParameterVariableOwner => FMOne type: #FASTJavaParameter opposite: #variable',
		'#javaVarDeclTypeOwner => FMOne type: #FASTJavaVarDeclStatement opposite: #type',
		'#javaVariableExpressionOwnerIsAnnotation => FMOne type: #FASTJavaAnnotation opposite: #expression'
	],
	#category : #'FAST-Java-Model-Entities'
}

{ #category : #meta }
FASTJavaVariableExpression class >> annotation [

	<FMClass: #VariableExpression super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
	^self
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCastExpressionTypeOwner [
	"Relation named: #javaCastExpressionTypeOwner type: #FASTJavaCastExpression opposite: #type"

	<generated>
	<FMComment: 'The javaCastExpression owner (if possible)'>
	<container>
	<derived>
	^ javaCastExpressionTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCastExpressionTypeOwner: anObject [

	<generated>
	javaCastExpressionTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaCastExpressionTypeOwnerGroup [
	<generated>
	<navigation: 'JavaCastExpressionTypeOwner'>
	^ MooseSpecializedGroup with: self javaCastExpressionTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCatchParameterOwnler [
	"Relation named: #javaCatchParameterOwnler type: #FASTJavaCatchPartStatement opposite: #parameter"

	<generated>
	<FMComment: 'The javaCatchPartParameterOwner owner (if possible)'>
	<container>
	<derived>
	^ javaCatchParameterOwnler
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaCatchParameterOwnler: anObject [

	<generated>
	javaCatchParameterOwnler := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaCatchParameterOwnlerGroup [
	<generated>
	<navigation: 'JavaCatchParameterOwnler'>
	^ MooseSpecializedGroup with: self javaCatchParameterOwnler
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaClassPropertyOwner [
	"Relation named: #javaClassPropertyOwner type: #FASTJavaClassProperty opposite: #type"

	<generated>
	<FMComment: 'The javaClassProperty owner (if possible)'>
	<container>
	<derived>
	^ javaClassPropertyOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaClassPropertyOwner: anObject [

	<generated>
	javaClassPropertyOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaClassPropertyOwnerGroup [
	<generated>
	<navigation: 'JavaClassPropertyOwner'>
	^ MooseSpecializedGroup with: self javaClassPropertyOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaForEachStatementFieldNameOwner [
	"Relation named: #javaForEachStatementFieldNameOwner type: #FASTJavaForEachStatement opposite: #fieldname"

	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	^ javaForEachStatementFieldNameOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaForEachStatementFieldNameOwner: anObject [

	<generated>
	javaForEachStatementFieldNameOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaForEachStatementFieldNameOwnerGroup [
	<generated>
	<navigation: 'JavaForEachStatementFieldNameOwner'>
	^ MooseSpecializedGroup with: self javaForEachStatementFieldNameOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaForEachStatementTypeOwner [
	"Relation named: #javaForEachStatementTypeOwner type: #FASTJavaForEachStatement opposite: #type"

	<generated>
	<FMComment: 'The javaForEachStatement owner (if possible)'>
	<container>
	<derived>
	^ javaForEachStatementTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaForEachStatementTypeOwner: anObject [

	<generated>
	javaForEachStatementTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaForEachStatementTypeOwnerGroup [
	<generated>
	<navigation: 'JavaForEachStatementTypeOwner'>
	^ MooseSpecializedGroup with: self javaForEachStatementTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodReferenceOwner [
	"Relation named: #javaMethodReferenceOwner type: #FASTJavaMethodReference opposite: #receiver"

	<generated>
	<FMComment: 'The owner of the method reference (if possible)'>
	<container>
	<derived>
	^ javaMethodReferenceOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodReferenceOwner: anObject [

	<generated>
	javaMethodReferenceOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaMethodReferenceOwnerGroup [
	<generated>
	<navigation: 'JavaMethodReferenceOwner'>
	^ MooseSpecializedGroup with: self javaMethodReferenceOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodTypeOwner [
	"Relation named: #javaMethodTypeOwner type: #FASTJavaMethodEntity opposite: #type"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaMethodTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaMethodTypeOwner: anObject [

	<generated>
	javaMethodTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaMethodTypeOwnerGroup [
	<generated>
	<navigation: 'JavaMethodTypeOwner'>
	^ MooseSpecializedGroup with: self javaMethodTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaNewExpressionOwner [
	"Relation named: #javaNewExpressionOwner type: #FASTJavaNewExpression opposite: #type"

	<generated>
	<FMComment: 'The javaNewExpression owner (if possible)'>
	<container>
	<derived>
	^ javaNewExpressionOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaNewExpressionOwner: anObject [

	<generated>
	javaNewExpressionOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaNewExpressionOwnerGroup [
	<generated>
	<navigation: 'JavaNewExpressionOwner'>
	^ MooseSpecializedGroup with: self javaNewExpressionOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaOuterThisOwner [
	"Relation named: #javaOuterThisOwner type: #FASTJavaOuterThis opposite: #type"

	<generated>
	<FMComment: 'The javaOuterThis owner (if possible)'>
	<container>
	<derived>
	^ javaOuterThisOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaOuterThisOwner: anObject [

	<generated>
	javaOuterThisOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaOuterThisOwnerGroup [
	<generated>
	<navigation: 'JavaOuterThisOwner'>
	^ MooseSpecializedGroup with: self javaOuterThisOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterTypeOwner [
	"Relation named: #javaParameterTypeOwner type: #FASTJavaParameter opposite: #type"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaParameterTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterTypeOwner: anObject [

	<generated>
	javaParameterTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaParameterTypeOwnerGroup [
	<generated>
	<navigation: 'JavaParameterTypeOwner'>
	^ MooseSpecializedGroup with: self javaParameterTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterVariableOwner [
	"Relation named: #javaParameterVariableOwner type: #FASTJavaParameter opposite: #variable"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaParameterVariableOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaParameterVariableOwner: anObject [

	<generated>
	javaParameterVariableOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaParameterVariableOwnerGroup [
	<generated>
	<navigation: 'JavaParameterVariableOwner'>
	^ MooseSpecializedGroup with: self javaParameterVariableOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVarDeclTypeOwner [
	"Relation named: #javaVarDeclTypeOwner type: #FASTJavaVarDeclStatement opposite: #type"

	<generated>
	<FMComment: 'The variable expression owner (if possible)'>
	<container>
	<derived>
	^ javaVarDeclTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVarDeclTypeOwner: anObject [

	<generated>
	javaVarDeclTypeOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaVarDeclTypeOwnerGroup [
	<generated>
	<navigation: 'JavaVarDeclTypeOwner'>
	^ MooseSpecializedGroup with: self javaVarDeclTypeOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVariableDeclaratorOwner [
	"Relation named: #javaVariableDeclaratorOwner type: #FASTJavaVariableDeclarator opposite: #variable"

	<generated>
	<FMComment: 'The javaVariableDeclarator owner (if possible)'>
	<container>
	<derived>
	^ javaVariableDeclaratorOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVariableDeclaratorOwner: anObject [

	<generated>
	javaVariableDeclaratorOwner := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaVariableDeclaratorOwnerGroup [
	<generated>
	<navigation: 'JavaVariableDeclaratorOwner'>
	^ MooseSpecializedGroup with: self javaVariableDeclaratorOwner
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVariableExpressionOwnerIsAnnotation [
	"Relation named: #javaVariableExpressionOwnerIsAnnotation type: #FASTJavaAnnotation opposite: #expression"

	<generated>
	<FMComment: 'The annotation that own me'>
	<container>
	<derived>
	^ javaVariableExpressionOwnerIsAnnotation
]

{ #category : #accessing }
FASTJavaVariableExpression >> javaVariableExpressionOwnerIsAnnotation: anObject [

	<generated>
	javaVariableExpressionOwnerIsAnnotation := anObject
]

{ #category : #navigation }
FASTJavaVariableExpression >> javaVariableExpressionOwnerIsAnnotationGroup [
	<generated>
	<navigation: 'JavaVariableExpressionOwnerIsAnnotation'>
	^ MooseSpecializedGroup with: self javaVariableExpressionOwnerIsAnnotation
]

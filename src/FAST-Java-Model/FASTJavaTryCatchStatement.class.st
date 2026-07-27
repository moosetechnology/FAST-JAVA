"
I represent the java try catch statement. I must have two parts: the 'Try' part and the 'catch' part. 
	
ex.

void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}



## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `forIncrementorOwner` | `FASTTStatement` | `incrementor` | `FASTJavaForStatement` | I am the incrementor of the for|
| `forIninitializerOwner` | `FASTTStatement` | `initializer` | `FASTJavaForStatement` | I am the initializer of the for|
| `ifElsePartOwner` | `FASTTStatement` | `elsePart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `ifThenPartOwner` | `FASTTStatement` | `thenPart` | `FASTJavaIfStatement` | The if owner (if possible)|
| `labelStatementOwner` | `FASTTStatement` | `labeledStatement` | `FASTJavaLabeledStatement` | Label Statement entity containing this statement|
| `parentLoopStatement` | `FASTTStatement` | `body` | `FASTTLoopStatement` | Optional loop of which this statement is the body|
| `statementContainer` | `FASTTStatement` | `statements` | `FASTTStatementBlock` | Block containing this statement.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `catches` | `FASTJavaTryCatchStatement` | `tryOwner` | `FASTJavaCatchPartStatement` | I contain all the catch statements|
| `finally` | `FASTJavaTryCatchStatement` | `javaTryFinallyOwner` | `FASTJavaStatementBlock` | I contain the 'finally' part of the try/catch/finally|
| `resources` | `FASTJavaTryCatchStatement` | `javaTryResourceOwner` | `FASTJavaVarDeclStatement` | I contain the resources in a try-with-resource statement|
| `try` | `FASTJavaTryCatchStatement` | `javaTryCatchOwner` | `FASTJavaStatementBlock` | I represent the 'try' part of the TryCatch Statement|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaTryCatchStatement',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTStatement',
	#classTraits : 'FASTTStatement classTrait',
	#instVars : [
		'#try => FMOne type: #FASTJavaStatementBlock opposite: #javaTryCatchOwner',
		'#catches => FMMany type: #FASTJavaCatchPartStatement opposite: #tryOwner',
		'#finally => FMOne type: #FASTJavaStatementBlock opposite: #javaTryFinallyOwner',
		'#resources => FMMany type: #FASTJavaVarDeclStatement opposite: #javaTryResourceOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaTryCatchStatement class >> annotation [

	<FMClass: #TryCatchStatement super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaTryCatchStatement >> addCatch: anObject [
	<generated>
	^ self catches add: anObject
]

{ #category : 'adding' }
FASTJavaTryCatchStatement >> addResource: anObject [
	<generated>
	^ self resources add: anObject
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> catches [
	"Relation named: #catches type: #FASTJavaCatchPartStatement opposite: #tryOwner"

	<generated>
	<FMComment: 'I contain all the catch statements'>
	<derived>
	^ catches
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> catches: anObject [

	<generated>
	catches value: anObject
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> finally [
	"Relation named: #finally type: #FASTJavaStatementBlock opposite: #javaTryFinallyOwner"

	<generated>
	<FMComment: 'I contain the ''finally'' part of the try/catch/finally'>
	^ finally
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> finally: anObject [

	<generated>
	finally := anObject
]

{ #category : 'testing' }
FASTJavaTryCatchStatement >> isTryCatchStatement [

	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> resources [
	"Relation named: #resources type: #FASTJavaVarDeclStatement opposite: #javaTryResourceOwner"

	<generated>
	<FMComment: 'I contain the resources in a try-with-resource statement'>
	<derived>
	^ resources
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> resources: anObject [

	<generated>
	resources value: anObject
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> try [
	"Relation named: #try type: #FASTJavaStatementBlock opposite: #javaTryCatchOwner"

	<generated>
	<FMComment: 'I represent the ''try'' part of the TryCatch Statement'>
	^ try
]

{ #category : 'accessing' }
FASTJavaTryCatchStatement >> try: anObject [

	<generated>
	try := anObject
]

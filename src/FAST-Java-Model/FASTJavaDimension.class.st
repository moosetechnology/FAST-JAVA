"
I am one pair of brackets, written after a name or after a type, and I carry the annotations written on that pair (JLS 10.2). The ellipsis of a variable arity parameter is one of me too, the dimension it adds being the one the annotations before it are written on (JLS 8.4.1).

```language=text
int a @Ann [];
void m(Object @Ann ... args);
```

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `methodOwner` | `FASTJavaDimension` | `brackets` | `FASTJavaMethodEntity` | The method that writes me after its parameter list|
| `parameterOwner` | `FASTJavaDimension` | `brackets` | `FASTJavaParameter` | The parameter that writes me after its name|
| `variableArgumentsOwner` | `FASTJavaDimension` | `variableArguments` | `FASTJavaParameter` | The parameter whose ellipsis I am|
| `variableDeclaratorOwner` | `FASTJavaDimension` | `brackets` | `FASTJavaVariableDeclarator` | The declarator that writes me after its name|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `modifiers` | `FASTJavaTWithModifiers` | `javaModifierOwner` | `FASTJavaTModifier` | My modifiers|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaDimension',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTWithModifiers + FASTTEntity',
	#classTraits : 'FASTJavaTWithModifiers classTrait + FASTTEntity classTrait',
	#instVars : [
		'#methodOwner => FMOne type: #FASTJavaMethodEntity opposite: #brackets',
		'#parameterOwner => FMOne type: #FASTJavaParameter opposite: #brackets',
		'#variableArgumentsOwner => FMOne type: #FASTJavaParameter opposite: #variableArguments',
		'#variableDeclaratorOwner => FMOne type: #FASTJavaVariableDeclarator opposite: #brackets'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaDimension class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Dimension super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaDimension >> isDimension [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaDimension >> methodOwner [
	"Relation named: #methodOwner type: #FASTJavaMethodEntity opposite: #brackets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The method that writes me after its parameter list'>
	<container>
	^ methodOwner
]

{ #category : 'accessing' }
FASTJavaDimension >> methodOwner: anObject [

	<ignoreForCoverage>
	<generated>
	methodOwner := anObject
]

{ #category : 'accessing' }
FASTJavaDimension >> parameterOwner [
	"Relation named: #parameterOwner type: #FASTJavaParameter opposite: #brackets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The parameter that writes me after its name'>
	<container>
	^ parameterOwner
]

{ #category : 'accessing' }
FASTJavaDimension >> parameterOwner: anObject [

	<ignoreForCoverage>
	<generated>
	parameterOwner := anObject
]

{ #category : 'accessing' }
FASTJavaDimension >> variableArgumentsOwner [
	"Relation named: #variableArgumentsOwner type: #FASTJavaParameter opposite: #variableArguments"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The parameter whose ellipsis I am'>
	<container>
	^ variableArgumentsOwner
]

{ #category : 'accessing' }
FASTJavaDimension >> variableArgumentsOwner: anObject [

	<ignoreForCoverage>
	<generated>
	variableArgumentsOwner := anObject
]

{ #category : 'accessing' }
FASTJavaDimension >> variableDeclaratorOwner [
	"Relation named: #variableDeclaratorOwner type: #FASTJavaVariableDeclarator opposite: #brackets"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The declarator that writes me after its name'>
	<container>
	^ variableDeclaratorOwner
]

{ #category : 'accessing' }
FASTJavaDimension >> variableDeclaratorOwner: anObject [

	<ignoreForCoverage>
	<generated>
	variableDeclaratorOwner := anObject
]

"
I represent a label of a switch case. I contain all expressions associated with the label; an empty list represents the default label.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `caseStatementOwner` | `FASTJavaSwitchLabel` | `labels` | `FASTJavaCaseStatement` | The case statement that owns me|
| `switchRuleOwner` | `FASTJavaSwitchLabel` | `label` | `FASTJavaSwitchRule` | The switch rule that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `caseExpressions` | `FASTJavaSwitchLabel` | `switchLabelOwner` | `FASTTExpression` | The expressions of this case label; empty for default|
| `guard` | `FASTJavaSwitchLabel` | `switchLabelGuardOwner` | `FASTTExpression` | The expression a match must satisfy for this label to apply|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaSwitchLabel',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#caseStatementOwner => FMOne type: #FASTJavaCaseStatement opposite: #labels',
		'#switchRuleOwner => FMOne type: #FASTJavaSwitchRule opposite: #label'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaSwitchLabel class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SwitchLabel super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'adding' }
FASTJavaSwitchLabel >> addCaseExpression: anObject [

	<ignoreForCoverage>
	<generated>
	^ self caseExpressions add: anObject
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> caseExpressions [
	"Relation named: #caseExpressions type: #FASTTExpression opposite: #switchLabelOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The expressions of this case label; empty for default'>
	<derived>
	<FMProperty: #caseExpressions type: #FASTTExpression opposite: #switchLabelOwner>
	<multivalued>
	^ self attributeAt: #caseExpressions ifAbsentPut: [ FMMultivalueLink on: self opposite: #switchLabelOwner: ]
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> caseExpressions: anObject [

	<ignoreForCoverage>
	<generated>
	self caseExpressions value: anObject
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> caseStatementOwner [
	"Relation named: #caseStatementOwner type: #FASTJavaCaseStatement opposite: #labels"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The case statement that owns me'>
	<container>
	^ caseStatementOwner
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> caseStatementOwner: anObject [

	<ignoreForCoverage>
	<generated>
	caseStatementOwner := anObject
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> guard [
	"Relation named: #guard type: #FASTTExpression opposite: #switchLabelGuardOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The expression a match must satisfy for this label to apply'>
	<FMProperty: #guard type: #FASTTExpression opposite: #switchLabelGuardOwner>
	^ self attributeAt: #guard ifAbsent: [ nil ]
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> guard: anObject [

	<ignoreForCoverage>
	<generated>
	(self attributeAt: #guard ifAbsentPut: [nil]) == anObject ifTrue: [ ^ anObject ].
	anObject ifNil: [ | otherSide |
		otherSide :=  self guard.
		self attributeAt: #guard put: anObject.
		otherSide switchLabelGuardOwner: nil ]
	ifNotNil: [ 
		self attributeAt: #guard put: anObject.
		anObject switchLabelGuardOwner: self ]
]

{ #category : 'testing' }
FASTJavaSwitchLabel >> isSwitchLabel [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> switchRuleOwner [
	"Relation named: #switchRuleOwner type: #FASTJavaSwitchRule opposite: #label"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The switch rule that owns me'>
	<container>
	<derived>
	^ switchRuleOwner
]

{ #category : 'accessing' }
FASTJavaSwitchLabel >> switchRuleOwner: anObject [

	<ignoreForCoverage>
	<generated>
	switchRuleOwner := anObject
]

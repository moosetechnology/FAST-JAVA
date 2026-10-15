"
I represent an arrow-form switch rule.

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `switchExpressionOwner` | `FASTJavaSwitchRule` | `rules` | `FASTJavaSwitchExpression` | The switch expression that owns me|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `body` | `FASTJavaSwitchRule` | `switchRuleBodyOwner` | `FASTJavaEntity` | The body of the switch rule|
| `label` | `FASTJavaSwitchRule` | `switchRuleOwner` | `FASTJavaSwitchLabel` | The label of the switch rule|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `endPos` | `Number` | nil | |
| `startPos` | `Number` | nil | |

"
Class {
	#name : 'FASTJavaSwitchRule',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTTEntity',
	#classTraits : 'FASTTEntity classTrait',
	#instVars : [
		'#body => FMOne type: #FASTJavaEntity opposite: #switchRuleBodyOwner',
		'#label => FMOne type: #FASTJavaSwitchLabel opposite: #switchRuleOwner',
		'#switchExpressionOwner => FMOne type: #FASTJavaSwitchExpression opposite: #rules'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaSwitchRule class >> annotation [

	<ignoreForCoverage>
	<FMClass: #SwitchRule super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'accessing' }
FASTJavaSwitchRule >> body [
	"Relation named: #body type: #FASTJavaEntity opposite: #switchRuleBodyOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The body of the switch rule'>
	^ body
]

{ #category : 'accessing' }
FASTJavaSwitchRule >> body: anObject [

	<ignoreForCoverage>
	<generated>
	body := anObject
]

{ #category : 'testing' }
FASTJavaSwitchRule >> isSwitchRule [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaSwitchRule >> label [
	"Relation named: #label type: #FASTJavaSwitchLabel opposite: #switchRuleOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The label of the switch rule'>
	^ label
]

{ #category : 'accessing' }
FASTJavaSwitchRule >> label: anObject [

	<ignoreForCoverage>
	<generated>
	label := anObject
]

{ #category : 'accessing' }
FASTJavaSwitchRule >> switchExpressionOwner [
	"Relation named: #switchExpressionOwner type: #FASTJavaSwitchExpression opposite: #rules"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The switch expression that owns me'>
	<container>
	^ switchExpressionOwner
]

{ #category : 'accessing' }
FASTJavaSwitchRule >> switchExpressionOwner: anObject [

	<ignoreForCoverage>
	<generated>
	switchExpressionOwner := anObject
]

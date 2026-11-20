"
I am the `super` of a superclass field access, a superclass method invocation or a
method reference on `super` (JLS 15.11.2, 15.12 and 15.13).

I am a keyword, not a name and not an expression of my own: `x = super` is not Java, and I
am only ever written before the dot or the `::` of what I reach. I may be qualified by a
type name, and `T.super` then reaches a member of the superinterface T rather than of the
superclass.

```language=text
super.toString()
Outer.super.toString()
```

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `receiverOwner` | `FASTJavaTReceiver` | `receiver` | `FASTJavaTWithReceiver` | The owner of the receiver|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `type` | `FASTJavaSuper` | `javaSuperOwner` | `FASTJavaTypeName` | The type whose superinterface I reach, e.g. the `Outer` of `Outer.super`|



"
Class {
	#name : 'FASTJavaSuper',
	#superclass : 'FASTJavaEntity',
	#traits : 'FASTJavaTReceiver',
	#classTraits : 'FASTJavaTReceiver classTrait',
	#instVars : [
		'#type => FMOne type: #FASTJavaTypeName opposite: #javaSuperOwner'
	],
	#category : 'FAST-Java-Model-Entities',
	#package : 'FAST-Java-Model',
	#tag : 'Entities'
}

{ #category : 'meta' }
FASTJavaSuper class >> annotation [

	<ignoreForCoverage>
	<FMClass: #Super super: #FASTJavaEntity>
	<package: #'FAST-Java-Model'>
	<generated>
]

{ #category : 'testing' }
FASTJavaSuper >> isSuper [

	<ignoreForCoverage>
	<generated>
	^ true
]

{ #category : 'accessing' }
FASTJavaSuper >> type [
	"Relation named: #type type: #FASTJavaTypeName opposite: #javaSuperOwner"

	<ignoreForCoverage>
	<generated>
	<FMComment: 'The type whose superinterface I reach, e.g. the `Outer` of `Outer.super`'>
	^ type
]

{ #category : 'accessing' }
FASTJavaSuper >> type: anObject [

	<ignoreForCoverage>
	<generated>
	type := anObject
]

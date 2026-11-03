# Migrating to FAST-JAVA v5

v5 takes out what v4 let the model say and Java does not write: annotations held as
modifiers, an array creation holding constructor arguments, a type relation that accepts
any variable expression. Each change below breaks code that reads the v4.4.0 API, and each
says what to write instead.

Nothing here has to be done at once: v4 is still a branch of its own, and
`commitish: 'v4'` keeps loading it.

## Annotations are no longer modifiers

A declaration writes its keywords and its annotations in one list (JLS 8.1.1), and v4 held
that list whole: `modifiers` answered `FASTJavaModifier` and `FASTJavaAnnotation` mixed
together. v5 holds them apart. `modifiers` answers the keywords, `annotations` answers the
annotations, and the two are ordered by the positions they carry.

Eleven declarations are affected — every one that can write a keyword:
`FASTJavaAnnotationInterfaceDeclaration`, `FASTJavaCatchPartStatement`,
`FASTJavaClassDeclaration`, `FASTJavaEnumDeclaration`, `FASTJavaForEachStatement`,
`FASTJavaInterfaceDeclaration`, `FASTJavaMethodEntity`, `FASTJavaParameter`,
`FASTJavaRecordDeclaration`, `FASTJavaTypePattern` and `FASTJavaVarDeclStatement`. The
eight positions that already used `annotations` in v4 are unchanged.

| v4.4.0 | v5 |
| --- | --- |
| `aDeclaration modifiers select: [ :each \| each isAnnotation ]` | `aDeclaration annotations` |
| `aDeclaration modifiers select: [ :each \| each isModifier ]` | `aDeclaration modifiers` |
| `aDeclaration addModifier: anAnnotation` | `aDeclaration addAnnotation: anAnnotation` |
| `anAnnotation javaModifierOwner` | `anAnnotation javaAnnotationOwner` |

To read the run as the source writes it, merge the two on their positions:

```st
(aDeclaration annotations asArray , aDeclaration modifiers asArray)
	sorted: [ :a :b | a startPos <= b startPos ]
```

`FASTJavaExportVisitor` does this, so exported source keeps a written `public @Dep final`
in that order. A declaration built by hand carries no positions, and writes its annotations
first.

`FASTJavaTModifier` is removed with this change: `FASTJavaModifier` was the only keyword
class left once annotations stopped being modifiers, so the `modifiers` relation faces that
class directly. Code testing `isKindOf: FASTJavaTModifier` should test
`isKindOf: FASTJavaModifier`, or send `isModifier`.

## An array creation is no longer a class instance creation

`FASTJavaNewArray` was a subclass of `FASTJavaNewExpression`, which gave it four relations
JLS 15.10.1 never writes. It is now a `FASTJavaEntity` of its own, using `FASTTExpression`
and `FASTJavaTReceiver` — it can still *be* a receiver, since `new int[3].length` is legal.

Gone from an array creation: `arguments`, `addArgument:`, `receiver`, `receiver:`,
`typeArguments`, `addTypeArgument:` and `isDiamond`. It keeps `type`, `brackets` and
`initializer`.

| v4.4.0 | v5 |
| --- | --- |
| `aModel allWithSubTypesOf: FASTJavaNewExpression` (arrays included) | ask for `FASTJavaNewArray` as well |
| `aNewArray isNewExpression` | `aNewArray isNewArray` |
| `aTypeExpression javaNewExpressionOwner` | `javaNewExpressionTypeOwner`, or `javaNewArrayTypeOwner` for an array creation |

## A pair of brackets is an entity

Each pair of brackets carries the annotations written on it (JLS 10.6, 15.10.1), so a pair
is an entity rather than a count or a bare expression. An array creation holds one per
dimension, in the order it writes them, under `brackets` — the name a parameter, a
declarator and a method already used in v4.

| v4.4.0 | v5 |
| --- | --- |
| `aNewArray arguments` | `aNewArray brackets` |
| `aNewArray arguments size` | `aNewArray dimensions` |
| `aNewArray arguments first` | `aNewArray brackets first expression` |
| `FASTJavaEmptyDimExpression` | `FASTJavaDimension` |

A pair that says a length is a `FASTJavaDimensionExpression`, and `expression` answers the
length — the `3` of `new int[3]`. A pair left empty is a plain `FASTJavaDimension`, the
class already used after a name, after a parameter list and for a variable-arity ellipsis.
Both carry `annotations`, so `new int @A [3]` keeps `@A` on the pair the source writes it
on.

## A relation that holds a written type is typed as one

Five relations were declared to hold a `FASTJavaVariableExpression` where only a type can
be written, which is why `FASTJavaTypeExpression` is a subclass of
`FASTJavaVariableExpression` at all. They now hold a `FASTJavaTypeExpression`:
`FASTJavaCastExpression>>type`, `FASTJavaMethodEntity>>type`,
`FASTJavaNewExpression>>type`, `FASTJavaParameter>>type` and
`FASTJavaVarDeclStatement>>type`.

Reading them is unchanged — over the whole of JDK 8 and JDK 25 they never held anything
else. Code that *writes* one, in a transformation or a hand-built model, must now pass a
type expression.

`FASTJavaClassProperty>>type` and `FASTJavaOuterThis>>type` are left alone: the name before
`.class` or `.this` really can be a plain variable expression, as in `a.b.C.class`.

## Renamed relations

Each rename applies to the setter too, and to the `addX:` of a multivalued relation.

| v4.4.0 | v5 |
| --- | --- |
| `FASTJavaCatchPartStatement>>catchedTypes` | `caughtTypes` |
| `FASTJavaCatchPartStatement>>addCatchedType:` | `addCaughtType:` |
| `FASTJavaForEachStatement>>fieldname` | `fieldName` |
| `FASTTStatement>>forIninitializerOwner` | `forInitializerOwner` |
| `FASTJavaVariableExpression>>javaCatchParameterOwnler` | `javaCatchParameterOwner` |
| `FASTJavaTypeName>>javaTypeNameQualify` | `javaQualifiedTypeNameOwner` |
| `FASTJavaVariableExpression>>javaNewExpressionOwner` | `FASTJavaTypeExpression>>javaNewExpressionTypeOwner` |

## The deprecated package is gone

`FAST-Java-Deprecated` and the `'core'` group entry that loaded it are removed. Each method
it held named its replacement when it was deprecated:

| removed | use instead |
| --- | --- |
| `FASTJavaForStatement>>incrementor`, `incrementor:` | `incrementors` |
| `FASTJavaForStatement>>initializer`, `initializer:` | `initializers` |
| `FASTJavaLabeledCaseStatement>>label`, `label:` | `labels`, and `caseExpressions` on each label |
| `FASTJavaSwitchRule>>switchExpressionOwner`, `switchExpressionOwner:` | `switchOwner` |
| `FASTJavaTypeParameterExpression>>javaMethodTypeParameterOwner`, `javaMethodTypeParameterOwner:` | `javaTypeParameterOwner` |
| `FASTJavaVariableExpression>>javaMethodReferenceOwner`, `javaMethodReferenceOwner:` | `receiverOwner` |

`label:` has no replacement setter, and could not have one: it built a
`FASTJavaSwitchLabel` with `new`, which puts the label in no model however the owner is
added. Create the label through the model that will hold it, then add it to `labels`.

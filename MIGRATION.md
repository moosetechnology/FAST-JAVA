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
be written. They now hold a `FASTJavaTypeExpression`: `FASTJavaCastExpression>>type`,
`FASTJavaMethodEntity>>type`, `FASTJavaNewExpression>>type`, `FASTJavaParameter>>type` and
`FASTJavaVarDeclStatement>>type`.

Reading them is unchanged — over the whole of JDK 8 and JDK 25 they never held anything
else. Code that *writes* one, in a transformation or a hand-built model, must now pass a
type expression.

The two that genuinely hold a variable expression go the other way and are widened to
`FASTTExpression`: see the next section.

## A type is no longer a variable expression

`FASTJavaTypeExpression` was a subclass of `FASTJavaVariableExpression`, so every type
written in source could be assigned to, closed as a resource of a try, and written as an
element of an annotation. It is now a `FASTJavaEntity` using `FASTTExpression`,
`FASTTNamedEntity`, `FASTJavaTReceiver` and `FASTJavaTWithAnnotations`.

What it keeps: `name` — a primitive type writes the keyword that names it — and being a
receiver, since JLS 15.13 lets `String::length` name a type as what it reads the method
from. What it loses: `FASTJavaTAssignable` (`javaVariableAssignmentOwner`),
`FASTJavaTTryResource` (`javaTryResourceOwner`), `FASTJavaTAnnotationElement`
(`arrayOwner`, `defaultValueOwner`, `parentAnnotation`), and the variable-side owners
`javaCatchParameterOwner`, `javaParameterVariableOwner`, `javaTypePatternVariableOwner`
and `javaVariableDeclaratorOwner`. None of them was ever filled on a type.

`isKindOf: FASTJavaVariableExpression` and `allWithSubTypesOf: FASTJavaVariableExpression`
no longer answer for a type; ask for `FASTJavaTypeExpression`, or send `isTypeExpression`.
`FASTJavaVisitor>>visitFASTJavaTypeExpression:` now forwards to `visitFASTTExpression:`
rather than `visitFASTTVariableExpression:`, which matters to a visitor that overrode the
latter.

Two relations that hold what is written before `.class` and before `.this` are widened
from `FASTJavaVariableExpression` to `FASTTExpression` to make this possible:
`FASTJavaClassProperty>>type` and `FASTJavaOuterThis>>type`. Both really do hold a plain
variable expression most of the time — in `a.b.C.class` the name before `.class` is read as
one — so they are widened rather than narrowed, and reading them is unchanged.

## An enum constant is no longer a variable expression either

`FASTJavaEnumConstant` declares a name, writes arguments where the constructor takes them
and a class body where it overrides something (JLS 8.9.1) — it is a declaration, not a name
used as a value. It is now a `FASTJavaEntity` using `FASTTNamedEntity` and the three traits
it already had, so `name`, `annotations`, `arguments` and `declarations` are unchanged.
`FASTJavaVisitor>>visitFASTJavaEnumConstant:` forwards to `visitFASTTNamedEntity:` rather
than `visitFASTTVariableExpression:`.

`FASTJavaClassProperty` is **not** changed, though its name suggests it should be. It is
not only `Foo.class`: it is the model's reading of any dotted name used as a value, and
JLS 15.26 lets one stand on the left of an assignment, as `Foo.bar = 1` does. It is a
variable expression, it keeps `FASTJavaTAssignable` with the rest, and only its name is
wrong.

## A stray semicolon is no longer a method

JLS 8.1.6 lets a class body write a bare `;` where a member would go. `v4` modelled it as
`FASTJavaEmptyMethodDeclaration`, a subclass of `FASTJavaMethodEntity`, so a semicolon
carried a name, modifiers, annotations, parameters, throws, type parameters and a statement
block — and `allWithType: FASTJavaMethodEntity` counted it as a method: 12 of them in 9 of
400 JDK 25 files, among 3438 method entities.

| v4.4.0 | v5 |
| --- | --- |
| `FASTJavaEmptyMethodDeclaration` | `FASTJavaEmptyDeclaration` |
| `anEntity isEmptyMethodDeclaration` | `anEntity isEmptyDeclaration` |
| `aModel newEmptyMethodDeclaration` | `aModel newEmptyDeclaration` |
| `visitFASTJavaEmptyMethodDeclaration:` | `visitFASTJavaEmptyDeclaration:` |

It is a `FASTJavaEntity` using `FASTJavaTDeclaration`, so it still sits in `declarations`
beside the real members, and it still writes itself back as `;`.

## A variable arity parameter writes an ellipsis

`FASTJavaParameter>>variableArguments` held the `FASTJavaDimension` of the `...`, under a
plural name for a single value, beside a `hasVariableArguments` boolean that said the same
thing twice.

| v4.4.0 | v5 |
| --- | --- |
| `aParameter variableArguments` | `aParameter ellipsis` |
| `aParameter variableArguments:` | `aParameter ellipsis:` |
| `aDimension variableArgumentsOwner` | `aDimension ellipsisOwner` |
| `aParameter hasVariableArguments:` | nothing — set `ellipsis:` |

`hasVariableArguments` still answers, as `self ellipsis isNotNil`. It is no longer a stored
property, so it no longer appears in MSE.

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

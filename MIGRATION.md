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

`FASTJavaThis>>type` is a sixth, but what it holds changes with it, so it has a section of
its own below.

## Eleven more relations are declared as narrowly as the grammar allows

A relation declared wider than what it can hold tells a reader nothing and lets a
transformation build what Java cannot write. Eleven of them were found by sweeping every
relation in the model over 6013 files of JDK 8 and JDK 25 — recording what each one actually
held — and keeping only the ones the JLS grammar bounds to a single kind.

| relation | v4.4.0 | v5 | why |
| --- | --- | --- | --- |
| `FASTJavaNewExpression>>type` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 15.9: a creation instantiates a class or interface type |
| `FASTJavaCatchPartStatement>>caughtTypes` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 14.20: a catch clause catches class types |
| `FASTJavaClassDeclaration>>superclass` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 8.1.4 |
| `FASTJavaClassDeclaration>>interfaces` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 8.1.5 |
| `FASTJavaInterfaceDeclaration>>interfaces` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 9.1.3 |
| `FASTJavaEnumDeclaration>>interfaces` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 8.9.1 |
| `FASTJavaRecordDeclaration>>interfaces` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 8.10.1 |
| `FASTJavaClassDeclaration>>permittedSubtypes` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 8.1.6 |
| `FASTJavaInterfaceDeclaration>>permittedSubtypes` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 9.1.4 |
| `FASTJavaCastExpression>>additionalBounds` | `FASTJavaTypeExpression` | `FASTJavaClassTypeExpression` | JLS 4.9: each additional bound is an interface type |
| `FASTJavaNewArray>>initializer` | `FASTTExpression` | `FASTJavaArrayInitializer` | JLS 10.6 |

Reading them is unchanged: over those 6013 files none held anything else. Code that *writes*
one, in a transformation or a hand-built model, must now pass the narrower entity. The
opposites move with them — `javaNewExpressionTypeOwner`, `catchOwner`,
`javaClassDeclarationSuperclassOwner` and the rest are on `FASTJavaClassTypeExpression`
rather than on `FASTJavaTypeExpression`, and `javaNewArrayInitialOwner` is on
`FASTJavaArrayInitializer` rather than on every expression in the model.

**Three that look the same and are not.** `FASTJavaTypeParameterExpression>>types`,
`FASTJavaTypeParameterExpression>>superType` and
`FASTJavaMethodInvocation>>typeArguments` held nothing but class types over the whole
sample as well, and are unchanged: JLS 4.5.1 writes a *reference* type in each, so
`? extends Number[]`, `? super String[]` and `List.<String[]>of()` are all legal Java that
the corpus simply never writes. The suite says so where the corpus does not —
`JavaSmaCCMethodBoundedWildCardParameterTypeTest` asserts that `Class<? extends Number[]>`
keeps an array type as its bound.

## A type is no longer a variable expression

`FASTJavaTypeExpression` was a subclass of `FASTJavaVariableExpression`, so every type
written in source could be assigned to, closed as a resource of a try, and written as an
element of an annotation. It is now a `FASTJavaEntity` using `FASTTExpression`,
`FASTJavaTReceiver` and `FASTJavaTWithAnnotations`.

What it keeps: being a receiver, since JLS 15.13 lets `String::length` name a type as what
it reads the method from. What it loses: `FASTJavaTAssignable` (`javaVariableAssignmentOwner`),
`FASTJavaTTryResource` (`javaTryResourceOwner`), `FASTJavaTAnnotationElement`
(`arrayOwner`, `defaultValueOwner`, `parentAnnotation`), and the variable-side owners
`javaCatchParameterOwner`, `javaParameterVariableOwner`, `javaTypePatternVariableOwner`
and `javaVariableDeclaratorOwner`. None of them was ever filled on a type. It also loses
its `name`, which the next section covers.

`isKindOf: FASTJavaVariableExpression` and `allWithSubTypesOf: FASTJavaVariableExpression`
no longer answer for a type; ask for `FASTJavaTypeExpression`, or send `isTypeExpression`.
`FASTJavaVisitor>>visitFASTJavaTypeExpression:` now forwards to `visitFASTTExpression:`
rather than `visitFASTTVariableExpression:`, which matters to a visitor that overrode the
latter.

## A type no longer carries a name

`FASTJavaTypeExpression` used `FASTTNamedEntity`, so every type written in source carried a
`name` String beside whatever already said what the type was. On a class type it said it
twice — `name` held a String and `typeName` held a `FASTJavaTypeName` — and on every other
type the class said it alone. That is what
[#42](https://github.com/moosetechnology/FAST-JAVA/issues/42),
[#50](https://github.com/moosetechnology/FAST-JAVA/issues/50) and
[#147](https://github.com/moosetechnology/FAST-JAVA/issues/147) asked to remove. The trait
is gone, and with it `name`, `name:` and `invokedIn`, which was never filled.

Reading `name` does not raise. `MooseObject` answers `#noname` for an entity with no name
property, so v4 code that read `'int'` now reads `#noname` and reports nothing. Search out
the senders rather than waiting for one to fail.

What a type is, the class says:

| v4.4.0 | v5 |
| --- | --- |
| `aPrimitiveType name` (`'int'`, `'void'`, …) | `aPrimitiveType class` (`FASTJavaIntTypeExpression`, …) |
| `aVarType name` (`'var'`) | `aType isKindOf: FASTJavaVarTypeExpression` |
| `aClassType name` | `aClassType typeName name`, or `aClassType fullName` for the dotted one |
| `anArrayType name` | `anArrayType baseType` |
| `aType isKindOf: FASTTNamedEntity` | `aType isTypeExpression` |

`FASTJavaPrimitiveTypeExpression` is now abstract in fact as well as in name: the grammar
only ever builds one of its nine subclasses, so the importer's `visitPrimitiveType:` — which
built a bare one named by the keyword it had read — is gone with the name it wrote.

## An array's element type is a type

`FASTJavaArrayTypeExpression>>baseType` was declared `FASTTExpression`, the widest thing it
could be, and held four different kinds of entity, chosen by nothing but how the element
type happened to be written:

| written | v4.4.0 `baseType` |
| --- | --- |
| `int[]` | `FASTJavaIntTypeExpression` |
| `Byte[]` | `FASTJavaTypeName` |
| `java.util.List[]` | `FASTJavaQualifiedTypeName` |
| `List<String>[]` | `FASTJavaClassTypeExpression` |
| `Byte[][]` | `FASTJavaArrayTypeExpression` |

The second and third are not types at all. A `FASTJavaTypeName` is the *name* that a
`FASTJavaClassTypeExpression` holds in its `typeName`, and `Byte` and `List<String>` are
the same construct — a class type written as the element of an array (JLS 10.1). The only
thing deciding which of the two a reader got was whether type arguments happened to follow.

A name written as an element type is now read as the class type it stands for, so
`baseType` always holds a `FASTJavaTypeExpression` and the relation is declared as one.

| v4.4.0 | v5 |
| --- | --- |
| `anArrayType baseType name` | `anArrayType baseType typeName name` |
| `anArrayType baseType class = FASTJavaTypeName` | `anArrayType baseType isClassTypeExpression` |
| `aTypeName javaArrayTypeNameOwner` | `aTypeExpression javaArrayBaseTypeOwner` |

`anArrayType baseType fullName` is unchanged and is the shortest way to the name, dotted
or not: a class type expression answers its type name's. Code that already handled
`List<String>[]` needs no change at all; code that assumed the bare name does. Nothing is
exported differently — a class type with no arguments writes its name and nothing else, so
`Byte[]` is still written back as `Byte[]`.

## A type name is not an expression

`FASTJavaTypeName`, and `FASTJavaQualifiedTypeName` with it, used `FASTTExpression` and
`FASTJavaTAnnotationElement`, so the name a type is written as could stand wherever a value
stands: as an argument, as the expression of a `return`, on either side of an infix
operation, as the element of an annotation. It is now a `FASTJavaEntity` using
`FASTTNamedEntity`, `FASTJavaTWithAnnotations` and `FASTTWithArguments`.

Nothing is lost, because nothing was ever there. The two traits contribute 37 relation ends
between them, and over 600 files of JDK 8 and JDK 25 — 18,938 type names — not one was ever
filled. `FASTJavaArrayTypeExpression>>baseType` was the last relation that could put a type
name where an expression goes, and the section above took it away.

What it keeps is what the language writes: a name (JLS 4.3), the annotations a qualifying
part writes after the dot — the `java.util.@Ann List` of JLS 4.11 — and the type arguments
such a part writes, as `ArrayList<E>.ArrayListSpliterator` does.

| v4.4.0 | v5 |
| --- | --- |
| `aTypeName argumentOwner`, `returnOwner`, `parentExpression`, 31 more | gone; each was always nil |
| `aTypeName arrayOwner`, `defaultValueOwner`, `parentAnnotation` | gone; each was always nil |
| `aModel allUsing: FASTTExpression` | no longer answers type names; add `allWithSubTypesOf: FASTJavaTypeName` if you want them |

`FASTJavaVisitor>>visitFASTJavaTypeName:` now forwards to `visitFASTTNamedEntity:` rather
than `visitFASTTExpression:`, which matters to a visitor that overrode the latter to catch
every expression at once.

## `super` is an entity, and not a field named `super`

`super` is a keyword, not a name (JLS 15.11.2, 15.12 and 15.13), and it is only ever
written before the dot or the `::` of what it reaches. v4 read it four ways:

| written | v4.4.0 |
| --- | --- |
| `super.go()` | the receiver is a `FASTJavaIdentifier` named `'super'` |
| `super.f` | the receiver is a `FASTJavaVariableExpression` named `'super'` |
| `super::go` | there is no receiver at all, and the exporter wrote the keyword back from nothing |
| `T.super.go()`, `T.super.f`, `T.super::go` | the receiver is a `FASTJavaFieldAccess` whose `fieldName` is the String `'super'`, holding the qualifier as its own receiver |

and the qualifier of the fourth was read two ways in its turn — a `FASTJavaIdentifier` for
`Outer`, a `FASTJavaClassProperty` for `p.q.Outer` — neither of them the type name JLS
15.11.2 writes there.

`FASTJavaSuper` is one entity for all of it. It holds nothing but an optional `type`, the
`FASTJavaTypeName` or `FASTJavaQualifiedTypeName` that qualifies it, and it is the receiver
of the field access, the invocation or the method reference that writes it. It is a
`FASTJavaEntity` using `FASTJavaTReceiver` and nothing else: `super` is not an expression,
and `x = super` is not Java.

| v4.4.0 | v5 |
| --- | --- |
| `aReceiver name = 'super'` | `aReceiver isSuper` |
| `aFieldAccess fieldName = 'super'` | `aFieldAccess receiver isSuper` |
| the qualifier, read through the inner field access's `receiver` | `aSuper type` |
| `aMethodReference receiver isNil`, meaning `super::m` | `aMethodReference receiver isSuper`, with a nil `type` |
| — | `FASTJavaSuper`, `isSuper`, `aModel newSuper`, `visitFASTJavaSuper:` |

A method reference always has a receiver now, so `FASTJavaExportVisitor` no longer writes
`super` for a nil one, and a visitor that walked receivers no longer skips the keyword.

An explicit constructor invocation is **not** affected: `super(...)` and `o.super(...)`
stay a `FASTJavaMethodInvocation` named `'super'`, because JLS 8.8.7.1 writes a *Primary*
before that dot, not a type name.

## `this` is one entity, and its qualifier is a type name

JLS 15.8.3 writes `this` as a primary, and JLS 15.8.4 writes `TypeName . this` for the
enclosing instance of a named class. One keyword, one optional qualifier. v4 read it three
ways, and read the qualifier as a value:

| written | v4.4.0 |
| --- | --- |
| `this.go()` | the receiver is a `FASTJavaIdentifier` named `'this'` |
| `go(this)`, `return this`, `this.f` | a `FASTJavaVariableExpression` named `'this'` |
| `Outer.this` | a `FASTJavaOuterThis`, unrelated to either, whose `type` held a `FASTJavaVariableExpression` |
| `p.q.Outer.this` | the same, whose `type` held a `FASTJavaClassProperty` |

`FASTJavaOuterThis` is removed. `FASTJavaThis` — a class v4 already declared and never
built — is the keyword in every position, and its `type` is the `FASTJavaTypeName` or
`FASTJavaQualifiedTypeName` that qualifies it, or nil. It is a `FASTJavaEntity` using
`FASTTExpression` and `FASTJavaTReceiver`: `this` **is** an expression, unlike `super`, but
it is not a variable expression — nothing declares it, nothing assigns to it, and
`this = x` is not Java.

| v4.4.0 | v5 |
| --- | --- |
| `FASTJavaOuterThis` | `FASTJavaThis` |
| `anEntity isOuterThis` | `anEntity isThis` |
| `aModel newOuterThis` | `aModel newThis` |
| `visitFASTJavaOuterThis:` | `visitFASTJavaThis:` |
| `aTypeName javaOuterThisOwner` | `aTypeName javaThisOwner` |
| `aReceiver name = 'this'` | `aReceiver isThis` |
| `anOuterThis type`, a `FASTJavaVariableExpression` or `FASTJavaClassProperty` | `aThis type`, a `FASTJavaTypeName` or `FASTJavaQualifiedTypeName`, or nil |
| walking a dotted qualifier by `fieldName` and `type` | by `name` and `namespace` |

`aThis type name` is unchanged for a simple qualifier, and `aThis type fullName` answers
the whole one, dotted or not, which nothing in v4 could do.
`FASTJavaVisitor>>visitFASTJavaThis:` forwards to `visitFASTTExpression:` rather than
`visitFASTTVariableExpression:`.

An explicit constructor invocation is **not** affected: `this(...)` stays a
`FASTJavaMethodInvocation` named `'this'`, as `super(...)` does, because JLS 8.8.7.1 writes
a *Primary* before that dot.

## An enum constant is no longer a variable expression either

`FASTJavaEnumConstant` declares a name, writes arguments where the constructor takes them
and a class body where it overrides something (JLS 8.9.1) — it is a declaration, not a name
used as a value. It is now a `FASTJavaEntity` using `FASTTNamedEntity` and the three traits
it already had, so `name`, `annotations`, `arguments` and `declarations` are unchanged.
`FASTJavaVisitor>>visitFASTJavaEnumConstant:` forwards to `visitFASTTNamedEntity:` rather
than `visitFASTTVariableExpression:`.

## A class literal is an entity of its own

`FASTJavaClassProperty` held two different things under one name. Over 300 JDK 25 files it
carried 124 class literals — `String.class`, `int[].class`, `void.class` (JLS 15.8.2) — and
732 dotted names used as values, such as `System.out` (JLS 6.5.6.2). The only way to tell
them apart was `fieldName = 'class'`, and `type` meant a different thing in each: in the
124 it held a type expression every time, in the 732 it held a variable expression every
time, with no overlap at all.

`FASTJavaClassLiteral` is now its own entity: a `FASTJavaEntity` using `FASTTExpression`,
`FASTJavaTReceiver` and `FASTJavaTAnnotationElement` — one is often written as the element
of an annotation, and `String.class.getName()` makes it a receiver. Nothing assigns to it,
so it does not carry `FASTJavaTAssignable`, which it used to inherit.

| v4.4.0 | v5 |
| --- | --- |
| a `FASTJavaClassProperty` with `fieldName = 'class'` | `FASTJavaClassLiteral` |
| `aClassProperty fieldName` (always `'class'`) | nothing — the entity says it |
| `aClassProperty type` | `aClassLiteral type`, declared `FASTJavaTypeExpression` |
| `aTypeExpression javaClassPropertyOwner` | `javaClassLiteralTypeOwner` |

The other 732 are dotted names used as values, which the next section reads as
`FASTJavaQualifiedName`.

## A dotted name is one entity, wherever it stands

JLS 6.5 says a dotted name is ambiguous until it is resolved: `a.b` may name a package, a
type or a field, and a parser cannot tell which. v4 read it two ways depending on where it
stood — a `FASTJavaQualifiedName` outside every type declaration, in an import, a package
declaration or a module directive, and a `FASTJavaClassProperty` inside one. The two
described the same text.

`FASTJavaClassProperty` is removed. A dotted name is a `FASTJavaQualifiedName` everywhere,
and that class is now an expression: it gained `FASTTExpression`, `FASTJavaTReceiver`,
`FASTJavaTTryResource` and `FASTJavaTAnnotationElement` beside the `FASTJavaTAssignable`,
`FASTTNamedEntity` and `FASTTEntity` it already had. `FASTJavaTAssignable` is finally
earned rather than vestigial: JLS 15.26 lets a dotted name stand on the left of an
assignment, as `Foo.bar = 1` does, where an import name never can.

| v4.4.0 | v5 |
| --- | --- |
| `FASTJavaClassProperty` | `FASTJavaQualifiedName` |
| `aClassProperty fieldName` | `aQualifiedName name` |
| `aClassProperty type` | `aQualifiedName namespace` |
| `anExpression javaClassPropertyOwner` | `aQualifiedName namespaceOwner` |
| `anEntity isClassProperty` | `anEntity isQualifiedName` |
| `aModel newClassProperty` | `aModel newQualifiedName` |
| `visitFASTJavaClassProperty:` | `visitFASTJavaQualifiedName:` |

The shape changes with the class. `Hello.property` was one entity whose `type` held a
`FASTJavaVariableExpression`; it is now two, `property` with `Hello` as its `namespace`,
both of them `FASTJavaQualifiedName`. A **simple** name in an expression is still a
`FASTJavaVariableExpression` — only the parts of a dotted name are names.

`FASTJavaFieldAccess` is untouched and still means what it says. The grammar's FieldAccess
rule matches `Primary . Identifier`, `super . Identifier` and `TypeName . super .
Identifier`, where a package or type qualifier is impossible, so there the parser really
does know it is a field access. Merging the ambiguous names into it would have made the
model assert field accesses that do not exist: in `com.foo.Bar.CONSTANT`, `com.foo` is a
package, and nothing reads a field `Bar` from it.

With the two readings merged, the importer no longer guesses from where a name stands:
`isOutsideTypeDeclaration` is gone, and the places that write a name rather than an
expression — imports, package declarations, module directives, annotation names — ask for
one explicitly. One consequence is worth knowing: a bare expression or block parsed on its
own used to read its names as package names, so `a = 1` as a fragment made `a` a
`FASTJavaQualifiedName` where the same text inside a class made it a
`FASTJavaVariableExpression`. Both now read the same way.

## `var` is the inferred type only where Java infers it

The importer read `var` as `FASTJavaVarTypeExpression` wherever a class type was written,
deciding on spelling alone. JLS 14.4.1 and 15.27.1 write `var` as the type of a local
variable declaration — standing on its own, in the first part of a `for`, as a resource of a
`try`, or in a for-each header — and of a lambda parameter, and nowhere else. JLS 3.9 keeps
`var` from naming a class, an interface or a type parameter, so anywhere else it is a name
that resolves to nothing.

Written elsewhere, `var` is now the `FASTJavaClassTypeExpression` its text says, with a
`typeName` named `var`. Five of those positions used to raise `SlotNotFound` rather than
build anything, because a var type expression is not a class type and the relations hold
one: `new var()`, `extends var`, `implements var`, `catch (var e)` and `throws var`.

| written | v4.4.0 | v5 |
| --- | --- | --- |
| `var x = 1;` | `FASTJavaVarTypeExpression` | unchanged |
| `for (var s : l)` | `FASTJavaVarTypeExpression` | unchanged |
| `try (var r = …)` | `FASTJavaVarTypeExpression` | unchanged |
| `(var a) -> a` | `FASTJavaVarTypeExpression` | unchanged |
| `var f;` as a field | `FASTJavaVarTypeExpression` | `FASTJavaClassTypeExpression` |
| `void m(var p)` | `FASTJavaVarTypeExpression` | `FASTJavaClassTypeExpression` |
| `var m()` | `FASTJavaVarTypeExpression` | `FASTJavaClassTypeExpression` |
| `List<var>`, `(var) o`, `o instanceof var` | `FASTJavaVarTypeExpression` | `FASTJavaClassTypeExpression` |
| `new var()`, `extends var`, `catch (var e)` | raised `SlotNotFound` | `FASTJavaClassTypeExpression` |

No valid Java is read differently: a type named `var` cannot exist, so none of the changed
positions appears in code that compiles. Nothing is exported differently.

## A permits clause holds type names

`FASTJavaClassDeclaration>>permittedSubtypes` and
`FASTJavaInterfaceDeclaration>>permittedSubtypes` held `FASTJavaClassTypeExpression`, a type
that can carry type arguments and annotations. JLS 8.1.6 and 9.1.4 write
`permits TypeName {, TypeName}`: the clause names what may extend or implement the sealed
type, and a name is all it writes. SmaCC's grammar read a type there too, so
`sealed class A<T> permits B<T>` parsed where javac refuses it; the grammar now reads a
type name of its own, and the importer builds the type name it is.

Both relations hold a `FASTJavaTypeName`, or a `FASTJavaQualifiedTypeName` when the name is
written dotted — the same pair that `FASTJavaThis>>type`, `FASTJavaSuper>>type` and
`FASTJavaAnnotation>>type` hold.

| v4.4.0 | v5 |
| --- | --- |
| `aDeclaration permittedSubtypes anyOne typeName name` | `aDeclaration permittedSubtypes anyOne name` |
| `aDeclaration permittedSubtypes anyOne arguments` | gone; the clause writes none |
| `aDeclaration permittedSubtypes anyOne annotations` | gone; the clause writes none |
| `aClassType javaClassDeclarationPermittedSubtypeOwner` | `aTypeName javaClassDeclarationPermittedSubtypeOwner` |
| `aClassType javaInterfaceDeclarationPermittedSubtypeOwner` | `aTypeName javaInterfaceDeclarationPermittedSubtypeOwner` |

`aDeclaration permittedSubtypes anyOne fullName` is unchanged and is the shortest way to the
name, dotted or not. Nothing is exported differently.

## An annotation names its type, once

`FASTJavaAnnotation` used both `FASTTNamedEntity` and `FASTJavaTWithQualifiedName`, and the
importer filled them in turn: `@Override` set `name` to `'Override'` and left
`qualifiedName` nil, while `@java.io.Serial` set `name` to `'Serial'` — the last part only —
*and* built a `FASTJavaQualifiedName` holding the whole. One construct, read two ways, and
the only thing choosing between them was whether a dot happened to be written. Over 1600
files of JDK 8 and JDK 25 that is 4465 annotations read the first way and 555 the second.

JLS 9.7 writes an annotation as `@` followed by a *TypeName*, so that name is now a
`FASTJavaTypeName`, or a `FASTJavaQualifiedTypeName` when it is written qualified, held in
one relation that is always there. It is the same `type` relation, built by the same
`typeNameOf:`, that `FASTJavaThis` and `FASTJavaSuper` already use for their qualifiers.

Reading `name` does not raise. `MooseObject` answers `#noname` for an entity with no name
property, so v4 code that read `'Override'` now reads `#noname` and reports nothing. Search
out the senders rather than waiting for one to fail.

| v4.4.0 | v5 |
| --- | --- |
| `anAnnotation name` | `anAnnotation type name` |
| `anAnnotation name: aString` | `anAnnotation type: aFASTJavaTypeName` |
| `anAnnotation qualifiedName` | `anAnnotation type`, which is never nil |
| `anAnnotation qualifiedName fullName` | `anAnnotation type fullName` |
| `anAnnotation qualifiedName isNil` | `anAnnotation type class = FASTJavaTypeName` |
| `aQualifiedName qualifiedNameOwner` | `aTypeName javaAnnotationTypeOwner` |

`anAnnotation type fullName` answers what the source writes in either case — `'Override'`
or `'java.io.Serial'` — which v4 could only get by testing `qualifiedName` first and
falling back to `name`. Nothing is exported differently.

## An element-value pair is not an assignment

`@SuppressWarnings(value = "unchecked")` was read as a `FASTJavaAssignmentExpression`: the
element name as a `FASTJavaVariableExpression` in `variable`, the operator `=`, and the value
in `expression`. To fit there, the value had to be an expression, which is why
`FASTJavaArrayAnnotationElement` used `FASTTExpression` and `FASTJavaAssignmentExpression`
used `FASTJavaTAnnotationElement`. An annotation is not an expression, so
`@Outer(inner = @Inner)` raised instead of importing.

JLS 9.7.1 writes `Identifier = ElementValue`, which names an element of the annotation
interface and assigns nothing. It is now a `FASTJavaElementValuePair`, using
`FASTTNamedEntity` for the element name and holding the value in `value`, typed
`FASTJavaTAnnotationElement` like the values of an element value array and the default
value of an annotation element. An annotation's `elements` holds pairs or a single value,
both `FASTJavaTAnnotationArgument`, which `FASTJavaTAnnotationElement` uses. A pair stands
nowhere else.

`FASTJavaAssignmentExpression` no longer uses `FASTJavaTAnnotationElement`, and
`FASTJavaArrayAnnotationElement` no longer uses `FASTTExpression`. Both were there only
for this reading.

| v4.4.1 | v5 |
| --- | --- |
| `anAnnotation elements` holding `FASTJavaAssignmentExpression` | `anAnnotation elements` holding `FASTJavaElementValuePair` |
| `aPair variable name` | `aPair name` |
| `aPair expression` | `aPair value` |
| `aPair operator` | gone; a pair always writes `=` |
| `aValue javaAssignmentExpressionOwner` | `aValue elementValuePairOwner` |
| `aPair isAssignmentExpression` | `aPair isElementValuePair` |
| `visitFASTJavaAssignmentExpression:` for a pair | `visitFASTJavaElementValuePair:` |

`FASTJavaVisitor>>visitFASTJavaElementValuePair:` forwards to `visitFASTTNamedEntity:`, and
`visitFASTJavaArrayAnnotationElement:` now forwards to `visitFASTTEntity:` rather than
`visitFASTTExpression:`. Nothing is exported differently.

## A simple invocation receiver is read like any other simple name

`foo.bar()` wrote `foo` as a `FASTJavaIdentifier`, while `go(foo)`, `return foo` and
`foo + 1` wrote the same text as a `FASTJavaVariableExpression`. The branch that did it
said as much — *"It is more than propably an Identifier and not just an named element. So
you pass over the normal rules of the importer"*.

JLS 6.5 is why there was nothing to go on: a parser cannot resolve a simple name, since
`foo` may name a variable, a type or a package, so the choice was made on position alone.
Over 300 files of JDK 25 it produced 2734 of the 2809 `FASTJavaIdentifier` in the model.

A simple name written before the dot of an invocation is now a
`FASTJavaVariableExpression`, the same entity the same text gives anywhere else. A dotted
one is a `FASTJavaQualifiedName`, `this` is a `FASTJavaThis` and `super` a `FASTJavaSuper`,
as the sections above describe.

| v4.4.0 | v5 |
| --- | --- |
| `anInvocation receiver class = FASTJavaIdentifier` | `= FASTJavaVariableExpression` |

That left `FASTJavaIdentifier` holding only the variable a for-each declares, which the
next section gives to `FASTJavaVariableExpression` as well.

## The variable a for-each declares is a variable

Five relations in the model hold a variable that a declaration introduces. Four of them
agreed, and `FASTJavaForEachStatement` did not:

| relation | v4.4.0 type |
| --- | --- |
| `FASTJavaParameter>>variable` | `FASTJavaVariableExpression` |
| `FASTJavaVariableDeclarator>>variable` | `FASTJavaVariableExpression` |
| `FASTJavaTypePattern>>variable` | `FASTJavaVariableExpression` |
| `FASTJavaCatchPartStatement>>parameter` | `FASTJavaVariableExpression` |
| `FASTJavaForEachStatement>>fieldName` | `FASTJavaIdentifier` |

JLS 14.14.2 writes the header of a for-each as a local variable declaration, so what it
declares is a variable like the other four, and it is certainly not a field. The relation
is `variable` now and holds a `FASTJavaVariableExpression`.

`FASTJavaIdentifier` had nothing left to hold, so it is removed.

| v4.4.0 | v5 |
| --- | --- |
| `aForEach fieldName` | `aForEach variable` |
| `aForEach fieldName:` | `aForEach variable:` |
| `anIdentifier javaForEachStatementFieldNameOwner` | `aVariableExpression javaForEachStatementVariableOwner` |
| `FASTJavaIdentifier` | `FASTJavaVariableExpression` |
| `anEntity isIdentifier` | `anEntity isVariableExpression` |
| `aModel newIdentifier` | `aModel newVariableExpression` |
| `visitFASTJavaIdentifier:` | `visitFASTJavaVariableExpression:` |
| `aGroup allFASTJavaIdentifier` | `aGroup allWithType: FASTJavaVariableExpression` |

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

## A requires directive holds the modifiers it writes

`FASTJavaRequiresDirective` held `isStatic` and `isTransitive`, two booleans. JLS 7.7.1
writes `requires {RequiresModifier} ModuleName ;`, where a `RequiresModifier` is `transitive`
or `static` and nothing fixes their order, so `requires transitive static M;` and
`requires static transitive M;` are both Java. Two booleans cannot tell them apart, and v4
wrote both back as `requires static transitive M;`.

The directive now uses `FASTJavaTWithModifiers`, like every other declaration that writes a
keyword, and holds `FASTJavaModifier` entities in the order the source writes them, each
carrying its own positions. The export writes them in that order, so a source that writes
`transitive` first keeps it there.

`isStatic` and `isTransitive` still answer, computed over `modifiers` in
`FAST-Java-Model-Extension`, so code that only reads them is unchanged. They are no longer
properties of the metamodel, which is what breaks: they have no setters any more and they no
longer appear in an MSE export, where `modifiers` appears instead.

| v4.4.0 | v5 |
| --- | --- |
| `aRequires isStatic: true` | `aRequires addModifier: aStaticModifier` |
| `aRequires isTransitive: true` | `aRequires addModifier: aTransitiveModifier` |
| `aRequires isStatic` | unchanged |
| `aRequires isTransitive` | unchanged |
| — | `aRequires modifiers`, in the order the source writes them |

A `FASTJavaModifier` passed to `addModifier:` belongs to the model like any other entity, so
build it with the model that holds the directive rather than with `new` alone.

## A text block is a literal of its own

JLS 3.10.5 writes a string literal between two quote characters and JLS 3.10.6 writes a text
block between two runs of three; they are different productions, and v4 read both as a
`FASTJavaStringLiteral`. Worse, it stripped one quote from each end whatever it had read, so
a text block's `primitiveValue` came back holding two of its own delimiter quotes at each
end — neither what the source writes nor what the block holds.

`FASTJavaTextBlock` is a subclass of `FASTJavaStringLiteral`, so a text block is still a
string literal to anything that asks, and `primitiveValue` now holds what stands between the
two runs of three quotes: line terminators and indentation included, escapes unread, exactly
as a string literal holds what stands between its two quotes.

| v4.4.0 | v5 |
| --- | --- |
| `aTextBlock primitiveValue` → `""…""` | `aTextBlock primitiveValue` → the content, no quotes |
| nothing distinguished the two | `aLiteral isKindOf: FASTJavaTextBlock` |
| — | `aModel allWithType: FASTJavaTextBlock` |

**This one breaks silently.** `allWithType:` answers a type and not its subclasses, so
`aModel allWithType: FASTJavaStringLiteral` stops answering text blocks and says nothing
about it. Ask for both, or use `isKindOf: FASTJavaStringLiteral`, which still holds for a
text block.

A visitor gains `visitFASTJavaTextBlock:`, which forwards to `visitFASTJavaStringLiteral:`,
so a visitor that overrode only the latter keeps working.

## Renamed relations

Each rename applies to the setter too, and to the `addX:` of a multivalued relation.

| v4.4.0 | v5 |
| --- | --- |
| `FASTJavaCatchPartStatement>>catchedTypes` | `caughtTypes` |
| `FASTJavaCatchPartStatement>>addCatchedType:` | `addCaughtType:` |
| `FASTJavaForEachStatement>>fieldname` | `variable` |
| `FASTTStatement>>forIninitializerOwner` | `forInitializerOwner` |
| `FASTJavaVariableExpression>>javaCatchParameterOwnler` | `javaCatchParameterOwner` |
| `FASTJavaTypeName>>javaTypeNameQualify` | `javaQualifiedTypeNameOwner` |
| `FASTJavaVariableExpression>>javaNewExpressionOwner` | `FASTJavaTypeExpression>>javaNewExpressionTypeOwner` |
| `FASTTExpression>>javaArrayTypeNameOwner` | `FASTJavaTypeExpression>>javaArrayBaseTypeOwner` |

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

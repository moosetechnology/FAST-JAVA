"
I contains the generator to create the Java FAST Metamodel


Use this to re generate the metamodel.

```st
FASTJavaMetamodelGenerator new generate.
FASTJavaMetamodelGenerator resetMetamodel.
```
"
Class {
	#name : #FASTJavaMetamodelGenerator,
	#superclass : #FamixMetamodelGenerator,
	#instVars : [
		'javaBreakStatement',
		'javaCaseStatement',
		'javaCharacterLiteral',
		'javaContinueStatement',
		'javaDoWhileStatement',
		'javaFieldAccess',
		'javaFloatLiteral',
		'javaForStatement',
		'javaIdentifier',
		'javaIfStatement',
		'javaInfixOperation',
		'javaIntegerLiteral',
		'javaMethodEntity',
		'javaMethodInvocation',
		'javaNullLiteral',
		'javaStringLiteral',
		'javaSwitchStatement',
		'javaThis',
		'javaVarDeclStatement',
		'javaVariableDeclarator',
		'javaWhileStatement',
		'javaCastExpression',
		'javaClassProperty',
		'javaForEachStatement',
		'javaUnaryExpression',
		'javaNewExpression',
		'javaNewClassExpression',
		'javaNewArray',
		'javaConditionalExpression',
		'javaArrayAccess',
		'javaInitializer',
		'javaOuterThis',
		'javaThrowStatement',
		'javaLabeledCaseStatement',
		'javaDefaultCaseStatement',
		'javaEmptyMethodDeclaration',
		'javaArrayInitializer',
		'javaClassDeclaration',
		'javaModifier',
		'javaCatchPartStatement',
		'javaLambdaExpression',
		'javaMethodReference',
		'javaSynchronizedStatement',
		'javaTypeName',
		'javaQualifiedTypeName',
		'javaTypeExpression',
		'javaArrayTypeExpression',
		'javaClassTypeExpression',
		'javaPrimitiveTypeExpression',
		'javaBooleanTypeExpression',
		'javaByteTypeExpression',
		'javaCharTypeExpression',
		'javaDoubleTypeExpression',
		'javaFloatTypeExpression',
		'javaIntTypeExpression',
		'javaLongTypeExpression',
		'javaShortTypeExpression',
		'javaVoidTypeExpression',
		'javaParameterExpression',
		'javaAssertStatement',
		'javaAnnotationExpression',
		'javaVariableExpression',
		'javaStatementBlock',
		'javaReturnStatement',
		'javaExpressionStatement',
		'javaStatement',
		'javaBooleanLiteral',
		'tDeclaration',
		'tWithDeclarations',
		'tModifier',
		'tWithModifiers',
		'tWithReceiver',
		'tReceiver',
		'tNamedEntity',
		'tEntity',
		'tExpression',
		'tStatement',
		'tCharacterLiteral',
		'tLiteral',
		'tVariableExpression',
		'tNamedBehaviouralEntity',
		'tNullPointerLiteral',
		'tStringLiteral',
		'tScopableEntity',
		'tVariableEntity',
		'tStatementBlock',
		'tExpressionStatement',
		'tWithParameters',
		'tReturnStatement',
		'tBooleanLiteral',
		'javaEnumDeclaration',
		'javaInterfaceDeclaration',
		'packageDeclaration',
		'importDeclaration',
		'qualifiedName',
		'javaLabeledStatement',
		'javaTypeParameter',
		'javaAssignmentExpression',
		'tAssignable',
		'tWithAssignable',
		'tWithQualifiedName',
		'javaTryCatchStatement',
		'compilationUnit'
	],
	#category : #'FAST-Java-Model-Generator'
}

{ #category : #accessing }
FASTJavaMetamodelGenerator class >> packageName [

	^ #'FAST-Java-Model'
]

{ #category : #accessing }
FASTJavaMetamodelGenerator class >> prefix [
	^ #FASTJava
]

{ #category : #accessing }
FASTJavaMetamodelGenerator class >> submetamodels [
	^ { FASTMetamodelGenerator }
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForAssertStatement [
	^ 'I represent an assert statement

example:

void method (){
	assert condition1 || condition2 : "error message"
}
'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaAnnotation [
	^ 'I reprensent a Java Annotation

example:

@Override'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaArrayAccess [
	^ 'I represent a java array access
	
ex:

liste[i]'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaArrayInitializer [
	^ 'I represent the array initializer and I have many initializers
	
ex:
String patate = {"hello", "world"}


I am : {"hello", "world"} 
My initializers are 
"hello" and "world"
 '
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaAssignmentExpression [
	^ 'An assignment expression mode.

Contains a referances to an assignee assignee and the expression that''s being assigned.'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaBreakStatement [
	^ 'A node representing break statement in java'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaCaseStatement [
	^ 'case part of switch statement'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaCharacterLiteral [
	^ 'A character in Java code'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaClassDeclaration [
	^ 'I represent a class declaration
example

public class ClassName extends SomeClass implements OneClass, TwoClass {

	int oneDeclaration;
	
	void methodDeclaration(){
	}
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaClassProperty [
	^ 'A FASTJavaClassProperty corresponds to the access to a class property
	
	It is not the same as the field access because there are some specific usage of class property to access the current object.
	
ex.

class Enclosing {
    void method(Enclosing other) {
        // ...
    }

    void otherMethod() {
        new Runnable() {
            public void run() {
                method(this);


								--> Does not compile. ''this'' is a Runnable!



                method(Enclosing.this);

								--> Compiles fine.


            }
        }.run();
    }
}
'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaConditionalStatement [
	^ 'I represent a Java conditionnal Statement

ex:

(h.get() == 2) ? thenPart : elsePart'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaContinueStatement [
	^ 'A node representing continue statement in java'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaDefaultCaseStatement [
	^ 'I represent a default case
	
ex.:

default:'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaDoWhileStatement [
	^ 'A node of a do-while statement.

eg.
do {
...
} while(...);'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaEmptyMethodDeclaration [
	^ 'I reprensent an empty method declaration
	
ex.:
void newMethod() {
	new Patate() {
		//The empty method declaration is ";" 
		;
		
	};
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaEnumDeclaration [
	^ 'I represent an enum declaration
example

public enum MyEnum {
	
	HELLO;
	
	int oneDeclaration;
	
	void methodDeclaration(){
	}
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaFieldAccess [
	^ 'A FASTJavaFieldAccess corresponds to an access to an instance variable (field)'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaFloatLiteral [
	^ 'I represent a Float Literal
example:

float f = 12.3;

12.3 is the float literal'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaForEachStatement [
	^ 'A node of a for loop statement.

eg.
for(Patate p : list) {
...
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaForStatement [
	^ 'A node of a for loop statement.

eg.
for(_;_;_) {
...
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaIdentifier [
	^ 'A FASTJavaIdentifier is an identifier in a Java program'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaIfStatement [
	^ 'A node of a if statement or an if-else statement.

eg.
if(...) {
...
} else {
...
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaInfixOperation [
	^ 'Binary java operations in  format: <expr> <operator> <expr>

ex:
	a + b
	3 == 6
	a = 6'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaInitializer [
	^ 'I represent a Java initializer
	
ex.:

new Button(){

{ something }

}
'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaIntegerLiteral [
	^ 'Java integer literal node'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaInterfaceDeclaration [
	^ 'I represent an interface declaration
example

```java
public interface MyInterface {

    public static final String CODE = "SEME";

}
```
'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaLabeledCaseStatement [
	^ 'I represent a Labeled case
	
ex.:

case LABEL:'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaMethodEntity [
	^ 'Represents a method in FastJava'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaMethodInvocation [
	^ 'A node representing method imvocation'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaModifier [
	^ 'I am a Java modifier

example: 
for classes: 

- public
- default
- final
- abstract

for methods:

- public
- private
- default
- protected
- final
- static
- abstract
- transient
- synchronized
- volatile


'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaNewArray [
	^ 'I represent a java new array node.
ex.

new String()["10px", "Hello world"]'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaNewClassExpression [
	^ 'I represent a new class expression (which is most of the time a new anonymous class)
	
	
ex. for SecureAsyncCallback

new SecureAsyncCallback<Void>() {
	@Override
	public void onSuccess(final Void result) {}
	
	@Override
	public void onFailure(final Throwable caught) {
		super.onFailure(caught);
	}
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaNewExpression [
	^ 'I represent the invocation of a Class constructor with the keyword ''new''

ex.

new Patate()'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaNullLiteral [
	^ '''null'' literal in Java'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaOuterThis [
	^ 'I represent a java outer this (only a call to ''this'' to a class
	
ex.:

hello(MyClass.this)'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaQualifiedTypeName [
	^ 'I represent a qualified name for a type

example:

new Canard.Poulet(){

}

"Canard.Poulet" is the qualified name

"Poulet" is the main name

"Canard" is the namespace of the main name 
'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaStringLiteral [
	^ 'A string in Java'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaSwitchStatement [
	^ 'A node representing switch stetement

eg.
switch (_) {
...
}'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaTAssignable [
	^ 'You can assign something to me
example:

this.hello = "hello"'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaTModifier [
	^ 'I am a modifier in java
example:

public, proctected, private'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaThis [
	^ 'A FASTJavaThis corresponds to ''this'' in Java'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaThrowStatement [
	^ 'I represent a java throw statement
	
ex:

throw new Hello();'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaTryCatchStatement [
	^ 'I represent the java try catch statement. I must have two parts: the ''Try'' part and the ''catch'' part. 
	
ex.

void tryCatch() {
	int x;
	try {
		x = 1;
   } catch (Exception e) {
		Patate.displayError(e.getMessage());
	};
}

'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaUnaryExpression [
	^ 'I represent a Java Unary Expression
	
It can be :

++i
i++
--i
i--
!b
+i
-i

see: https://docs.oracle.com/javase/tutorial/java/nutsandbolts/op1.html'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaVarDeclStatement [
	^ 'A statement of variable declaration

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaVariableDeclarator [
	^ 'A part of variable declaration statement containing a variable (named entity) and an expression (optional) that is assigned to it.

Variables declaration statement can contain several declarators.

eg.

int d = 3, e, f = 5;
statement has 3 declarators separated by commas. Second declarator has no expression.'
]

{ #category : #comments }
FASTJavaMetamodelGenerator >> commentForJavaWhileStatement [
	^ 'A node of a while statement.

eg.
while(...) {
...
}'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineClasses [
	super defineClasses.
	javaFieldAccess := builder newClassNamed: #FieldAccess comment: self commentForJavaFieldAccess.
	javaIdentifier := builder newClassNamed: #Identifier comment: self commentForJavaIdentifier.
	javaInfixOperation := builder newClassNamed: #InfixOperation comment: self commentForJavaInfixOperation.
	javaMethodEntity := builder newClassNamed: #MethodEntity comment: self commentForJavaMethodEntity.
	javaMethodInvocation := builder newClassNamed: #MethodInvocation comment: self commentForJavaMethodInvocation.
	javaThis := builder newClassNamed: #This comment: self commentForJavaThis.
	javaOuterThis := builder newClassNamed: #OuterThis comment: self commentForJavaOuterThis.
	javaVariableDeclarator := builder newClassNamed: #VariableDeclarator comment: self commentForJavaVariableDeclarator.
	javaClassProperty := builder newClassNamed: #ClassProperty comment: self commentForJavaClassProperty.
	javaNewArray := builder newClassNamed: #NewArray comment: self commentForJavaNewArray.
	javaArrayAccess := builder newClassNamed: #ArrayAccess comment: self commentForJavaArrayAccess.
	javaInitializer := builder newClassNamed: #Initializer comment: self commentForJavaInitializer.
	javaArrayInitializer :=  builder newClassNamed: #ArrayInitializer comment: self commentForJavaArrayInitializer.
	javaModifier := builder newClassNamed: #Modifier comment: self commentForJavaModifier.	

	javaLambdaExpression := builder newClassNamed: #LambdaExpression comment: 'I represent a lambda expression'.
	javaMethodReference := builder newClassNamed: #MethodReference comment: 'I represent a method reference'.
	javaSynchronizedStatement := builder newClassNamed: #SynchronizedStatement comment: 'I represent a ''synchronized'' statement'.

	"type name"
	javaTypeName := builder newClassNamed: #TypeName comment: 'I represent the name of a type'.
	javaQualifiedTypeName := builder newClassNamed: #QualifiedTypeName comment: self commentForJavaQualifiedTypeName.

	"literals"
	javaCharacterLiteral := builder newClassNamed: #CharacterLiteral comment: self commentForJavaCharacterLiteral.
	javaFloatLiteral := builder newClassNamed: #FloatLiteral comment: self commentForJavaFloatLiteral.
	javaIntegerLiteral := builder newClassNamed: #IntegerLiteral comment: self commentForJavaIntegerLiteral.
	javaNullLiteral := builder newClassNamed: #NullLiteral comment: self commentForJavaNullLiteral.
	javaStringLiteral := builder newClassNamed: #StringLiteral comment: self commentForJavaStringLiteral.
	javaBooleanLiteral := builder newClassNamed: #BooleanLiteral.

	"type expressions"
	javaTypeExpression := builder newClassNamed: #TypeExpression comment: 'I represent a type'.
	javaArrayTypeExpression := builder newClassNamed: #ArrayTypeExpression comment: 'I represent an array type'.
	javaClassTypeExpression := builder newClassNamed: #ClassTypeExpression comment: 'I represent a class type'.
	javaPrimitiveTypeExpression := builder newClassNamed: #PrimitiveTypeExpression comment: 'I represent a primitive type'.
	javaTypeParameter := builder newClassNamed: #TypeParameterExpression comment: 'I represent JavaTypeParameter such as `void <T extends Hello> T myMethod()`'.

	"primitive type expressions"
	javaBooleanTypeExpression := builder newClassNamed: #BooleanTypeExpression comment: 'I represent a boolean type'.
	javaByteTypeExpression := builder newClassNamed: #ByteTypeExpression comment: 'I represent a byte type'.
	javaCharTypeExpression := builder newClassNamed: #CharTypeExpression comment: 'I represent a char type'.
	javaDoubleTypeExpression := builder newClassNamed: #DoubleTypeExpression comment: 'I represent a double type'.
	javaFloatTypeExpression := builder newClassNamed: #FloatTypeExpression comment: 'I represent a float type'.
	javaIntTypeExpression := builder newClassNamed: #IntTypeExpression comment: 'I represent an int type'.
	javaLongTypeExpression := builder newClassNamed: #LongTypeExpression comment: 'I represent a long type'.
	javaShortTypeExpression := builder newClassNamed: #ShortTypeExpression comment: 'I represent a short type'.
	javaVoidTypeExpression := builder newClassNamed: #VoidTypeExpression comment: 'I represent a short type'.

	"expressions"
	javaUnaryExpression := builder newClassNamed: #UnaryExpression comment: self commentForJavaUnaryExpression.
	javaNewExpression := builder newClassNamed: #NewExpression comment: self commentForJavaNewExpression.
	javaNewClassExpression := builder newClassNamed: #NewClassExpression comment: self commentForJavaNewClassExpression.
	javaAssignmentExpression := builder newClassNamed: #AssignmentExpression comment: self commentForJavaAssignmentExpression.
	javaCastExpression := builder newClassNamed: #CastExpression comment: 'I represent a cast expression, e.g. `(int) 0.5`'.
	javaParameterExpression := builder newClassNamed: #Parameter comment: 'I represent a parameter of a method declaration'.
	javaConditionalExpression := builder newClassNamed: #ConditionalExpression comment: self commentForJavaConditionalStatement.
	javaAnnotationExpression := builder newClassNamed: #Annotation comment: self commentForJavaAnnotation.
	javaVariableExpression := builder newClassNamed: #VariableExpression.

	"statements"
	javaStatement := builder newClassNamed: #Statement.
	javaIfStatement := builder newClassNamed: #IfStatement comment: self commentForJavaIfStatement.
	javaForStatement := builder newClassNamed: #ForStatement comment: self commentForJavaForStatement.
	javaBreakStatement := builder newClassNamed: #BreakStatement comment: self commentForJavaBreakStatement.
	javaSwitchStatement := builder newClassNamed: #SwitchStatement comment: self commentForJavaSwitchStatement.
	javaCaseStatement := builder newClassNamed: #CaseStatement comment: self commentForJavaCaseStatement.
	javaContinueStatement := builder newClassNamed: #ContinueStatement comment: self commentForJavaContinueStatement.
	javaWhileStatement := builder newClassNamed: #WhileStatement comment: self commentForJavaWhileStatement.
	javaDoWhileStatement := builder newClassNamed: #DoWhileStatement comment: self commentForJavaDoWhileStatement.
	javaThrowStatement := builder newClassNamed: #ThrowStatement comment: self commentForJavaThrowStatement.
	javaTryCatchStatement := builder newClassNamed: #TryCatchStatement comment: self commentForJavaTryCatchStatement.
	javaCatchPartStatement := builder newClassNamed: #CatchPartStatement comment: 'I represent the ''catch'' part of the TryCatch Statement'.
	javaForEachStatement := builder newClassNamed: #ForEachStatement comment: self commentForJavaForEachStatement.
	javaLabeledCaseStatement := builder newClassNamed: #LabeledCaseStatement comment: self commentForJavaLabeledCaseStatement.
	javaDefaultCaseStatement := builder newClassNamed: #DefaultCaseStatement comment: self commentForJavaDefaultCaseStatement.
	javaVarDeclStatement := builder newClassNamed: #VarDeclStatement comment: self commentForJavaVarDeclStatement.
	javaAssertStatement := builder newClassNamed: #AssertStatement comment: self commentForAssertStatement. 
	javaStatementBlock := builder newClassNamed: #StatementBlock.
	javaReturnStatement := builder newClassNamed: #ReturnStatement.
	javaExpressionStatement := builder newClassNamed: #ExpressionStatement.
	javaLabeledStatement := builder newClassNamed: #LabeledStatement.
	
	"declarations"
	javaClassDeclaration := builder newClassNamed: #ClassDeclaration comment: self commentForJavaClassDeclaration.
	javaEnumDeclaration := builder newClassNamed: #EnumDeclaration comment: self commentForJavaEnumDeclaration.
	javaInterfaceDeclaration := builder newClassNamed: #InterfaceDeclaration comment: self commentForJavaInterfaceDeclaration.
	javaEmptyMethodDeclaration := builder newClassNamed: #EmptyMethodDeclaration comment: self commentForJavaEmptyMethodDeclaration.
	compilationUnit := builder newClassNamed: #CompilationUnit comment: 'I represent a compilation unit, I can contain declarations for a package, imports, and types'.
	packageDeclaration := builder newClassNamed: #PackageDeclaration comment: 'I represent a package declaration, e.g. `package fr.inria;`'.
	importDeclaration := builder newClassNamed: #ImportDeclaration comment: 'I represent an import declaration, e.g. `import java.util.List;`'.
	qualifiedName := builder newClassNamed: #QualifiedName.
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineHierarchy [

	"define class hierarchy"

	super defineHierarchy.

	javaAssignmentExpression --|> tExpression.
	javaAssignmentExpression --|> tWithAssignable.

	javaFieldAccess --|> tExpression.
	javaFieldAccess --|> tAssignable.
	javaFieldAccess --|> tWithReceiver.
	javaFieldAccess --|> tReceiver.

	javaInfixOperation --|> tExpression.
	javaInfixOperation --|> tReceiver.

	javaBreakStatement --|> tStatement.
	javaCaseStatement --|> tStatementBlock.
	javaCharacterLiteral --|> tCharacterLiteral.
	javaCharacterLiteral --|> tReceiver.
	javaContinueStatement --|> tStatement.
	javaDoWhileStatement --|> tStatement.
	javaFloatLiteral --|> tLiteral.
	javaFloatLiteral --|> tReceiver.
	javaForStatement --|> tStatement.

	javaIdentifier --|> javaVariableExpression.
	javaIdentifier --|> tReceiver.

	javaIfStatement --|> tStatement.
	javaIntegerLiteral --|> tLiteral.
	javaIntegerLiteral --|> tReceiver.

	javaMethodEntity --|> tNamedBehaviouralEntity.
	javaMethodEntity --|> #THasImmediateSource.
	javaMethodEntity --|> tDeclaration.
	javaMethodEntity --|> tWithModifiers.

	javaClassDeclaration --|> tStatement.
	javaClassDeclaration --|> tDeclaration.
	javaClassDeclaration --|> tWithDeclarations.
	javaClassDeclaration --|> tWithModifiers.
	javaClassDeclaration --|> tNamedEntity.
	javaClassDeclaration --|> #THasImmediateSource.
	javaClassDeclaration withPrecedenceOf: #THasImmediateSource.

	javaEnumDeclaration --|> tStatement.
	javaEnumDeclaration --|> tDeclaration.
	javaEnumDeclaration --|> tWithDeclarations.
	javaEnumDeclaration --|> tWithModifiers.
	javaEnumDeclaration --|> tNamedEntity.

	javaInterfaceDeclaration --|> tStatement.
	javaInterfaceDeclaration --|> tDeclaration.
	javaInterfaceDeclaration --|> tWithDeclarations.
	javaInterfaceDeclaration --|> tWithModifiers.
	javaInterfaceDeclaration --|> tNamedEntity.
	javaInterfaceDeclaration --|> #THasImmediateSource.
	javaInterfaceDeclaration withPrecedenceOf: #THasImmediateSource.

	javaMethodInvocation --|> tExpression.
	javaMethodInvocation --|> #TWithArguments.
	javaMethodInvocation --|> tWithReceiver.
	javaMethodInvocation --|> tReceiver.


	javaNullLiteral --|> tNullPointerLiteral.

	javaStringLiteral --|> tStringLiteral.
	javaStringLiteral --|> tReceiver.

	javaSwitchStatement --|> tStatement.
	javaThis --|> javaVariableExpression.

	javaVarDeclStatement --|> tStatement.
	javaVarDeclStatement --|> tDeclaration.
	javaVarDeclStatement --|> tScopableEntity.
	javaVarDeclStatement --|> tWithModifiers.

	javaVariableDeclarator --|> tEntity.
	javaWhileStatement --|> tStatement.
	javaMethodInvocation --|> tNamedEntity.
	javaCastExpression --|> tExpression.
	javaCastExpression --|> tReceiver.

	javaClassProperty --|> javaVariableExpression.
	javaClassProperty --|> tReceiver.

	javaTryCatchStatement --|> tStatement.
	javaForEachStatement --|> tStatement.
	javaUnaryExpression --|> tExpression.

	javaNewExpression --|> tExpression.
	javaNewExpression --|> #TWithArguments.
	javaNewExpression --|> tReceiver.
	javaNewExpression --|> tWithReceiver.

	javaNewClassExpression --|> javaNewExpression.
	javaNewClassExpression --|> tWithDeclarations.
	javaNewClassExpression --|> #TWithArguments.

	javaNewArray --|> javaNewExpression.
	javaConditionalExpression --|> tExpression.

	javaArrayAccess --|> tExpression.
	javaArrayAccess --|> tAssignable.
	javaArrayAccess --|> tReceiver.

	javaVariableExpression --|> tVariableExpression.
	javaVariableExpression --|> tAssignable.
	javaVariableExpression --|> tReceiver.

	javaThrowStatement --|> tStatement.
	javaLabeledCaseStatement --|> javaCaseStatement.
	javaDefaultCaseStatement --|> javaCaseStatement.
	javaEmptyMethodDeclaration --|> javaMethodEntity.
	javaArrayInitializer --|> tExpression.

	javaInitializer --|> tScopableEntity.
	javaInitializer --|> #THasImmediateSource.
	javaInitializer --|> tDeclaration.

	javaOuterThis --|> tExpression.
	javaOuterThis --|> tReceiver.

	javaCatchPartStatement --|> tStatement.

	javaLambdaExpression --|> tExpression.
	javaLambdaExpression --|> tWithParameters.

	javaMethodReference --|> tExpression.
	javaMethodReference --|> tNamedEntity.

	javaSynchronizedStatement --|> tStatement.

	"types name"
	javaTypeName --|> tNamedEntity.
	javaTypeName --|> tExpression.
	javaQualifiedTypeName --|> javaTypeName.

	"types"
	javaTypeExpression --|> javaVariableExpression.
	javaArrayTypeExpression --|> javaTypeExpression.
	javaClassTypeExpression --|> javaTypeExpression.
	javaPrimitiveTypeExpression --|> javaTypeExpression.
	javaBooleanTypeExpression --|> javaPrimitiveTypeExpression.
	javaByteTypeExpression --|> javaPrimitiveTypeExpression.
	javaCharTypeExpression --|> javaPrimitiveTypeExpression.
	javaDoubleTypeExpression --|> javaPrimitiveTypeExpression.
	javaFloatTypeExpression --|> javaPrimitiveTypeExpression.
	javaIntTypeExpression --|> javaPrimitiveTypeExpression.
	javaLongTypeExpression --|> javaPrimitiveTypeExpression.
	javaShortTypeExpression --|> javaPrimitiveTypeExpression.
	javaVoidTypeExpression --|> javaPrimitiveTypeExpression.

	javaTypeParameter --|> tExpression.
	javaTypeParameter --|> tNamedEntity.

	javaBooleanLiteral --|> tLiteral.
	javaBooleanLiteral --|> tReceiver.

	javaModifier --|> tModifier.
	javaModifier --|> tExpression.

	javaAnnotationExpression --|> tExpression.
	javaAnnotationExpression --|> tModifier.
	javaParameterExpression --|> tExpression.
	javaParameterExpression --|> tVariableEntity.
	javaConditionalExpression --|> tReceiver.

	javaStatement --|> tStatement.
	javaStatementBlock --|> tStatementBlock.
	javaReturnStatement --|> tReturnStatement.
	javaAssertStatement --|> tStatement.
	javaExpressionStatement --|> tExpressionStatement.
	javaLabeledStatement --|> tStatement.

	qualifiedName --|> tNamedEntity.
	qualifiedName --|> tEntity.
	qualifiedName --|> tAssignable.

	compilationUnit --|> tEntity.

	"package and import do not use TDeclaration on purpose: they are only contained in a compilation unit"
	packageDeclaration --|> tEntity.
	packageDeclaration --|> tWithQualifiedName.

	importDeclaration --|> tEntity.
	importDeclaration --|> tWithQualifiedName
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineProperties [

	super defineProperties.
	(javaFieldAccess property: #fieldName type: #String) comment:
		'Name of accessed field'.
	(javaInfixOperation property: #operator type: #String) comment:
		'operator s symbol'.
	(javaClassProperty property: #fieldName type: #String) comment:
		'Name of accessed field'.

	(javaUnaryExpression property: #operator type: #String) comment:
		'The operator string to apply to the expression'.
	(javaUnaryExpression
		 property: #isPrefixedUnaryExpression
		 type: #Boolean) comment:
		'True if the expression is prefixed (ex. ++i) else false'.

	(javaModifier property: #token type: #String) comment:
		'The modifier value'.

	(javaLabeledStatement property: #label type: #String) comment:
		'The label of the labeled statement'.

	(importDeclaration
		 property: #isStatic
		 type: #Boolean
		 defaultValue: false) comment: 'True if importing static members'.
	(importDeclaration
		 property: #isOnDemand
		 type: #Boolean
		 defaultValue: false) comment:
		'Whether this import is on-demand (wildcard) or single-type'
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineRelations [

	super defineRelations.
	((javaArrayInitializer property: #initializers) comment:
		 'My initializers')
	<>-* ((tExpression property: #javaArrayInitializers) comment:
			 'The owner of the expression').

	((javaVarDeclStatement property: #declarators) comment:
		 'The declarators for the type')
	<>-* ((javaVariableDeclarator property: #varDeclOwner) comment:
			 'The owner of the declarator').

	((javaSwitchStatement property: #cases) comment:
		 'The cases of the switch statement')
	<>-*
		((javaCaseStatement property: #javaCaseStatementSwitchOwner) 
			 comment: 'The switch owner').

	((javaVariableDeclarator property: #expression) comment:
		 'Expression to be assigned to the var during declaration')
	<>- ((tExpression property: #javaVariableDeclaratorExpressionOwner) 
			 comment: 'The javaVariableDeclarator owner (if possible)').
	((javaVariableDeclarator property: #variable) comment:
		 'The variable that is being declared')
	<>-
		((javaVariableExpression property: #javaVariableDeclaratorOwner) 
			 comment: 'The javaVariableDeclarator owner (if possible)').

	((javaAssignmentExpression property: #expression) comment:
		 'Expression to be assigned to the var during declaration')
	<>- ((tExpression property: #javaAssignmentExpressionOwner) comment:
			 'The javaAssignmentExpression owner (if possible)').

	((javaCastExpression property: #expression) comment:
		 'The expression to cast')
	<>- ((tExpression property: #javaCastExpressionOwner) comment:
			 'The javaCastExpression owner (if possible)').
	((javaCastExpression property: #type) comment:
		 'The type into which the expression will be cast')
	<>-
		((javaVariableExpression property: #javaCastExpressionTypeOwner) 
			 comment: 'The javaCastExpression owner (if possible)').

	((javaClassProperty property: #type) comment:
		 'The type of the property')
	<>-
		((javaVariableExpression property: #javaClassPropertyOwner) 
			 comment: 'The javaClassProperty owner (if possible)').

	((javaUnaryExpression property: #expression) comment:
		 'The affected expression')
	<>- ((tExpression property: #javaUnaryExpressionOwner) comment:
			 'The javaUnaryExpression owner (if possible)').

	((javaNewExpression property: #type) comment: 'The type of the array')
	<>-
		((javaVariableExpression property: #javaNewExpressionOwner) 
			 comment: 'The javaNewExpression owner (if possible)').

	((javaArrayAccess property: #expression) comment:
		 'The accessed index')
	<>- ((tExpression property: #javaArrayAccessOwner) comment:
			 'The javaArrayAccess owner (if possible)').
	((javaArrayAccess property: #array) comment: 'Name of accessed field')
	<>- ((tExpression property: #javaArrayArrayAccessOwner) comment:
			 'The javaArrayArrayAccess owner (if possible)').

	((javaOuterThis property: #type) comment: 'The accessed type')
	<>- ((javaVariableExpression property: #javaOuterThisOwner) comment:
			 'The javaOuterThis owner (if possible)').

	((javaThrowStatement property: #expression) comment:
		 'The thrown element')
	<>- ((tExpression property: #javaThrowStatementOwner) comment:
			 'The javaThrowStatement owner (if possible)').

	((javaLabeledCaseStatement property: #label) comment:
		 'The label of the case statement')
	<>- ((tExpression property: #javaLabeledCaseStatementOwner) comment:
			 'The javaLabeledCaseStatement owner (if possible)').

	((javaForEachStatement property: #body) comment:
		 'The body of the for-each statement')
	<>- ((tStatement property: #javaForEachStatementOwner) comment:
			 'The javaForEachStatement owner (if possible)').
	((javaForEachStatement property: #list) comment:
		 'The list that the for-each statement iterates over')
	<>- ((tExpression property: #javaForEachStatementOwner) comment:
			 'The javaForEachStatement owner (if possible)').
	((javaForEachStatement property: #fieldname) comment:
		 'The identifier of the created local variable')
	<>- ((javaIdentifier property: #javaForEachStatementFieldNameOwner) 
			 comment: 'The javaForEachStatement owner (if possible)').
	((javaForEachStatement property: #type) comment:
		 'The type of the created local variable')
	<>- ((javaTypeExpression property: #javaForEachStatementTypeOwner) 
			 comment: 'The javaForEachStatement owner (if possible)').

	((javaCatchPartStatement property: #body) comment:
		 'The body of the catch part')
	<>- ((tStatement property: #javaCatchPartStatementOwner) comment:
			 'The javaCatchPartStatementOwner owner (if possible)').
	((javaCatchPartStatement property: #parameter) comment:
		 'The parameter of the catch part')
	<>- ((javaVariableExpression property: #javaCatchParameterOwnler) 
			 comment: 'The javaCatchPartParameterOwner owner (if possible)').

	((javaTryCatchStatement property: #try) comment:
		 'I represent the ''try'' part of the TryCatch Statement')
	<>- ((tStatement property: #javaTryCatchOwner) comment:
			 'The javaTryCatch owner (if possible)').
	((javaTryCatchStatement property: #catches) comment:
		 'I contain all the catch statements')
	<>-* ((javaCatchPartStatement property: #tryOwner) comment:
			 'The try part that owns me').

	((javaIfStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #ifConditionOwner) comment:
			 'I represent a condition for my owner').
	((javaIfStatement property: #elsePart) comment: 'else part')
	<>- ((tStatement property: #ifElsePartOwner) comment:
			 'The if owner (if possible)').
	((javaIfStatement property: #thenPart) comment: 'then part')
	<>- ((tStatement property: #ifThenPartOwner) comment:
			 'The if owner (if possible)').

	((javaConditionalExpression property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #conditionalConditionOwner) comment:
			 'I reprensent a condition for my owner').
	((javaConditionalExpression property: #elsePart) comment: 'else part')
	<>- ((tExpression property: #conditionalElsePartOwner) comment:
			 'The if owner (if possible)').
	((javaConditionalExpression property: #thenPart) comment: 'then part')
	<>- ((tExpression property: #conditionalThenPartOwner) comment:
			 'The if owner (if possible)').

	((javaInfixOperation property: #leftOperand) comment: 'leftOperand')
	<>-
		((tExpression property: #infixOperationLeftOperandOwner) comment:
			 'The left operand (if possible)').
	((javaInfixOperation property: #rightOperand) comment: 'rightOperand')
	<>-
		((tExpression property: #infixOperationRightOperandOwner) comment:
			 'The right operand (if possible)').

	((javaForStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #forConditionOwner) comment:
			 'I reprensent a condition for my owner').
	((javaForStatement property: #incrementor) comment:
		 'Expression evaluated at the end of each loop')
	<>- ((tStatement property: #forIncrementorOwner) comment:
			 'I am the incrementor of the for').
	((javaForStatement property: #initializer) comment:
		 'Expression used at initialization phase of a for loop')
	<>- ((tStatement property: #forIninitializerOwner) comment:
			 'I am the initializer of the for').
	((javaForStatement property: #body) comment:
		 'A statement to be evaluated in the loop')
	<>- ((tStatement property: #forBodyOwner) comment:
			 'I am the body of the for').

	((javaSwitchStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #switchConditionOwner) comment:
			 'I reprensent a condition for my owner').

	((javaDoWhileStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #doConditionOwner) comment:
			 'I reprensent a condition for my owner').
	((javaDoWhileStatement property: #body) comment:
		 'A statement to be evaluated in the loop')
	<>- ((tStatement property: #doBodyOwner) comment:
			 'I am the body of the do').

	((javaWhileStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #whileConditionOwner) comment:
			 'I reprensent a condition for my owner').
	((javaWhileStatement property: #body) comment:
		 'A statement to be evaluated in the loop')
	<>- ((tStatement property: #whileBodyOwner) comment:
			 'I am the body of the do').

	((javaInitializer property: #statementBlock) comment:
		 'Statements block of the behavioural entity')
	<>- ((tStatementBlock property: #javaInitializerOwner) comment:
			 'Behavioural entity containing the statement block').

	((javaLabeledStatement property: #statementBlock) comment:
		 'Statements block of the behavioural entity')
	<>- ((tStatementBlock property: #javaLabaledStatementOwner) comment:
			 'Label Statement entity containing the statement block').

	((javaNewArray property: #initializer) comment:
		 'The initializer of the array')
	<>- ((tExpression property: #javaNewArrayInitialOwner) comment:
			 'I belong to a new array initialization').

	((javaLambdaExpression property: #expression) comment:
		 'Expression to be executed as part of the lambda.')
	<>- ((tEntity property: #javaLambdaExpressionOwner) comment:
			 'The expression owner (if possible)').

	((javaMethodReference property: #receiver) comment:
		 'The method of the reference')
	<>- ((javaVariableExpression property: #javaMethodReferenceOwner) 
			 comment: 'The owner of the method reference (if possible)').

	((javaSynchronizedStatement property: #expression) comment:
		 'The instance on which the statement block is synchronized')
	<>-
		((tExpression property: #javaSynchronizedStatementOwner) comment:
			 'The owner of the synchronized block (if possible)').
	((javaSynchronizedStatement property: #block) comment:
		 'The block that is synchronized')
	<>-
		((tStatementBlock property: #javaSynchronizedStatementOwner) 
			 comment: 'The owner of the synchronized block (if possible)').

	((javaMethodEntity property: #type) comment: 'The type of the method')
	<>-
		((javaVariableExpression property: #javaMethodTypeOwner) comment:
			 'The variable expression owner (if possible)').
	((javaMethodEntity property: #throws) comment:
		 'The list of throws exception')
	<>-*
		((javaClassTypeExpression property: #javaMethodThrowsOwner) 
			 comment: 'The method that throws me').
	((javaMethodEntity property: #typeParameters) comment:
		 'The list of type parameter')
	<>-*
		((javaTypeParameter property: #javaMethodTypeParameterOwner) 
			 comment: 'The method that use me').

	((javaTypeParameter property: #types) comment:
		 'The list of types I extend or implements')
	<>-*
		((javaClassTypeExpression property: #typeParameterOwner) comment:
			 'The type parameter I specify').

	((javaParameterExpression property: #type) comment:
		 'The type of the parameter')
	<>-
		((javaVariableExpression property: #javaParameterTypeOwner) 
			 comment: 'The variable expression owner (if possible)').
	((javaParameterExpression property: #variable) comment:
		 'parameter variable')
	<>- ((javaVariableExpression property: #javaParameterVariableOwner) 
			 comment: 'The variable expression owner (if possible)').

	((javaVarDeclStatement property: #type) comment:
		 'The type of the declared variables')
	<>-
		((javaVariableExpression property: #javaVarDeclTypeOwner) comment:
			 'The variable expression owner (if possible)').

	((javaArrayTypeExpression property: #baseType) comment:
		 'The type of the array')
	<>- ((tExpression property: #javaArrayTypeNameOwner) comment:
			 'The variable expression owner (if possible)').

	((javaClassTypeExpression property: #typeName) comment:
		 'The name of the type')
	<>-
		((javaTypeName property: #javaTypeNameTypeExpressionOwner) comment:
			 'The type expression that owns me').

	((javaQualifiedTypeName property: #namespace) comment:
		 'The namespace of the name')
	<>- ((javaTypeName property: #javaTypeNameQualify) comment:
			 'the name I qualify').

	((javaAssertStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #assertConditionOwner) comment:
			 'I reprensent a condition for my owner').
	((javaAssertStatement property: #message) comment:
		 'The error message that is raised if the condition is false')
	<>- ((javaStringLiteral property: #javaStringAssertStatementOwner) 
			 comment: 'The assertion that can raise me').

	((javaClassDeclaration property: #superclass) comment:
		 'My superclass')
	<>-
		((javaTypeExpression property: #javaClassDeclarationSuperclassOwner) 
			 comment: 'The class that extends me').
	((javaClassDeclaration property: #interfaces) comment:
		 'The interfaces I implement')
	<>-*
		((javaTypeExpression property: #javaClassDeclarationInterfaceOwner) 
			 comment: 'The class that implements me').

	((javaEnumDeclaration property: #interfaces) comment:
		 'The interfaces I implement')
	<>-*
		((javaTypeExpression property: #javaEnumDeclarationInterfaceOwner) 
			 comment: 'The enum that implements me').

	((javaInterfaceDeclaration property: #interfaces) comment:
		 'My super interfaces')
	<>-*
		((javaTypeExpression property:
			  #javaInterfaceDeclarationInterfaceOwner) comment:
			 'The interface that extends me').

	((tWithDeclarations property: #declarations) comment:
		 'The elements I declare')
	<>-* ((tDeclaration property: #javaDeclarationOwner) comment:
			 'The element that declares me').

	((tWithModifiers property: #modifiers) comment: 'My modifiers')
	<>-* ((tModifier property: #javaModifierOwner) comment:
			 'The owner of the modifier').

	((javaAnnotationExpression property: #expression) comment:
		 'My expression (because annotation can be complex)')
	<>- ((javaVariableExpression property: #annotationExpressionOwner) 
			 comment: 'The annotation that owns me').

	((tWithAssignable property: #variable) comment: 'My variable')
	<>- ((tAssignable property: #javaVariableAssignmentOwner) comment:
			 'The owner of the assignment').

	((tWithReceiver property: #receiver) comment: 'My receiver')
	<>- ((tReceiver property: #receiverOwner) comment:
			 'The owner of the receiver').

	((qualifiedName property: #namespace) comment:
		 'The namespace that qualifies me')
	<>- ((qualifiedName property: #namespaceOwner) comment:
			 'The namespace I qualify').

	((tWithQualifiedName property: #qualifiedName) comment:
		 'The name that qualifies me')
	<>- ((qualifiedName property: #qualifiedNameOwner) comment:
			 'The owner of the qualified name').

	"do not use TDeclaration and TWithDeclaration on purpose: what a compilation unit can contain is strict"
	((compilationUnit property: #packageDeclaration) comment:
		 'My package declaration, or nil for the default package')
	<>- ((packageDeclaration property: #compilationUnit) comment:
			 'The compilation unit that owns me').
	((compilationUnit property: #importDeclarations) comment:
		 'My import declarations')
	<>-* ((importDeclaration property: #compilationUnit) comment:
			 'The compilation unit that owns me').
	((compilationUnit property: #classDeclarations) comment:
		 'My class declarations')
	<>-* ((javaClassDeclaration property: #compilationUnit) comment:
			 'The compilation unit that owns me').
	((compilationUnit property: #interfaceDeclarations) comment:
		 'My interface declarations')
	<>-* ((javaInterfaceDeclaration property: #compilationUnit) comment:
			 'The compilation unit that owns me').
	((compilationUnit property: #enumDeclarations) comment:
		 'My enum declaration')
	<>-* ((javaEnumDeclaration property: #compilationUnit) comment:
			 'The compilation unit that owns me')
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineTraits [
	super defineTraits. 
	tDeclaration := builder newTraitNamed: #TDeclaration comment: 'I am a declaration in java'.
	tWithDeclarations := builder newTraitNamed: #TWithDeclarations comment: 'I have declarations'.
	
	tModifier := builder newTraitNamed: #TModifier comment: self commentForJavaTModifier. 
	tWithModifiers := builder newTraitNamed: #TWithModifiers comment: 'I have modifiers'.
	
	tAssignable := builder newTraitNamed: #TAssignable comment: self commentForJavaTAssignable. 
	tWithAssignable := builder newTraitNamed: #TWithAssignable comment: 'I have an assignable'.
	
	tReceiver := builder newTraitNamed: #TReceiver comment: 'I receive a message from someone'.
	tWithReceiver := builder newTraitNamed: #TWithReceiver comment: 'I can send a message to someone'.
	
	tWithQualifiedName := builder newTraitNamed: #TWithQualifiedName comment: 'I have a qualified name.'.
	
	"From FAST"
	tEntity := self remoteTrait: #TEntity withPrefix: #FAST. 
	tExpression := self remoteTrait: #TExpression withPrefix: #FAST. 
	tStatement := self remoteTrait: #TStatement withPrefix: #FAST.
	tCharacterLiteral := self remoteTrait: #TCharacterLiteral withPrefix: #FAST.
	tLiteral := self remoteTrait: #TLiteral withPrefix: #FAST.
	tVariableExpression := self remoteTrait: #TVariableExpression withPrefix: #FAST.
	tNamedBehaviouralEntity := self remoteTrait: #TNamedBehaviouralEntity withPrefix: #FAST.
	tNullPointerLiteral := self remoteTrait: #TNullPointerLiteral withPrefix: #FAST.
	tStringLiteral := self remoteTrait: #TStringLiteral withPrefix: #FAST.
	tScopableEntity := self remoteTrait: #TScopableEntity withPrefix: #FAST.
	tVariableEntity := self remoteTrait: #TVariableEntity withPrefix: #FAST.
	tStatementBlock := self remoteTrait: #TStatementBlock withPrefix: #FAST.
	tExpressionStatement := self remoteTrait: #TExpressionStatement withPrefix: #FAST.
	tWithParameters := self remoteTrait: #TWithParameters withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tReturnStatement := self remoteTrait: #TReturnStatement withPrefix: #FAST.
	tBooleanLiteral := self remoteTrait: #TBooleanLiteral withPrefix: #FAST.
]

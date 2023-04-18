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
		'javaTryCatch',
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
		'fileDeclaration',
		'packageDeclaration',
		'importDeclaration',
		'multiImportDeclaration',
		'qualifiedName',
		'javaLabeledStatement',
		'javaTypeParameter',
		'javaAssignmentExpression',
		'tAssignable',
		'tWithAssignable'
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
FASTJavaMetamodelGenerator >> commentForJavaTryCatch [
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
	javaAssignmentExpression := builder newClassNamed: #AssignmentExpression comment: self commentForJavaAssignmentExpression.
	javaBreakStatement := builder newClassNamed: #BreakStatement comment: self commentForJavaBreakStatement.
	javaCaseStatement := builder newClassNamed: #CaseStatement comment: self commentForJavaCaseStatement.
	javaCharacterLiteral := builder newClassNamed: #CharacterLiteral comment: self commentForJavaCharacterLiteral.
	javaContinueStatement := builder newClassNamed: #ContinueStatement comment: self commentForJavaContinueStatement.
	javaDoWhileStatement := builder newClassNamed: #DoWhileStatement comment: self commentForJavaDoWhileStatement.
	javaFieldAccess := builder newClassNamed: #FieldAccess comment: self commentForJavaFieldAccess.
	javaFloatLiteral := builder newClassNamed: #FloatLiteral comment: self commentForJavaFloatLiteral.
	javaForStatement := builder newClassNamed: #ForStatement comment: self commentForJavaForStatement.
	javaIdentifier := builder newClassNamed: #Identifier comment: self commentForJavaIdentifier.
	javaIfStatement := builder newClassNamed: #IfStatement comment: self commentForJavaIfStatement.
	javaInfixOperation := builder newClassNamed: #InfixOperation comment: self commentForJavaInfixOperation.
	javaIntegerLiteral := builder newClassNamed: #IntegerLiteral comment: self commentForJavaIntegerLiteral.
	javaMethodEntity := builder newClassNamed: #MethodEntity comment: self commentForJavaMethodEntity.
	javaMethodInvocation := builder newClassNamed: #MethodInvocation comment: self commentForJavaMethodInvocation.
	javaNullLiteral := builder newClassNamed: #NullLiteral comment: self commentForJavaNullLiteral.
	javaStringLiteral := builder newClassNamed: #StringLiteral comment: self commentForJavaStringLiteral.
	javaSwitchStatement := builder newClassNamed: #SwitchStatement comment: self commentForJavaSwitchStatement.
	javaThis := builder newClassNamed: #This comment: self commentForJavaThis.
	javaVarDeclStatement := builder newClassNamed: #VarDeclStatement comment: self commentForJavaVarDeclStatement.
	javaVariableDeclarator := builder newClassNamed: #VariableDeclarator comment: self commentForJavaVariableDeclarator.
	javaWhileStatement := builder newClassNamed: #WhileStatement comment: self commentForJavaWhileStatement.
	javaCastExpression := builder newClassNamed: #CastExpression comment: 'todo'.
	javaClassProperty := builder newClassNamed: #ClassProperty comment: self commentForJavaClassProperty.
	javaTryCatch := builder newClassNamed: #TryCatchStatement comment: self commentForJavaTryCatch.
	javaForEachStatement := builder newClassNamed: #ForEachStatement comment: self commentForJavaForEachStatement.
	javaUnaryExpression := builder newClassNamed: #UnaryExpression comment: self commentForJavaUnaryExpression.
	javaNewExpression := builder newClassNamed: #NewExpression comment: self commentForJavaNewExpression.
	javaNewClassExpression := builder newClassNamed: #NewClassExpression comment: self commentForJavaNewClassExpression.
	javaNewArray := builder newClassNamed: #NewArray comment: self commentForJavaNewArray.
	javaConditionalExpression := builder newClassNamed: #ConditionalExpression comment: self commentForJavaConditionalStatement.
	javaArrayAccess := builder newClassNamed: #ArrayAccess comment: self commentForJavaArrayAccess.
	javaInitializer := builder newClassNamed: #Initializer comment: self commentForJavaInitializer.
	javaOuterThis := builder newClassNamed: #OuterThis comment: self commentForJavaOuterThis.
	javaThrowStatement := builder newClassNamed: #ThrowStatement comment: self commentForJavaThrowStatement.
	javaLabeledCaseStatement := builder newClassNamed: #LabeledCaseStatement comment: self commentForJavaLabeledCaseStatement.
	javaDefaultCaseStatement := builder newClassNamed: #DefaultCaseStatement comment: self commentForJavaDefaultCaseStatement.
	javaEmptyMethodDeclaration := builder newClassNamed: #EmptyMethodDeclaration comment: self commentForJavaEmptyMethodDeclaration.
	javaArrayInitializer :=  builder newClassNamed: #ArrayInitializer comment: self commentForJavaArrayInitializer.
	javaClassDeclaration := builder newClassNamed: #ClassDeclaration comment: self commentForJavaClassDeclaration.
	javaEnumDeclaration := builder newClassNamed: #EnumDeclaration comment: self commentForJavaEnumDeclaration.
	javaInterfaceDeclaration := builder newClassNamed: #InterfaceDeclaration comment: self commentForJavaInterfaceDeclaration.
		
	javaModifier := builder newClassNamed: #Modifier comment: self commentForJavaModifier.	
	
	javaCatchPartStatement := builder newClassNamed: #CatchPartStatement comment: 'I represent the ''catch'' part of the TryCatch Statement'.
	javaLambdaExpression := builder newClassNamed: #LambdaExpression comment: 'I represent a lambda expression'.
	javaMethodReference := builder newClassNamed: #MethodReference comment: 'I represent a method reference'.
	javaSynchronizedStatement := builder newClassNamed: #SynchronizedStatement comment: 'I represent a ''synchronized'' statement'.

	"The type name"
	javaTypeName := builder newClassNamed: #TypeName comment: 'I represent the name of a type'.
	javaQualifiedTypeName := builder newClassNamed: #QualifiedTypeName comment: self commentForJavaQualifiedTypeName.

	"The type"
	javaTypeExpression := builder newClassNamed: #TypeExpression comment: 'I represent a type'.
	javaArrayTypeExpression := builder newClassNamed: #ArrayTypeExpression comment: 'I represent an array type'.
	javaClassTypeExpression := builder newClassNamed: #ClassTypeExpression comment: 'I represent a class type'.
	javaPrimitiveTypeExpression := builder newClassNamed: #PrimitiveTypeExpression comment: 'I represent a primitive type'.
	javaTypeParameter := builder newClassNamed: #TypeParameterExpression comment: 'I represent JavaTypeParameter such as `void <T extends Hello> T myMethod()`'.
	
	javaBooleanTypeExpression := builder newClassNamed: #BooleanTypeExpression comment: 'I represent a boolean type'.
	javaByteTypeExpression := builder newClassNamed: #ByteTypeExpression comment: 'I represent a byte type'.
	javaCharTypeExpression := builder newClassNamed: #CharTypeExpression comment: 'I represent a char type'.
	javaDoubleTypeExpression := builder newClassNamed: #DoubleTypeExpression comment: 'I represent a double type'.
	javaFloatTypeExpression := builder newClassNamed: #FloatTypeExpression comment: 'I represent a float type'.
	javaIntTypeExpression := builder newClassNamed: #IntTypeExpression comment: 'I represent an int type'.
	javaLongTypeExpression := builder newClassNamed: #LongTypeExpression comment: 'I represent a long type'.
	javaShortTypeExpression := builder newClassNamed: #ShortTypeExpression comment: 'I represent a short type'.
	javaVoidTypeExpression := builder newClassNamed: #VoidTypeExpression comment: 'I represent a short type'.

	javaParameterExpression := builder newClassNamed: #Parameter comment: 'I represent a parameter of a method declaration'.
	
	javaAssertStatement := builder newClassNamed: #AssertStatement comment: self commentForAssertStatement. 
	
	javaAnnotationExpression := builder newClassNamed: #Annotation comment: self commentForJavaAnnotation.
	
	javaVariableExpression := builder newClassNamed: #VariableExpression. 
	
	javaStatementBlock := builder newClassNamed: #StatementBlock.
	
	javaReturnStatement := builder newClassNamed: #ReturnStatement.
	
	javaExpressionStatement := builder newClassNamed: #ExpressionStatement.
	
	javaStatement := builder newClassNamed: #Statement.
	
	javaLabeledStatement := builder newClassNamed: #LabeledStatement.
	
	javaBooleanLiteral := builder newClassNamed: #BooleanLiteral.
	
	fileDeclaration := builder newClassNamed: #FileDeclaration.
	packageDeclaration := builder newClassNamed: #PackageDeclaration.
	importDeclaration := builder newClassNamed: #ImportDeclaration.
	multiImportDeclaration := builder newClassNamed: #MultiImportDeclaration.
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

	javaTryCatch --|> tStatement.
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

	javaParameterExpression --|> tVariableEntity.
	javaAssertStatement --|> tStatement.

	javaModifier --|> tModifier.
	javaModifier --|> tExpression.

	javaAnnotationExpression --|> tExpression.
	javaAnnotationExpression --|> tModifier.

	javaParameterExpression --|> tExpression.

	javaConditionalExpression --|> tReceiver.

	javaStatementBlock --|> tStatementBlock.

	javaReturnStatement --|> tReturnStatement.

	javaExpressionStatement --|> tExpressionStatement.

	javaStatement --|> tStatement.

	packageDeclaration --|> fileDeclaration.
	importDeclaration --|> fileDeclaration.
	multiImportDeclaration --|> importDeclaration.
	qualifiedName --|> tNamedEntity.
	qualifiedName --|> tEntity.
	qualifiedName --|> tAssignable.
	fileDeclaration --|> tEntity.
	
	javaLabeledStatement --|> tStatement

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
		'true if the expression is prefixed (ex. ++i) else false'.

	(javaModifier property: #token type: #String) comment:
		'The modifier value'.

	(javaLabeledStatement property: #label type: #String) comment:
		'The label of the labeled statement'
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
		 'The cases of the switch statements')
	<>-*
		((javaCaseStatement property: #javaCaseStatementSwitchOwner) 
			 comment: 'javaSwitch owner').

	((javaVariableDeclarator property: #expression) comment:
		 'Expression that s being assigned upon declaration to the var')
	<>- ((tExpression property: #javaVariableDeclaratorExpressionOwner) 
			 comment: 'The javaVariableDeclarator owner (if possible)').
	((javaVariableDeclarator property: #variable) comment:
		 'Variable that s being declared')
	<>-
		((javaVariableExpression property: #javaVariableDeclaratorOwner) 
			 comment: 'The javaVariableDeclarator owner (if possible)').

	((javaAssignmentExpression property: #expression) comment:
		 'Expression that s being assigned upon declaration to the var')
	<>-
		((tExpression property: #javaAssignmentExpressionOwner) comment:
			 'The javaAssignmentExpression owner (if possible)').

	((javaCastExpression property: #expression) comment:
		 'The expression to cast')
	<>- ((tExpression property: #javaCastExpressionOwner) comment:
			 'The javaCastExpression owner (if possible)').
	((javaCastExpression property: #type) comment:
		 'The type in witch the expression will be cast')
	<>-
		((javaVariableExpression property: #javaCastExpressionTypeOwner) 
			 comment: 'The javaCastExpression owner (if possible)').

	((javaClassProperty property: #type) comment: 'The owner type')
	<>-
		((javaVariableExpression property: #javaClassPropertyOwner) 
			 comment: 'The javaClassProperty owner (if possible)').

	"Replaced by tWithReceiver"
	"((javaMethodInvocation property: #receiver) comment: 'The expression whitch will execute this invocation')
		<>- ((expression property: #javaMethodInvocationOwner) comment: 'The javaMethodInvocation owner (if possible)')."

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
		 'The throwed element')
	<>- ((tExpression property: #javaThrowStatementOwner) comment:
			 'The javaThrowStatement owner (if possible)').

	((javaLabeledCaseStatement property: #label) comment:
		 'The label of the case statement')
	<>- ((tExpression property: #javaLabeledCaseStatementOwner) comment:
			 'The javaLabeledCaseStatement owner (if possible)').

	((javaForEachStatement property: #body) comment:
		 'The body of the For Each statement')
	<>- ((tStatement property: #javaForEachStatementOwner) comment:
			 'The javaForEachStatement owner (if possible)').
	((javaForEachStatement property: #list) comment:
		 'The list the for each statement iterate on')
	<>- ((tExpression property: #javaForEachStatementOwner) comment:
			 'The javaForEachStatement owner (if possible)').
	((javaForEachStatement property: #fieldname) comment:
		 'The name of the created local variable')
	<>-
		((javaVariableExpression property:
			  #javaForEachStatementFieldNameOwner) comment:
			 'The javaForEachStatement owner (if possible)').
	((javaForEachStatement property: #type) comment:
		 'The name of the type of the created local variable')
	<>-
		((javaVariableExpression property: #javaForEachStatementTypeOwner) 
			 comment: 'The javaForEachStatement owner (if possible)').

	((javaCatchPartStatement property: #body) comment:
		 'The body of the Catch part statement')
	<>- ((tStatement property: #javaCatchPartStatementOwner) comment:
			 'The javaCatchPartStatementOwner owner (if possible)').
	((javaCatchPartStatement property: #parameter) comment:
		 'The parameter of the catch part')
	<>- ((javaVariableExpression property: #javaCatchParameterOwnler) 
			 comment: 'The javaCatchPartParameterOwner owner (if possible)').

	((javaTryCatch property: #try) comment:
		 'I represent the ''try'' part of the TryCatch Statement')
	<>- ((tStatement property: #javaTryCatchOwner) comment:
			 'The javaTryCatch owner (if possible)').
	((javaTryCatch property: #catches) comment:
		 'I contains all the catch statements')
	<>-*
	((javaCatchPartStatement property: #tryOwner) comment:
		 'The try owner').

	((javaIfStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #ifConditionOwner) comment:
			 'I reprensent a condition for my owner').
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

	"replaced by javaNewClassExpression --|> tWithDeclaration "
	"((javaNewClassExpression property: #declarations) comment: 'The methods defined in the class')
		<>-* ((tScopableEntity property: #newClassOwner) comment: 'I may be in a new class (ex. anonymous one)')."

	((javaInitializer property: #statementBlock) comment:
		 'Statements block of the behavioural entity')
	<>- ((tStatementBlock property: #javaInitializerOwner) comment:
			 'Behavioural entity containing the statement block.').

	((javaLabeledStatement property: #statementBlock) comment:
		 'Statements block of the behavioural entity')
	<>- ((tStatementBlock property: #javaLabaledStatementOwner) comment:
			 'Label Statement entity containing the statement block.').

	((javaNewArray property: #initializer) comment:
		 'The initializer of the array')
	<>- ((tExpression property: #javaNewArrayInitialOwner) comment:
			 'I belong to a new array initializations').

	((javaLambdaExpression property: #expression) comment:
		 'Expression to be executed as part of the lambda.')
	<>- ((tEntity property: #javaLambdaExpressionOwner) comment:
			 'The expression owner (if possible)').
	"((javaLambdaExpression property: #expression) comment: 'Statement block to be executed as part of the lambda')
		<>- ((statementBlock property: #javaLambdaExpressionOwner) comment: 'The statementBlock owner (if possible)')."
	"((javaLambdaExpression property: #parameters) comment: 'The parameters of the lambda')
		<>-* ((javaVariableExpression property: #javaLambdaParameterOwner) comment: 'The lambda parameters owner (if possible)')."

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
			 'The type expression that own me').

	((javaQualifiedTypeName property: #namespace) comment:
		 'The namespace of the name')
	<>- ((javaTypeName property: #javaTypeNameQualify) comment:
			 'the name I qualify').

	((javaAssertStatement property: #condition) comment:
		 'The condition of the statement')
	<>- ((tExpression property: #assertConditionOwner) comment:
			 'I reprensent a condition for my owner').
	((javaAssertStatement property: #message) comment:
		 'The error message that is raised in case the condition is false')
	<>- ((javaStringLiteral property: #javaStringAssertStatementOwner) 
			 comment: 'the assert that can raised me').

	((javaClassDeclaration property: #superclass) comment:
		 'My superclass')
	<>-
		((javaTypeExpression property: #javaClassDeclarationSuperclassOwnver) 
			 comment: 'The class that own me').
	((javaClassDeclaration property: #interfaces) comment:
		 'My superclass')
	<>-*
		((javaTypeExpression property: #javaClassDeclarationInterfaceOwnver) 
			 comment: 'The class that own me').

	((javaEnumDeclaration property: #interfaces) comment: 'My superclass')
	<>-*
		((javaTypeExpression property: #javaEnumDeclarationInterfaceOwnver) 
			 comment: 'The class that own me').

	((javaInterfaceDeclaration property: #interfaces) comment:
		 'My super interfaces') <>-* ((javaTypeExpression property:
		  #javaInterfaceDeclarationInterfaceOwnver) comment:
		 'The interface that own me').

	((tWithDeclarations property: #declarations) comment:
		 'The element I declared')
	<>-* ((tDeclaration property: #javaDeclarationOwner) comment:
			 'The element that declared me').

	((tWithModifiers property: #modifiers) comment: 'My modifiers')
	<>-* ((tModifier property: #javaModifierOwner) comment:
			 'The owner of the modifier').

	((javaAnnotationExpression property: #expression) comment:
		 'My expression (because annotation can be complex)')
	<>- ((javaVariableExpression property:
			  #javaVariableExpressionOwnerIsAnnotation) comment:
			 'The annotation that own me').

	((tWithAssignable property: #variable) comment: 'My variable')
	<>- ((tAssignable property: #javaVariableAssignmentOwner) comment:
			 'The owner of the modifier').

	((tWithReceiver property: #receiver) comment: 'My variable')
	<>- ((tReceiver property: #receiverOwner) comment:
			 'The owner of the receiver').

	((fileDeclaration property: #declarationName) comment:
		 'the first part of the qualified name of the declarationName')
	<>- (qualifiedName property: #fileDeclaration).

	((qualifiedName property: #namespace) comment:
		 'The namespace that qualified me')
	<>- ((qualifiedName property: #qualifyNamespaceOwner) comment:
			 'The namespace qualified I qualify')
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
	
	tWithReceiver := builder newTraitNamed: #TWithReceiver comment: 'I can send message to someone'.
	tReceiver := builder newTraitNamed: #TReceiver comment: 'I receive message from someone'.
	
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
	"fastTParameter := self remoteTrait: #TParameter withPrefix: #FAST."
	tWithParameters := self remoteTrait: #TWithParameters withPrefix: #FAST.
	tNamedEntity := self remoteTrait: #TNamedEntity withPrefix: #FAST.
	tReturnStatement := self remoteTrait: #TReturnStatement withPrefix: #FAST.
	tBooleanLiteral := self remoteTrait: #TBooleanLiteral withPrefix: #FAST.
]

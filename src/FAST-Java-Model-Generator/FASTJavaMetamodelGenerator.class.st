"
I contains the generator to create the Java FAST Metamodel


Use this to re generate the metamodel.


FASTJavaMetamodelGenerator new generate.
FASTJavaMetamodelGenerator resetMetamodel.
"
Class {
	#name : #FASTJavaMetamodelGenerator,
	#superclass : #FamixBasicInfrastructureGenerator,
	#instVars : [
		'javaAssignementExpression',
		'javaBreakStatement',
		'javaCaseStatement',
		'javaCharacterLiteral',
		'javaContinueStatement',
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
		'javaSeparator',
		'javaStringLiteral',
		'javaSwitchStatement',
		'javaThis',
		'javaVarDeclStatement',
		'javaVariableDeclarator',
		'javaWhileStatement',
		'javaElsePartStatement',
		'javaThenPartStatement',
		'javaConditionStatement',
		'javaIncrementorsStatement',
		'javaBodyStatement',
		'javaInitializersStatement',
		'javaOperationLeftOperand',
		'javaOperationRightOperand',
		'javaCastExpression',
		'javaClassProperty',
		'javaTryCatch',
		'javaTryPartStatement',
		'javaCatchPartStatement',
		'javaForEachStatement',
		'javaUnaryExpression',
		'javaNewExpression',
		'javaNewClassExpression',
		'javaNewClassMethodStatment',
		'javaNewArray',
		'javaArrayAccess',
		'javaInitializer',
		'javaOuterThis',
		'javaThrowStatement',
		'javaLabeledCaseStatement',
		'javaDefaultCaseStatement',
		'javaEmptyMethodDeclaration',
		'expression',
		'statement',
		'characterLiteral',
		'literal',
		'variableExpression',
		'namedBehaviouralEntity',
		'nullPointerLiteral',
		'stringLiteral',
		'entitySourceAnchor',
		'scopableEntity',
		'variableEntity',
		'statementBlock',
		'expressionStatement',
		'javaConditionalExpression',
		'javaArrayInitializer',
		'javaLambdaExpression',
		'javaMethodReference',
		'javaDoWhileStatement',
		'javaSynchronizedStatement',
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
		'javaTypeName',
		'javaQualifiedTypeName',
		'javaAssertStatement',
		'javaClassDeclaration',
		'tDeclaration',
		'tWithDeclarations',
		'tModifier',
		'tWithModifiers',
		'javaModifier',
		'javaAnnotationExpression',
		'tAssigneable',
		'tWithAssigneable'
	],
	#category : #'FAST-Java-Model-Generator'
}

{ #category : #accessing }
FASTJavaMetamodelGenerator class >> modifyMetamodel: aMetamodel [

	super modifyMetamodel: aMetamodel.
	
	self fixRemoteMetamodelRelationsIn: aMetamodel.
]

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
FASTJavaMetamodelGenerator >> commentForJavaAssignementExpression [
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
FASTJavaMetamodelGenerator >> commentForJavaSeparator [
	self flag: #todo.
	^ 'todo'
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
FASTJavaMetamodelGenerator >> commentForJavaTAssigneable [
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
	javaAssignementExpression := builder newClassNamed: #AssignementExpression comment: self commentForJavaAssignementExpression.
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
	javaSeparator := builder newClassNamed: #Separator comment: self commentForJavaSeparator.
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
			
	"From FAST"
	expression := self remoteEntity: #Expression withPrefix: #FAST. 
	statement := self remoteEntity: #Statement withPrefix: #FAST.
	characterLiteral := self remoteEntity: #CharacterLiteral withPrefix: #FAST.
	literal := self remoteEntity: #Literal withPrefix: #FAST.
	variableExpression := self remoteEntity: #VariableExpression withPrefix: #FAST.
	namedBehaviouralEntity := self remoteEntity: #NamedBehaviouralEntity withPrefix: #FAST.
	nullPointerLiteral := self remoteEntity: #NullPointerLiteral withPrefix: #FAST.
	stringLiteral := self remoteEntity: #StringLiteral withPrefix: #FAST.
	entitySourceAnchor := self remoteEntity: #EntitySourceAnchor withPrefix: #FAST.
	scopableEntity := self remoteEntity: #ScopableEntity withPrefix: #FAST.
	namedEntity := self remoteEntity: #NamedEntity withPrefix: #FAST.
	variableEntity := self remoteEntity: #VariableEntity withPrefix: #FAST.
	statementBlock := self remoteEntity: #StatementBlock withPrefix: #FAST.
	expressionStatement := self remoteEntity: #ExpressionStatement withPrefix: #FAST
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineHierarchy [
	"define class hierarchy"

	super defineHierarchy.
	
	javaAssignementExpression --|> expression.
	javaAssignementExpression --|> tWithAssigneable.
	
	javaFieldAccess --|> expression.
	javaFieldAccess --|> tAssigneable.
	
	javaInfixOperation --|> expression.
	javaBreakStatement --|> statement.
	javaCaseStatement --|> statementBlock.
	javaCharacterLiteral --|> characterLiteral.
	javaContinueStatement --|> statement.
	javaDoWhileStatement --|> statement.
	javaFloatLiteral --|> literal.
	javaForStatement --|> statement.
	javaIdentifier --|> variableExpression.
	javaIfStatement --|> statement.
	javaIntegerLiteral --|> literal.

	javaMethodEntity --|> namedBehaviouralEntity.
	javaMethodEntity --|> #TWithImmediateSource.
	javaMethodEntity --|> tDeclaration.
	javaMethodEntity --|> tWithModifiers.

	javaClassDeclaration --|> statement.
	javaClassDeclaration --|> tDeclaration. 
	javaClassDeclaration --|> tWithDeclarations.
	javaClassDeclaration --|> tWithModifiers.
	javaClassDeclaration --|> #TNamed. 

	javaMethodInvocation --|> expression.
	javaMethodInvocation --|> #TWithArguments.

	javaNullLiteral --|> nullPointerLiteral.
	javaSeparator --|> variableExpression.
	
	javaStringLiteral --|> stringLiteral.
	
	javaSwitchStatement --|> statement.
	javaThis --|> variableExpression.
	
	javaVarDeclStatement --|> statement.
	javaVarDeclStatement --|> tDeclaration.
	
	javaVariableDeclarator --|> entitySourceAnchor.
	javaWhileStatement --|> statement.
	javaMethodInvocation --|> #TNamed.
	javaCastExpression --|> expression.
	
	javaClassProperty --|> variableExpression.
	
	javaTryCatch --|> statement.
	javaForEachStatement --|> statement.
	javaUnaryExpression --|> expression.
	
	javaNewExpression --|> expression.
	javaNewExpression --|> #TWithArguments.
	
	javaNewClassExpression --|> javaNewExpression.
	
	javaNewArray --|> javaNewExpression.
	javaConditionalExpression --|> expression.
	
	javaArrayAccess --|> expression.
	javaArrayAccess --|> tAssigneable.
	
	variableExpression --|> tAssigneable.
	
	javaThrowStatement --|> statement.
	javaLabeledCaseStatement --|> javaCaseStatement.
	javaDefaultCaseStatement --|> javaCaseStatement.
	javaEmptyMethodDeclaration --|> javaMethodEntity.
	javaArrayInitializer --|> expression.

	javaInitializer --|> scopableEntity.
	javaInitializer --|> #TWithImmediateSource.
	javaInitializer --|> tDeclaration.

	javaOuterThis --|> expression.

	javaCatchPartStatement --|> statement.
	
	javaLambdaExpression --|> expression.
	
	javaMethodReference --|> variableExpression.
	javaSynchronizedStatement --|> statement.

	"types name"
	javaTypeName --|> #TNamed.
	javaTypeName --|> expression.
	javaQualifiedTypeName --|> javaTypeName. 

	"types"
	javaTypeExpression --|> variableExpression.
	javaArrayTypeExpression --|> javaTypeExpression.
	javaClassTypeExpression --|> javaTypeExpression.
	javaPrimitiveTypeExpression --|> javaTypeExpression.
	javaBooleanTypeExpression --|> javaPrimitiveTypeExpression.
	javaByteTypeExpression --|> javaPrimitiveTypeExpression.
	javaByteTypeExpression --|> javaPrimitiveTypeExpression.
	javaCharTypeExpression --|> javaPrimitiveTypeExpression.
	javaDoubleTypeExpression --|> javaPrimitiveTypeExpression.
	javaFloatTypeExpression --|> javaPrimitiveTypeExpression.
	javaIntTypeExpression --|> javaPrimitiveTypeExpression.
	javaLongTypeExpression --|> javaPrimitiveTypeExpression.
	javaShortTypeExpression --|> javaPrimitiveTypeExpression.
	javaVoidTypeExpression --|> javaPrimitiveTypeExpression.

	javaParameterExpression --|> variableExpression.
	javaAssertStatement --|> statement.
	
	javaModifier --|> tModifier.
	javaModifier --|> expression.
	
	javaAnnotationExpression --|> expression.
	javaAnnotationExpression --|> tModifier.
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineProperties [
	super defineProperties.
	(javaFieldAccess property: #fieldName type: #String) comment: 'Name of accessed field'.
	(javaInfixOperation property: #operator type: #String) comment: 'operator s symbol'.
	(javaSeparator property: #separator type: #String) comment: 'separator'.
	(javaClassProperty property: #fieldName type: #String) comment: 'Name of accessed field'.
	
	(javaUnaryExpression property: #operator type: #String) comment: 'The operator string to apply to the expression'.
	(javaUnaryExpression property: #isPrefixedUnaryExpression type: #Boolean) comment: 'true if the expression is prefixed (ex. ++i) else false'.
	
	(javaModifier property: #token type: #String) comment: 'The modifier value'
	
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineRelations [
	super defineRelations.
	(((javaArrayInitializer property: #initializers) comment: 'My initializers') <>-* ((expression property: #javaArrayInitializers) comment: 'The owner of the expression')) withoutPrimaryContainer.

	(((javaVarDeclStatement property: #declarators) comment: 'The declarators for the type') <>-* ((javaVariableDeclarator property: #varDeclOwner) comment: 'The owner of the declarator'))
		withoutPrimaryContainer.

	(((javaSwitchStatement property: #cases) comment: 'The cases of the switch statements') <>-* ((javaCaseStatement property: #javaCaseStatementSwitchOwner) comment: 'javaSwitch owner'))
		withoutPrimaryContainer.

	(((javaVariableDeclarator property: #expression) comment: 'Expression that s being assigned upon declaration to the var')
		<>- ((expression property: #javaVariableDeclaratorExpressionOwner) comment: 'The javaVariableDeclarator owner (if possible)')) withoutPrimaryContainer.
	(((javaVariableDeclarator property: #variable) comment: 'Variable that s being declared')
		<>- ((variableExpression property: #javaVariableDeclaratorOwner) comment: 'The javaVariableDeclarator owner (if possible)')) withoutPrimaryContainer.

	(((javaAssignementExpression property: #expression) comment: 'Expression that s being assigned upon declaration to the var')
		<>- ((expression property: #javaAssignementExpressionOwner) comment: 'The javaAssignementExpression owner (if possible)')) withoutPrimaryContainer.

	(((javaCastExpression property: #expression) comment: 'The expression to cast') <>- ((expression property: #javaCastExpressionOwner) comment: 'The javaCastExpression owner (if possible)'))
		withoutPrimaryContainer.
	(((javaCastExpression property: #type) comment: 'The type in witch the expression will be cast')
		<>- ((variableExpression property: #javaCastExpressionTypeOwner) comment: 'The javaCastExpression owner (if possible)')) withoutPrimaryContainer.

	(((javaClassProperty property: #type) comment: 'The owner type') <>- ((variableExpression property: #javaClassPropertyOwner) comment: 'The javaClassProperty owner (if possible)'))
		withoutPrimaryContainer.

	(((javaMethodInvocation property: #receiver) comment: 'The expression whitch will execute this invocation')
		<>- ((expression property: #javaMethodInvocationOwner) comment: 'The javaMethodInvocation owner (if possible)')) withoutPrimaryContainer.

	(((javaUnaryExpression property: #expression) comment: 'The affected expression') <>- ((expression property: #javaUnaryExpressionOwner) comment: 'The javaUnaryExpression owner (if possible)'))
		withoutPrimaryContainer.

	(((javaNewExpression property: #type) comment: 'The type of the array') <>- ((variableExpression property: #javaNewExpressionOwner) comment: 'The javaNewExpression owner (if possible)'))
		withoutPrimaryContainer.
	
	(((javaArrayAccess property: #expression) comment: 'The accessed index') <>- ((expression property: #javaArrayAccessOwner) comment: 'The javaArrayAccess owner (if possible)')) withoutPrimaryContainer.
	(((javaArrayAccess property: #array) comment: 'Name of accessed field') <>- ((expression property: #javaArrayArrayAccessOwner) comment: 'The javaArrayArrayAccess owner (if possible)'))
		withoutPrimaryContainer.

	(((javaOuterThis property: #type) comment: 'The accessed type') <>- ((variableExpression property: #javaOuterThisOwner) comment: 'The javaOuterThis owner (if possible)')) withoutPrimaryContainer.

	(((javaThrowStatement property: #expression) comment: 'The throwed element') <>- ((expression property: #javaThrowStatementOwner) comment: 'The javaThrowStatement owner (if possible)'))
		withoutPrimaryContainer.

	(((javaLabeledCaseStatement property: #label) comment: 'The label of the case statement')
		<>- ((expression property: #javaLabeledCaseStatementOwner) comment: 'The javaLabeledCaseStatement owner (if possible)')) withoutPrimaryContainer.

	(((javaForEachStatement property: #body) comment: 'The body of the For Each statement') <>- ((statement property: #javaForEachStatementOwner) comment: 'The javaForEachStatement owner (if possible)'))
		withoutPrimaryContainer.
	(((javaForEachStatement property: #list) comment: 'The list the for each statement iterate on')
		<>- ((expression property: #javaForEachStatementOwner) comment: 'The javaForEachStatement owner (if possible)')) withoutPrimaryContainer.
	(((javaForEachStatement property: #fieldname) comment: 'The name of the created local variable')
		<>- ((variableExpression property: #javaForEachStatementFieldNameOwner) comment: 'The javaForEachStatement owner (if possible)')) withoutPrimaryContainer.
	(((javaForEachStatement property: #type) comment: 'The name of the type of the created local variable')
		<>- ((variableExpression property: #javaForEachStatementTypeOwner) comment: 'The javaForEachStatement owner (if possible)')) withoutPrimaryContainer.

	(((javaCatchPartStatement property: #body) comment: 'The body of the Catch part statement')
		<>- ((statement property: #javaCatchPartStatementOwner) comment: 'The javaCatchPartStatementOwner owner (if possible)')) withoutPrimaryContainer.
	(((javaCatchPartStatement property: #parameter) comment: 'The parameter of the catch part')
		<>- ((variableExpression property: #javaCatchParameterOwnler) comment: 'The javaCatchPartParameterOwner owner (if possible)')) withoutPrimaryContainer.

	(((javaTryCatch property: #try) comment: 'I represent the ''try'' part of the TryCatch Statement') <>- ((statement property: #javaTryCatchOwner) comment: 'The javaTryCatch owner (if possible)'))
		withoutPrimaryContainer.
	(((javaTryCatch property: #catches) comment: 'I contains all the catch statements') <>-* ((javaCatchPartStatement property: #tryOwner) comment: 'The try owner')) withoutPrimaryContainer.

	(((javaIfStatement property: #condition) comment: 'The condition of the statement') <>- ((expression property: #ifConditionOwner) comment: 'I reprensent a condition for my owner'))
		withoutPrimaryContainer.
	(((javaIfStatement property: #elsePart) comment: 'else part') <>- ((statement property: #ifElsePartOwner) comment: 'The if owner (if possible)')) withoutPrimaryContainer.
	(((javaIfStatement property: #thenPart) comment: 'then part') <>- ((statement property: #ifThenPartOwner) comment: 'The if owner (if possible)')) withoutPrimaryContainer.

	(((javaConditionalExpression property: #condition) comment: 'The condition of the statement') <>- ((expression property: #conditionalConditionOwner) comment: 'I reprensent a condition for my owner'))
		withoutPrimaryContainer.
	(((javaConditionalExpression property: #elsePart) comment: 'else part') <>- ((expression property: #conditionalElsePartOwner) comment: 'The if owner (if possible)')) withoutPrimaryContainer.
	(((javaConditionalExpression property: #thenPart) comment: 'then part') <>- ((expression property: #conditionalThenPartOwner) comment: 'The if owner (if possible)')) withoutPrimaryContainer.

	(((javaInfixOperation property: #leftOperand) comment: 'leftOperand') <>- ((expression property: #infixOperationLeftOperandOwner) comment: 'The left operand (if possible)')) withoutPrimaryContainer.
	(((javaInfixOperation property: #rightOperand) comment: 'rightOperand') <>- ((expression property: #infixOperationRightOperandOwner) comment: 'The right operand (if possible)'))
		withoutPrimaryContainer.

	(((javaForStatement property: #condition) comment: 'The condition of the statement') <>- ((expression property: #forConditionOwner) comment: 'I reprensent a condition for my owner'))
		withoutPrimaryContainer.
	(((javaForStatement property: #incrementor) comment: 'Expression evaluated at the end of each loop') <>- ((statement property: #forIncrementorOwner) comment: 'I am the incrementor of the for'))
		withoutPrimaryContainer.
	(((javaForStatement property: #initializer) comment: 'Expression used at initialization phase of a for loop')
		<>- ((statement property: #forIninitializerOwner) comment: 'I am the initializer of the for')) withoutPrimaryContainer.
	(((javaForStatement property: #body) comment: 'A statement to be evaluated in the loop') <>- ((statement property: #forBodyOwner) comment: 'I am the body of the for')) withoutPrimaryContainer.

	(((javaDoWhileStatement property: #condition) comment: 'The condition of the statement') <>- ((expression property: #doConditionOwner) comment: 'I reprensent a condition for my owner'))
		withoutPrimaryContainer.
	(((javaDoWhileStatement property: #body) comment: 'A statement to be evaluated in the loop') <>- ((statement property: #doBodyOwner) comment: 'I am the body of the do')) withoutPrimaryContainer.

	(((javaWhileStatement property: #condition) comment: 'The condition of the statement') <>- ((expression property: #whileConditionOwner) comment: 'I reprensent a condition for my owner'))
		withoutPrimaryContainer.
	(((javaWhileStatement property: #body) comment: 'A statement to be evaluated in the loop') <>- ((statement property: #whileBodyOwner) comment: 'I am the body of the do')) withoutPrimaryContainer.

	(((javaNewClassExpression property: #declarations) comment: 'The methods defined in the class') <>-* ((scopableEntity property: #newClassOwner) comment: 'I may be in a new class (ex. anonymous one)'))
		withoutPrimaryContainer.

	(((javaInitializer property: #statementBlock) comment: 'Statements block of the behavioural entity')
		<>- ((statementBlock property: #javaInitializerOwner) comment: 'Behavioural entity containing the statement block.')) withoutPrimaryContainer.

	(((javaNewArray property: #initializer) comment: 'The initializer of the array') <>- ((expression property: #javaNewArrayInitialOwner) comment: 'I belong to a new array initializations'))
		withoutPrimaryContainer.

	(((javaLambdaExpression property: #expression) comment: 'Expression to be executed as part of the lambda.')
		<>- ((expression property: #javaLambdaExpressionOwner) comment: 'The expression owner (if possible)')) withoutPrimaryContainer.
	(((javaLambdaExpression property: #expression) comment: 'Statement block to be executed as part of the lambda')
		<>- ((statementBlock property: #javaLambdaExpressionOwner) comment: 'The statementBlock owner (if possible)')) withoutPrimaryContainer.
	(((javaLambdaExpression property: #parameters) comment: 'The parameters of the lambda')
		<>-* ((variableExpression property: #javaLambdaParameterOwner) comment: 'The lambda parameters owner (if possible)')) withoutPrimaryContainer.

	(((javaMethodReference property: #receiver) comment: 'The method of the reference')
		<>- ((variableExpression property: #javaMethodReferenceOwner) comment: 'The owner of the method reference (if possible)')) withoutPrimaryContainer.

	(((javaSynchronizedStatement property: #expression) comment: 'The instance on which the statement block is synchronized')
		<>- ((expression property: #javaSynchronizedStatementOwner) comment: 'The owner of the synchronized block (if possible)')) withoutPrimaryContainer.
	(((javaSynchronizedStatement property: #block) comment: 'The block that is synchronized')
		<>- ((statementBlock property: #javaSynchronizedStatementOwner) comment: 'The owner of the synchronized block (if possible)')) withoutPrimaryContainer.

	(((javaMethodEntity property: #type) comment: 'The type of the method') <>- ((variableExpression property: #javaMethodTypeOwner) comment: 'The variable expression owner (if possible)'))
		withoutPrimaryContainer.

	(((javaParameterExpression property: #type) comment: 'The type of the parameter') <>- ((variableExpression property: #javaParameterTypeOwner) comment: 'The variable expression owner (if possible)'))
		withoutPrimaryContainer.
	(((javaParameterExpression property: #variable) comment: 'parameter variable') <>- ((variableExpression property: #javaParameterVariableOwner) comment: 'The variable expression owner (if possible)'))
		withoutPrimaryContainer.

	(((javaVarDeclStatement property: #type) comment: 'The type of the declared variables')
		<>- ((variableExpression property: #javaVarDeclTypeOwner) comment: 'The variable expression owner (if possible)')) withoutPrimaryContainer.

	(((javaArrayTypeExpression property: #baseType) comment: 'The type of the array') <>- ((javaTypeName property: #javaArrayTypeOwner) comment: 'The variable expression owner (if possible)'))
		withoutPrimaryContainer.

	(((javaArrayTypeExpression property: #baseType) comment: 'The type of the array')
		<>- ((javaPrimitiveTypeExpression property: #javaArrayTypeOwner) comment: 'The variable expression owner (if possible)')) withoutPrimaryContainer.

	(((javaClassTypeExpression property: #typeName) comment: 'The name of the type') <>- ((javaTypeName property: #javaTypeNameTypeExpressionOwner) comment: 'The type expression that own me'))
		withoutPrimaryContainer.

	(((javaQualifiedTypeName property: #namespace) comment: 'The namespace of the name') <>- ((javaTypeName property: #javaTypeNameQualify) comment: 'the name I qualify')) withoutPrimaryContainer.

	(((javaAssertStatement property: #condition) comment: 'The condition of the statement') <>- ((expression property: #assertConditionOwner) comment: 'I reprensent a condition for my owner'))
		withoutPrimaryContainer.
	(((javaAssertStatement property: #message) comment: 'The error message that is raised in case the condition is false')
		<>- ((javaStringLiteral property: #javaStringAssertStatementOwner) comment: 'the assert that can raised me')) withoutPrimaryContainer.

	(((javaClassDeclaration property: #superclass) comment: 'My superclass') <>- ((javaTypeExpression property: #javaClassDeclarationSuperclassOwnver) comment: 'The class that own me'))
		withoutPrimaryContainer.
	(((javaClassDeclaration property: #interfaces) comment: 'My superclass') <>-* ((javaTypeExpression property: #javaClassDeclarationInterfaceOwnver) comment: 'The class that own me'))
		withoutPrimaryContainer.

	(((tWithDeclarations property: #declarations) comment: 'The element I declared') <>-* ((tDeclaration property: #javaDeclarationOwner) comment: 'The element that declared me')) withoutPrimaryContainer.

	(((tWithModifiers property: #modifiers) comment: 'My modifiers') <>-* ((tModifier property: #javaModifierOwner) comment: 'The owner of the modifier')) withoutPrimaryContainer.

	(((javaAnnotationExpression property: #expression) comment: 'My expression (because annotation can be complex)')
		<>- ((variableExpression property: #variableExpressionOwnerIsAnnotation) comment: 'The annotation that own me')) withoutPrimaryContainer.
		
	(((tWithAssigneable property: #variable) comment: 'My modifiers') <>- ((tAssigneable property: #javaVariableAssignementOwner) comment: 'The owner of the modifier')) withoutPrimaryContainer.
]

{ #category : #definition }
FASTJavaMetamodelGenerator >> defineTraits [
	super defineTraits.
	tDeclaration := builder newTraitNamed: #TDeclaration comment: 'I am a declaration in java'.
	tWithDeclarations := builder newTraitNamed: #TWithDeclarations comment: 'I have declarations'.
	
	tModifier := builder newTraitNamed: #TModifier comment: self commentForJavaTModifier. 
	tWithModifiers := builder newTraitNamed: #TWithModifiers comment: 'I have modifiers'.
	
	tAssigneable := builder newTraitNamed: #TAssigneable comment: self commentForJavaTAssigneable. 
	tWithAssigneable := builder newTraitNamed: #TWithAssigneable comment: 'I have an assigneable'.
]

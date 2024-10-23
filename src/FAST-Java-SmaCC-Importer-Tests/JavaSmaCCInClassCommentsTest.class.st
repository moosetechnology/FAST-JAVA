Class {
	#name : 'JavaSmaCCInClassCommentsTest',
	#superclass : 'JavaSmaCCImporterTest',
	#category : 'FAST-Java-SmaCC-Importer-Tests',
	#package : 'FAST-Java-SmaCC-Importer-Tests'
}

{ #category : 'tests' }
JavaSmaCCInClassCommentsTest >> classString [

	^ '
import java.util.Scanner;
public class GameOfLife {
	
	/*A comment for Show()*/
    public static void show(boolean[][] grid){
        String s = "";
        String AaaaaaEeeee = "";
		  /*an Inner comment*/	
        for(boolean[] row : grid){
            for(boolean val : row)
                if(val)
                    s += "*";
                else
                    s += ".";
            s += "\n";
        }
        System.out.println(s);
    }
}'
]

{ #category : 'accessing' }
JavaSmaCCInClassCommentsTest >> javaMethod [
	^ self shouldBeImplemented
]

{ #category : 'running' }
JavaSmaCCInClassCommentsTest >> parseClassString: aString [
	"overriding to add comments to the parser"

	^ JavaSmaCCProgramNodeImporterVisitor new
		  withComments;
		  parseCodeString: aString
]

{ #category : 'tests' }
JavaSmaCCInClassCommentsTest >> setUp [

	fastModel := self parseClassString: self classString.
]

{ #category : 'tests' }
JavaSmaCCInClassCommentsTest >> testComment [

	self
		assert: (fastModel allWithType: FASTJavaComment ) size
		equals: 2.
	self
		assert: (fastModel allWithType: FASTJavaComment) first content
		equals:  '/*A comment for Show()*/'
]

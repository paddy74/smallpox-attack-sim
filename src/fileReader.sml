(******************************************************************************
* 		Author: Patrick Cox
* Date Created: 02 December 2017
* Date Updated: 23 December 2017
* 	   Project: Smallpox Attack Sim
*         File: fileReader.sml
*
*  Description:
*    Functions for reading the group data file and parsing it into a int list
*	  list
******************************************************************************)

(* Load the text file into a list of strings
    Each line is an element 
    return : string list

    As found at https://stackoverflow.com/questions/680916/looping-over-lines-of-a-text-file-in-sml-nj *)
fun loadFile (infile : string) =
	let
		val ins = TextIO.openIn infile
		fun loop ins =
			case TextIO.inputLine ins of
				  SOME line => line :: loop ins
				| NONE      => []
	in
		loop ins before TextIO.closeIn ins
end;

(* Parse a string into a : int list by the delimiter " "
	returns : int list

	As found at https://stackoverflow.com/questions/14750444/how-can-i-parse-string-to-int-int-tuple-in-sml/35730421 *)
fun strToIntList str =
	let
		val str' = String.substring(str, 0, size str-2)
	in
		List.mapPartial Int.fromString (String.tokens (fn c => c = #" ") str')
end;

(* Apply strToIntList on each element of a : string list
	uses strToIntList 
	returns : int list list *)
fun strListToIntListList (stringList : string list) =
	map(fn str => strToIntList str) stringList;

(* THE FOLLOWING IS NOT USED *)
(* Trim last n characters of a string
	returns : string
fun trimString (str : string, n_chars : int) =
	String.substring(str, 0, size str - n_chars);

   Apply trimString on each element of a : string list
	uses trimString()
	returns : string list
fun trimStringList stringList =
	map(fn str => trimString str) stringList; *)
(* THE ABOVE IS NOT USED *)

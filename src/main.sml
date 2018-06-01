(******************************************************************************
* 		Author: Patrick Cox
* Date Created: 02 December 2017
* Date Updated: 01 June 2018
* 	   Project: Smallpox Attack Sim
*         File: main.sml
*
*  Description:
*    Runs the smallpox attack simulation using the file "groups.data"
******************************************************************************)
use "fileReader.sml";
use "infector.sml";


(* Load group data into a : int list list *)
val groupList : string list = loadFile("groups.data");
val groupList : int list list = strListToIntListList(groupList);

(* Run the simulation *)
runSimulation(1000, groupList);

(******************************************************************************
* 		Author: Caroline Kuzio, Patrick Cox
* Date Created: 02 December 2017
* Date Updated: 01 June 2018
* 	   Project: Smallpox Attack Sim
*         File: main.sml
*
*  Description:
*    Runs the smallpox attack simulation using the file "groups.data"
******************************************************************************)
fun rollDice(ri : int) : int =
	let
		val nextInt = Random.randRange(0,100)
		val r = Random.rand(3,8)
	in
		if ((nextInt r < ri) = true) then 1 else 0
end;


fun infect(pid : int, l : int list list) =
	let
		val count : int = length(l) - 1
	in
		while count > 0 do
		(
			if (exists(pid, List.nth(l, count))) then
				List.hd(List.nth(l, count)) := 1
			else();

			count = count - 1
		)
end;


fun set(l, v : int, nr : int) =
	let
		val l1 = List.drop(l, nr)
		val newv = List.take(l, nr-1) @[v]
	in
		newv@l1
end;


fun incv(l, v : int, n : int) =
	let
		val newnum = List.nth(l, n-1) + v
	in
		set(l, newnum, n)
end;


fun Px(persons, pid : int) =
	let
		val p = List.nth(persons, pid)
		val daysinfected = List.nth(p, 2)
	in
		(*person not infected, but is in infected group, roll dice to see if they get infected*)
		if daysinfected = 0 then
			if rollDice(33) = 1
			then set(p, 1, 3)
			else set(p, 0, 3)
			else[]

		(*contagious*)
		if (daysinfected > 13 andalso daysinfected < 28) then
			set(p, 1, 2) else set(p, 0, 2)

		if (List.nth(p, 1) > 0) then
			infect(pid, grps) else []

		if ((daysinfected > 6) andalso (daysinfected < 15))
		then
			(* if p dies, append p to list of dead *)
			(* set 2nd and 3rd value of p to -1 *)
		 	if rollDice(30) = 1 then deadpeeps @ p
			 	set(p, ~1, 2)
			 	set(p, ~1, 3)
		 	else[]
		else[]

		if List.nth(p, 2) > 0 then
			incv(p, 1)
		else[]
end;


fun checkinf(g) =
	let
		val numberofpidsinlist = length(g)
	in
		if List.hd(g) > 0 then
			(* for group number gn in list of groups, if first value in list > 0, someone in group is infected *)
			while numberofpidsinlist > 0 do
			(
				Px ith(g, numberofpidsinlist)
				numberofpidsinlist := numberofpidsinlist - 1
			)
		else []
end;


fun simulate(counter_start : int) =
	let
		val counter = ref counter_start
		val daynumber = 0
		val gn = length(grps)-1
	in
		while !counter > 0 do
		(
		if daynumber = 0 then 1
		else
			app checkinf(grps)
		    (*printdeathroll*)

		counter := !counter - 1
		)
end;

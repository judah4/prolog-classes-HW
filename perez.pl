course(computerscience,cs111).
course(computerscience,cs211).
course(computerscience,cs311).
course(computerscience,cs315).
course(computerscience,cs421).
course(computerscience,cs436).

course(math,math270).
course(math,math242).
course(math,math372).
course(math,math480).

course(physics,phys201).
course(physics,phys301).

enrolled(newton, cs311).
enrolled(newton, cs421).
enrolled(newton, math372).

enrolled(turing, math480).
enrolled(turing, cs421).
enrolled(turing, phys301).

enrolled(galileo, cs436).
enrolled(galileo, cs421).

enrolled(lovelace, phys301).
enrolled(lovelace, math372).

core = [cs311,cs211,cs311,math270,phys201].

elective =[math242,math372].



complete(newton, cs111, a).
complete(newton, cs211, a).


doneReqCore(Name) :- complete(Name, cs111, G),complete(Name, cs211),complete(Name, cs311).

doneReqElective(Name, Count) :- doneReqElective(Name, elective(L), 0, Count).

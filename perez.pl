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

student(newton).
student(galileo).
student(lovelace).
student(turing).


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

core(cs111).
core( cs211).
core(cs311).
core(math270).
core(phys201).


% completed, p for pass, f for fail
complete(newton, cs111, p).
complete(newton, cs211, p).

complete(lovelace, cs111, p).
complete(lovelace, cs211, p).

complete(galileo, cs111, p).
complete(galileo, cs211, p).
complete(galileo, cs311, p).
complete(galileo, math270, p).
complete(galileo, phys201, p).
complete(galileo, math242, p).
complete(galileo, cs436, p).

complete(turing, cs111, p).
complete(turing, cs211, p).
complete(turing, cs311, p).
complete(turing, math270, p).
complete(turing, phys201, p).
complete(turing, phys301, p).
complete(turing, math372, p).

% required courses
doneReqCore(Name) :- complete(Name, cs111, p),complete(Name, cs211, p),complete(Name, cs311, p),complete(Name, math270, p),complete(Name, phys201, p).

isCore(Class) :- core(Class).

departElectiveDone(Name,Depart,Class) :- course(Depart, Class), \+ isCore(Class), complete(Name, Class, p).
doneElectives(Name, Class1, Class2, Class3):- departElectiveDone(Name, computerscience,Class1), departElectiveDone(Name, math,Class2), departElectiveDone(Name, physics,Class3).

doneReqElectives(Name):- doneElectives(Name, _,_,_).

doneRequirements(Student) :- student(Student), doneReqCore(Student), doneReqElectives(Student).
done(Student) :- doneRequirements(Student).

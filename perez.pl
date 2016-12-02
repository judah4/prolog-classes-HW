
department(computerscience).
department(math).
department(physics).

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
core(cs211).
core(cs311).
core(math270).
core(phys201).


% completed, p for pass, f for fail
complete(newton, cs111, a).
complete(newton, cs211, a).

complete(lovelace, cs111, b).
complete(lovelace, cs211, b).

complete(galileo, cs111, b).
complete(galileo, cs211, b).
complete(galileo, cs311, b).
complete(galileo, math270, a).
complete(galileo, phys201, b).
complete(galileo, math242, a).
complete(galileo, cs436, a).

complete(turing, cs111, a).
complete(turing, cs211, b).
complete(turing, cs311, a).
complete(turing, math270, a).
complete(turing, phys201, a).
complete(turing, phys301, a).
complete(turing, math372, a).

passed(Name, Class) :- complete(Name, Class, Grade), (Grade=a; Grade=b; Grade=c).

% required courses
doneReqCore(Name) :- passed(Name, cs111),passed(Name, cs211),passed(Name, cs311),passed(Name, math270),passed(Name, phys201).

isCore(Class) :- core(Class).

departElectiveDone(Name,Depart,Class) :- course(Depart, Class), \+ isCore(Class), passed(Name, Class).
% What are the elective requirements fulfilled by a student?
electivesDone(Name,Class) :- department(Depart), course(Depart, Class), \+ isCore(Class), passed(Name, Class).

doneElectives(Name):- departElectiveDone(Name, computerscience,_), departElectiveDone(Name, math,_), departElectiveDone(Name, physics,_).
doneReqElectives(Name):- doneElectives(Name).

% Which students have satisfied the requirements?
doneRequirements(Student) :- student(Student), doneReqCore(Student), doneReqElectives(Student).
done(Student) :- doneRequirements(Student).

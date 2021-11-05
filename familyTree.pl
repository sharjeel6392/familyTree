male(george).
male(spencer).
male(philip).
male(charles).
male(mark).
male(andrew).
male(edward).
male(william).
male(harry).
male(peter).
male(james).

female(mum).
female(kydd).
female(elizabeth).
female(margaret).
female(diana).
female(anne).
female(sarah).
female(sophie).
female(zara).
female(beatrice).
female(eugeine).
female(louise).

spouse(diana, charles).
spouse(anne, mark).
spouse(andrew, sarah).
spouse(edward, sophie).
spouse(spencer, kydd).
spouse(elizabeth, philip).
spouse(george, mum).

child(margaret, george).
child(elizabeth, george).
child(charles, philip).
child(anne, philip).
child(andrew, philip).
child(edward, philip).
child(diana, spencer).
child(william,charles).
child(harry, charles).
child(peter, mark).
child(zara, mark).
child(beatrice, andrew).
child(eugeine, andrew).
child(louise, edward).
child(james, edward).

child(margaret, mum).
child(elizabeth, mum).
child(charles, elizabeth).
child(anne, elizabeth).
child(andrew, elizabeth).
child(edward, elizabeth).
child(diana, kydd).
child(william,diana).
child(harry, diana).
child(peter, anne).
child(zara, anne).
child(beatrice, sarah).
child(eugeine, sarah).
child(louise, sophie).
child(james, sophie).

siblings(william, harry).
siblings(harry,william).

siblings(peter, zara).
siblings(zara, peter).

siblings(beatrice, eugeine).
siblings(eugeine, beatrice).

siblings(louise, james).
siblings(james, louise).

siblings(charles, anne).
siblings(anne, charles).

siblings(charles,andrew).
siblings(andrew,charles).

siblings(charles, edward).
siblings(edward, charles).

siblings(anne, andrew).
siblings(andrew, anne).

siblings(anne, edward).
siblings(edward, anne).

siblings(andrew, edward).
siblings(edward, andrew).

siblings(elizabeth, margaret).
siblings(margaret, elizabeth).

grandchild(GRANDCHILD,GRANDPARENT):-
	child(GRANDCHILD,PARENT),
	child(PARENT,GRANDPARENT).

greatGrandParent(GREATGRANDCHILD,GREATGRANDPARENT):-
	child(GREATGRANDCHILD,GRANDCHILD),
	child(GRANDCHILD,CHILD),
	child(CHILD,GREATGRANDPARENT).

ancestor(ANCESTOR,PERSON):-
	child(PERSON,ANCESTOR);
	child(PERSON,PARENT),
	ancestor(ANCESTOR,PARENT).

brother(PERSON1,PERSON2):-
	male(PERSON2),
	siblings(PERSON1,PERSON2).

sister(PERSON1,PERSON2):-
	female(PERSON1),
	siblings(PERSON1,PERSON2).

daughter(DAUGHTER,PARENT):-
	female(DAUGHTER),
	child(DAUGHTER,PARENT).

son(SON,PARENT):-
	male(SON),
	child(SON,PARENT).

firstCousin(COUSIN,PERSON):-
	child(COUSIN,PARENT1),
	child(PERSON,PARENT2),
	siblings(PARENT1,PARENT2).

brotherInLaw(PERSON,BROTHERINLAW):-
	spouse(PERSON,SPOUSE),
	brother(SPOUSE, BROTHERINLAW).

sisterInLaw(PERSON, SISTERINLAW):-
	spouse(PERSON,SPOUSE),
	sister(SISTERINLAW,SPOUSE).

auntHelper(AUNT,PARENT):-
	sister(AUNT,PARENT);
	sisterInLaw(AUNT,PARENT).

aunt(AUNT,CHILD):-
	child(CHILD,PARENT),
	auntHelper(AUNT,PARENT).

uncleHelper(UNCLE, PARENT):-
	brother(UNCLE, PARENT);
	brotherInLaw(UNCLE, PARENT).

uncle(UNCLE,CHILD):-
	child(CHILD,PARENT),
	uncleHelper(UNCLE, PARENT).

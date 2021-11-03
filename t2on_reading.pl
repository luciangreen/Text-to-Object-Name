:- include('../listprologinterpreter/la_maths.pl').

t2on(N1,Filex1,Stringx1,M1) :-
	t2on2(N1,Filex1,Stringx1,M1,0).
t2on2(N1,Filex1,Stringx1,M1,Words_to_read) :-
	retractall(complete_display(_)),
	assertz(complete_display(false)),

	retractall(words_to_read(_)),
	assertz(words_to_read(Words_to_read)),
	
	((number(N1),N=N1)->true;
	(N1=u,N=1)),

	((Filex1=u,Filex="../Text-to-Object-Name/file.txt")->true;
	Filex=Filex1),

	((number(M1),M=M1)->true;
	M=all), %% If m1 is undefined or all then m=all

	prep(List1,T2ON_Dict03,Filex,Stringx1,M),
	t2on_2(List1,T2ON_Dict03,T2ON_Dict2,N),

	sort(T2ON_Dict2,T2ON_Dict3),

	(T2ON_Dict03=T2ON_Dict3->true;
	(save_file_s("../Lucian-Academy-Data/Text-to-Object-Name/t2on_dict1.txt",T2ON_Dict3))),

open_file_s("../Lucian-Academy-Data/Text-to-Object-Name/t2on_end_text.txt",TET),

 	length(List1,List1_length_a),
 	Dividend_a is ceiling(List1_length_a/250),
 	Dividend_b is Dividend_a*3, % for graciously giving

	findall(_,(member([_,TET_T],TET),t2on(Dividend_b,string,TET_T,u)),_),
 	
 	!.

%% Truncates the list if m is not undefined and m is greater than or equal to the length of string0
truncate(List1,M,String0) :-
	((number(M),length(String0,M),
	append(String0,_,List1))->true;
	String0=List1),!.
	
prep(List,T2ON_Dict03,Filex,Stringx1,M) :-
	open_file_s("../Lucian-Academy-Data/Text-to-Object-Name/t2on_dict1.txt", T2ON_Dict01),
	SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",

	sort(T2ON_Dict01,T2ON_Dict03),
	length(T2ON_Dict03,Length0),write("Number of words in dictionary: "), writeln(Length0),
	
	%sort(T2ON_Dict01t,T2ON_Dict03t),

	%length(T2ON_Dict03t,Length0t),write("Number of unique t2on_easonings in dictionary: "), writeln(Length0t),
	
	((Stringx1=u,
	phrase_from_file_s(string(String00), Filex))->true;
	String00=Stringx1),
	
	split_string(String00,SepandPad,SepandPad,List1),

	truncate(List1,M,List),

	length(List,Length1),write("Number of words to find the object name for in file: "), writeln(Length1),
	sort(List,List3),
%%writeln([list2,List2]),
	%length(List2,Length2),write("Number of unique words in file: "), writeln(Length2),
	
(complete_display(true)->
	((Stringx1=u, %% Use file, not string as input.
	
	%%maplist(downcase_atom, List2, List3),
	%maplist(string_lower, List2, List3),
	
%%writeln([list3,List3]),
	towords3(T2ON_Dict03,[],T2ON_Dict04,[],_ObjectNames,[],_AllUsedNames),
	%towords2(T2ON_Dict03t,[],T2ON_Dict04t),

%%writeln([t2on_Dict04,T2ON_Dict04]),
	subtract(List3,T2ON_Dict04,D1),
%%writeln([list3,t2on_Dict04,d1,List3,T2ON_Dict04,D1]),
%%writeln(["subtract(T2ON_Dict04,List3,D1).",List3,T2ON_Dict04,D1]),	
	length(D1,Length01),Difference is abs(Length01),write("Number of words remaining to define: "), writeln(Difference)


	%subtract(AllUsedNames,T2ON_Dict04t,D2),
	%%delete(D21,'',D2),
	%length(D2,Length01t),Differencet is abs(Length01t),write("Number of undefined object names: "), writeln(Differencet),
	%% writeln([undefinedt2on_easonings,D2]), %% Print undefined t2on_easonings

	%%delete(D31,'',D3),
	%subtract(T2ON_Dict04t,AllUsedNames,D3),
	%length(D3,Length01t2),Differencet2 is abs(Length01t2),write("Number of orphaned t2on_easonings: "), writeln(Differencet2),
	
		%%,writeln([orphanedt2on_easonings,D3]) %% Print orphaned t2on_easonings

	

)->true;(string(Filex),writeln("Number of words, unique words and words remaining to define skipped for speed when finding object names for a string.")));true)

,!.

t2on_2(_,A,A,0) :- !.
t2on_2(List1,T2ON_Dict03,T2ON_Dict2,N1) :-
	t2on(List1,T2ON_Dict03,T2ON_Dict21),
	N2 is N1-1,
	t2on_2(List1,T2ON_Dict21,T2ON_Dict2,N2),!.

towords2([],A,A) :- !.
towords2(T2ON_Dict03,A,B) :-
	T2ON_Dict03=[[Word,_,_,_]|Rest],
	%%atom_string(Atom,Word),
	append(A,[Word],C),
	towords2(Rest,C,B).

towords2a([],A,A) :- !.
towords2a(T2ON_Dict03,A,B) :-
	T2ON_Dict03=[[Word,_]|Rest],
	%%atom_string(Atom,Word),
	append(A,[Word],C),
	towords2a(Rest,C,B).

towords3([],A,A,C,C,D,D) :- !.
towords3(T2ON_Dict03,A,B,D,E,G,H) :-
	T2ON_Dict03=[[Word1,Word2]|Rest],
	(Word2=""->append(G,[Word1],I)->true;
	append(G,[Word2],I)),
	append(A,[Word1],C),
	append(D,[Word2],F),
	towords3(Rest,C,B,F,E,I,H).


t2on([],B,B) :-
	!.
t2on([Word3|Words],T2ON_Dict,T2ON_Dict2) :-
	%downcase_atom(Word, Word2), atom_string(Word2,Word3),
	
	words_to_read(WR1),
	(WR1>0->(writeln(WR1),write(Word),
	t2on2(3),nl,sleep(0.12),
	WR2 is WR1-1,
	retractall(words_to_read(_)),
	assertz(words_to_read(WR2)));
	true),
	
	/**member([Word3,X,Y,Z],T2ON_Dict4) -> %% This feature is a bug because words in t2on_dict2 shouldn't necessarily be the words in t2on_dict1
	%%(append(T2ON_Dict,[[Word3,""]],T2ON_Dict3), T2ON_Dict3t=T2ON_Dict4,
	%%t2on_(Words,T2ON_Dict3,T2ON_Dict2,T2ON_Dict3t,T2ON_Dict5))
	%%;
	%%(**/
	
	%%(member([Word3,X,Y,Z],T2ON_Dict4) -> %% This feature is a bug because words in t2on_dict1 should correspond to those in t2on_dict2
	%%(atom_concat("The t2on_easoning for ", Word3, P1),
	%%atom_concat(P1, " is defined.  Enter object name (without spaces), if different for ", Prompt));
	%Prompt="Enter object name (without spaces), if different for "),
	
	%%writeln([word3,Word3]),
	%trace,
	(member([Word3,String4],T2ON_Dict)-> 
	T2ON_Dict3=T2ON_Dict;
	((repeat,
	write("Enter object name (without spaces), if different for "), writeln(Word3),read_string(user_input, "\n", "\r", _End2, String2),split_string(String2, "", " ", String3),String3=[String4]),
	append(T2ON_Dict,[[Word3,String4]],T2ON_Dict3)
	%t2on(1,u,String4,1)
	)),
	%%*t2on_th(Word3,_T2ON_th),

%(String4=""->String5=Word3;String5=String4),

	%downcase_atom(String5, String52), atom_string(String52,String53),

	
t2on(Words,T2ON_Dict3,T2ON_Dict2).
	%%).
%t2on_th(_,sweetinvincibleandprayedfor).

%% finds unknown words, asks for their t2on_ in form "n of m: word", verify, (can go back x) append and sort, save
t2on_repeating_text(N1):-
		phrase_from_file_s(string(Dict), "../Lucian-Academy-Data/Text-to-Object-Name/t2on_repeating_text.txt"),
		string_codes(Dict_string,Dict),
		term_to_atom(Dict_term,Dict_string),
		Dict_term=[N,String],
		%SepandPad="&#@~%`$?-+*^,()|.:;=_/[]<>{}\n\r\s\t\\\"!'0123456789",
		%split_string(String,SepandPad,SepandPad,List),
		numbers(N1,1,[],N1_list),
		findall(_,(member(_N11,N1_list),
		t2on(N,string,String,u)),_),!.

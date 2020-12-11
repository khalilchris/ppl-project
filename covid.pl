
:- use_module(library(jpl)).
start :-sleep(0.4),	
		write('=================='),nl,
		sleep(0.4),
		write('-------------------'),nl,
		sleep(0.2),
		write("COVID-19 Testing"),nl,
		sleep(0.4),
		write('-------------------'),nl,
		sleep(0.4),
		write('=================='),nl,nl,nl,
		

		
		interface0.
		
 
 
    symptom(high_fever) :- verify(" Do you have a fever (y/n) ?").

    symptom(dry_cough) :- verify(" Do you have a dry cough (y/n) ?").

    symptom(tiredness) :- verify(" Do you feel tired (y/n) ?").

    symptom(aches_pains) :- verify("Do you have aches and pains (y/n) ?").
   
    symptom(sore_throat) :- verify(" Do you have sore throat (y/n) ?").
  
    symptom(diarrhoea) :- verify(" Do you have diarrhoea (y/n) ?").

    symptom(conjunctivitis) :- verify(" Do you have conjunctivitis (y/n) ?").

    symptom(headache) :- verify(" Do you have headache (y/n) ?").

    symptom(taste_smell_loss) :- verify(" Do you have loss of taste or smell (y/n) ?").
 
    symptom(shortness_of_breath) :- verify(" Do you have difficulty breathing or shortness of breath (y/n) ?").

    symptom(chest_pain) :- verify(" Do you have chest pain or pressure (y/n) ?").

    symptom(speech_movement_loss) :- verify(" Do you have loss of speech or movement (y/n) ?").
		
ask(Question) :-
	write(Question),
	interface(' ','patient',Question),
	write('Loading.'),nl,
	sleep(1),
	nl.
	
:- dynamic yes/1,no/1.		
	
verify(S) :-
   (yes(S) 
    ->
    true ;
    (no(S)
     ->
     fail ;
     ask(S))).
	 
undo :- retract(yes(_)),fail. 
undo :- retract(no(_)),fail.
undo.

pt4:- (symptom(speech_movement_loss) -> interface3('patient  probably have ','severe','covid 19.')
       ; interface3(', patient  probably have ','moderate ','covid 19.')
       ).

pt3:-((symptom(taste_smell_loss),symptom(shortness_of_breath),symptom(chest_pain)) -> interface3('patient probably have ','severe ','covid 19. please contact your health provider')
       ; pt4).

pt2:- (symptom(headache)-> pt3;interface3('patient  probably have ','moderate risk ','covid 19. please go to 14 days self quarantine')
       ).

pt1:- (symptom(aches_pains)
       ->pt2;interface3('patient  probably have ','low risk ','covid 19.')
       ).

pt:- ((symptom(high_fever),symptom(dry_cough),symptom(tiredness))
      -> pt1;
		interface3('patient  probably have ','high risk ','covid 19. please contact your health provider')).
        
end :-
		nl,nl,nl,
		sleep(0.7),
		write('*****************************************************************'),nl,
		sleep(0.4),
		write("||| THANK YOU FOR YOUR TIME |||"),nl,
		sleep(0.4),
		write('*****************************************************************'),nl.

interface(X,Y,Z) :-
	atom_concat(Y,X, FAtom),
	atom_concat(FAtom,Z,FinalAtom),
	jpl_new('javax.swing.JFrame', ['Covid 19 diagnosis'], F),
	jpl_new('javax.swing.JLabel',['--- COVID 19 DIAGNOSIS ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showInputDialog, [F,FinalAtom], N),
	jpl_call(F, dispose, [], _), 
	write(N),nl,
	( (N == yes ; N == y)
      ->
       assert(yes(Z)) ;
       assert(no(Z)), fail).
	   		



interface0 :-
	jpl_new('javax.swing.JFrame', ['Prolog program  for diagnosis of covid-19'], F),
	jpl_new('javax.swing.JLabel',['--- HELPER ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,'Welcome to Covid 19 diagnostic program we are going to ask you a few questions click ok to continue.'], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(null)
		->	write('you cancelled'),interface3('you cancelled. ','Thank you ','for your time ','.'),end,fail
		;	write("Hi! dectet : "),write(N),nl,pt
	).





	
	
interface3(W1,D,W2) :-
	atom_concat(W1,D,B),
	atom_concat(B,W2,W3),
	jpl_new('javax.swing.JFrame', ['Expert System'], F),
	jpl_new('javax.swing.JLabel',['--- MEDICAL EXPERT SYSTEM ---'],LBL),
	jpl_new('javax.swing.JPanel',[],Pan),
	jpl_call(Pan,add,[LBL],_),
	jpl_call(F,add,[Pan],_),
	jpl_call(F, setLocation, [400,300], _),
	jpl_call(F, setSize, [400,300], _),
	jpl_call(F, setVisible, [@(true)], _),
	jpl_call(F, toFront, [], _),
	jpl_call('javax.swing.JOptionPane', showMessageDialog, [F,W3], N),
	jpl_call(F, dispose, [], _), 
	/*write(N),nl,*/
	(	N == @(void)
		->	write('')
		;	write("")
	).
	
help :- write("To start the program type 'start.' and press Enter key").
%===============================================================
% Random List of Numbers
%===============================================================
% Produces random number X, within range [0,R).
rv(R,X) :-
    random(W),
    X is floor(W * R).

% Produces list L of N random numbers within range [0,R).
% Recursive case: N > 1
rl(N,R,L) :-
    N > 1,
    N1 is N - 1,
    rl(N1,R,L1),
    rv(R,W),
    L = [W|L1].

% Base case: N is 1
rl(1,R,L) :-
    rv(R,W),
    L = [W].


%===============================================================
% Is Sorted
%===============================================================
% Checks that a list is sorted in ascending order
% Base case: An empty list is sorted
is_sorted([]).

% Base case: A list of one item is sorted
is_sorted([_]).

% Recursive case: List has more than one item
% Compares items at index 0 and index 1.
% If item at index 0 is <= item at index 1 recursively call function
% on list L minus the first item LM1.
% If not, list L is not sorted.
is_sorted(L) :-
    length(L,LL),
    LL > 1,
    nth0(0,L,X),
    nth0(1,L,Y),
    X =< Y,
    L = [_|LM1],
    is_sorted(LM1).


%===============================================================
% Selection Sort
%===============================================================
% Implements selection sort algorithm
% Initial calling function, calls recursive function.
% Takes list of numbers L, calculates last index, and
% calls recursive selection_sort with starting index 0
% and last index LLM1.
selection_sort(L,M) :-
    length(L, LL),
    LLM1 is LL - 1,
    selection_sort(L,0,LLM1,M).


% Recursive case: Start index not equal to last index
selection_sort(L,S,E,M) :-
    S < E,
    min_index(L,S,MI),
    swap(L,S,MI,L1),
    SP1 is S + 1,
    selection_sort(L1,SP1,E,M).


% Base case: Start index equal to End index
selection_sort(L,E,E,L).


% Initial calling function, calls recursive min_index
% Takes list of values L, calculates length of list LL
% and next index SP1, and calls recursive min_index with
% that information to determine minimum index.
min_index(L,S,MI) :-
    length(L,LL),
    SP1 is S + 1,
    min_index(L,S,SP1,LL,MI).


% Recursive case: Current index not equal to last index
% and current minimum value <= current value.
min_index(L,CM,C,E,MI) :-
    C < E,
    nth0(CM,L,CMV),
    nth0(C,L,CV),
    CMV =< CV,
    CP1 is C + 1,
    min_index(L,CM,CP1,E,MI).


% Recursive case: Current index not equal to last index
% and current value < current minimum value 
% therefore swap current minumum index.
min_index(L,CM,C,E,MI) :-
    C < E,
    nth0(CM,L,CMV),
    nth0(C,L,CV),
    CV < CMV,
    CP1 is C + 1,
    min_index(L,C,CP1,E,MI).


% Base case: Current index == last index.
min_index(_,CM,E,E,CM).


% Takes list of numbers L, and swaps elements at indeces A and B.
% Returns list M with swapped elements.
swap(L,A,B,M) :-
    nth0(A,L,AV),
    nth0(B,L,BV),
    nth0(A,L,_,T1),
    nth0(A,T2,BV,T1),
    nth0(B,T2,_,T3),
    nth0(B,M,AV,T3).


%===============================================================
% Merge Sort
%===============================================================
% Implements merge sort algorithm
% Base case: A list with only one element is sorted.
merge_sort([X],[X]).

% Base case: An empty list is sorted.
merge_sort([],[]).

% Recursive case: List has more than one element.
% Splits list in half and recursively calls itself until base cases
% are reached. Then merges sorted lists.
merge_sort(L,M) :-
    split(L,L1,L2),
    merge_sort(L1,L1S),
    merge_sort(L2,L2S),
    merge(L1S,L2S,M).

% Splits list L in half by defining the length of list L1 to be
% half of the length of list L. If L has an odd number of elements
% the length of L1 is one less than the length of L2.
split(L,L1,L2) :-
    append(L1,L2,L),
    length(L,LL),
    LLH is LL // 2,
    length(L1,LLH).

split([L],[L],[]).

split([L],[],[L]).

% Recursively calls merge on lists L1 and L2 when both lists have at
% least one element and the head of L1 is less than the head of L2.
merge(L1,L2,M) :-
    L1 = [L1H|L1T],
    L2 = [L2H|_],
    L1H < L2H,
    merge(L1T,L2,T),
    M = [L1H|T].

% Recursively calls merge on lists L1 and L2 when both lists have at
% least one element and head of L2 is less than or equal to head of L1.
merge(L1,L2,M) :-
    L1 = [L1H|_],
    L2 = [L2H|L2T],
    L1H >= L2H,
    merge(L1,L2T,T),
    M = [L2H|T].

% Base case: List 2 is empty.
merge(L1,[],L1).

% Base case: List 1 is empty.
merge([],L2,L2).

% Base case: Both List 1 and 2 are empty.
merge([],[],[]).

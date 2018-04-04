: is-even 2 % not ;
: is-simple 
	dup 0 < if
		drop 0
	else 
		dup 4 < if 
			drop 1
			else
			0 swap 
			dup 2 / 2 do
				dup r@ %
				if else swap 1 + swap 
				then 
			loop
			drop
			0 = if 1 else 0
			then 
	then ;

: allot
        0 swap 
	dup 2 /  1 do
                dup r@ %
                if else swap 1 + swap            
                then 
        loop
swap
1 - 
swap drop
if 
	0  
	else 1
then 
4 allot dup -rot ! ;
: concat 
	dup
	count
	rot
	dup
	count
	rot
	over + 1 + heap-alloc
	rot
	swap
	dup
	rot
	string-copy
	dup
	rot + rot
	string-copy ;
: var-2	
	dup 0 = if
			drop 0
		else
			1 swap dup 2 / 1 + 2 do	
			dup r@ % if else
					r@ is-simple if
					swap r@ * swap
					else then
				then
			loop drop
	then ; 

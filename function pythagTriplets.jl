#───────────────────────────────────────────────────────────────────────────────
# Timothy Gaede
# last updated 2022-09-20
function pythagTriplets(perimeter_max;   sorted = true)

    triplets_pr = pythagTripletsPrimitive(perimeter_max)

    res = []
    for triplet_pr in triplets_pr
        multi_max = perimeter_max ÷ sum(triplet_pr)
        for multi = 1 : multi_max
            push!(res, multi*triplet_pr)
        end
    end

    sorted ?  sort(res)  :  res
end
#───────────────────────────────────────────────────────────────────────────────


#───────────────────────────────────────────────────────────────────────────────
function pythagTripletsPrimitivePerimLIM(perimLIM)

    res = Vector{Int}[]

    m = 2
	
    a,b,c = 0,0,0   
    ∑lim = 6perimLIM
	
    while a+b+c ≤ ∑lim
		
	m² = m*m

	m % 2 == 0 ?  (ñ = 1 : 2 : (m-1))  :  (ñ = 2 : 2 : (m-1))
        for n in ñ			
	    n² = n*n
						
            a = m²-n²
            b = 2m*n
           
	    c = m²+n²
            if a+b+c ≤ perimLIM  &&  gcd(a,b) == 1 
                a < b ?  push!(res, [a,b,c])  :  push!(res, [b,a,c])				 
            end
        end
		 
		

        m+=1
    end

 
    res
end
#───────────────────────────────────────────────────────────────────────────────


#═══════════════════════════════════════════════════════════════════════════════
function main()
    println("\n", "─"^40, "\n")

    PERIM_MAX = 200
    triplets = sort(pythagTriplets(200))
    println("There are ", length(triplets), " Pythagorean triplets with a\n",
            "perimeter limit of ", PERIM_MAX, ":\n")
    for triplet in triplets
        println(triplet)
    end

    triplets_pr = sort(pythagTripletsPrimitive(200))
    println("\n"^6, "There are ", length(triplets_pr), " primitives:\n")
    for triplet_pr in triplets_pr
        println(triplet_pr)
    end

    println("\nDone")
end
#═══════════════════════════════════════════════════════════════════════════════
main()

#───────────────────────────────────────────────────────────────────────────────
# Timothy Gaede
# last updated 2019-08-23
function pythagTriplets(perimeter_max)

    triplets_pr = pythagTripletsPrimitive(perimeter_max)

    triplets = []
    for triplet_pr in triplets_pr
        multi_max = perimeter_max ÷ sum(triplet_pr)
        for multi = 1 : multi_max
            push!(triplets, multi*triplet_pr)
        end
    end

    triplets
end
#───────────────────────────────────────────────────────────────────────────────


#───────────────────────────────────────────────────────────────────────────────
function pythagTripletsPrimitive(perimeter_max)

    triplets = []
    a = 0;    b = 0;    c = 0

    m = 2
    while a+b+c <= 6perimeter_max

        for n = 1 : m-1

            a = m*m - n*n
            b = 2m*n
            c = m*m + n*n

            if a+b+c ≤ perimeter_max  &&  gcd(a,b,c) == 1
                if a > b;    a, b  =  b, a; end
                push!(triplets, [a, b, c])
            end
        end

        m += 1
    end


    triplets
end
#───────────────────────────────────────────────────────────────────────────────


#═══════════════════════════════════════════════════════════════════════════════
function main()
    println("\n", "─"^50, "\n")

    PERIM_MAX = 200

    println("Pythagorean triplets with a perimeter limit of ", PERIM_MAX, ":\n")
    triplets = sort(pythagTriplets(200))
    for triplet in triplets
        println(triplet)
    end

    println("\n"^3, "The primitives:\n")
    triplets_pr = sort(pythagTripletsPrimitive(200))

    for triplet_pr in triplets_pr
        println(triplet_pr)
    end

    println("\nDone")
end
#═══════════════════════════════════════════════════════════════════════════════
main()
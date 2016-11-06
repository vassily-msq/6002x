
using JuMP

m = Model()

foods = ["wine", "beer", "pizza", "burger", "fries", "cola", "apple", "donut"]

values = [89,90,95,100,90,79,50,10]
calories = [123,154,258,354,365,150,95,195]

length(foods)

@variable(m, x[1:8], Bin)

@constraint(m, sum{x[i] * calories[i], i in 1:8} <= 750 )

@objective(m, Max, sum{x[i]* values[i], i in 1:8})

solve(m)

print(getobjectivevalue(m))

a = getvalue(x)
println("Foods to choose:")
for i in 1:8
    if a[i] == 1.0
        println(foods[i])
    end
end



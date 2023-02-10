using ModelingToolkit
using OrdinaryDiffEq
using DelimitedFiles

@parameters t μ σ γ c₀ c₁ N
@variables S(t) E(t) I(t) β(t)
D = Differential(t)

eqs = [D(S) ~ μ*N - (μ+β*I)*S,
       D(E) ~ β*I*S - (μ+σ)*E,
       D(I) ~ σ*E-(μ+γ)*I,
       β ~ c₀+c₁*(1+cos(2*π*t))]

@named sys = ODESystem(eqs)
simpsys = structural_simplify(sys)

p = Pair{Num, Float32}[N => 5.0e7, μ => 0.02, γ => 73.0, σ => 45.6, c₀ => 1.5e-5, c₁ => 8.5e-6]
I₀ = 1.0f0
u₀ = Pair{Num, Float32}[S => 5.0e7-I₀, E => 0.0, I => I₀]
tmin = 0.0f0
tmax = 30.0f0
tspan = (tmin, tmax)
δt = 0.1

prob = ODEProblem(simpsys, u₀, tspan, p; jac=true)
sol = solve(prob, RK4())

times = collect(tmin:δt:tmax)
out = [times' ; Array(sol(times))]'

outfile = "sirforced.dat"
open(outfile, "w") do io
    writedlm(io, out, " ")
end
##################### BEST RESPONSE VS. FULL INFO ##################
####################################################################
#################### BENCHMARK CASE ################################
####################################################################
using Plots

function f(x, g, d, s, c, ϕ, α)
    if x >= c/ϕ
        return (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ - (α/2))*x + (g/d)*x^2
    else
        return NaN
    end
end

function h(x, g, d, s, α)
    if x <= c/ϕ
        return (1/d)*(1 - s) - (1/d)*(1 + g - d - (α/2))*x + (g/d)*x^2
    else
        return NaN
    end
end

d = 0.25 
g = 0.5
s = 0.3
c = 0.2
ϕ = 0.4
α = 0.0

X = 0:0.01:1

#plot for i:
pyplot()
fig = plot(yguidefontrotation=-90, xlabel="Pi", ylabel="Pj", 
xlims=(0,1), ylims=(0, 1), 
title="Best response of individual", 
aspect_ratio=:equal)

plot!(X, f.(X, g, d, s, c, ϕ, α), fill=(0, :purple), alpha=0.3, 
label="crop with pesticide uses")

plot!(X, h.(X, g, d, s, α), fill=(0, :green), alpha=0.3, 
label="crop without pesticide use")

hline!([c/ϕ], linestyle=:dash, linecolor=:black, label="")
vline!([c/ϕ], linestyle=:dash, linecolor=:black, label="")

plot!(legend=:outerbottom)


## END benchmark case of full ecological info ##############
############################################################

############################################################
####### SENSITIVE ANALYSIS: #################################
############################################################

using Plots

function f(x, g, d, s, c, ϕ, α)
    if x >= c/ϕ
        return (1/d)*(1 - s - c) - (1/d)*(1 + g - d - ϕ - (α/2))*x + (g/d)*x^2
    else
        return NaN
    end
end

function h(x, g, d, s, α)
    if x <= c/ϕ
        return (1/d)*(1 - s) - (1/d)*(1 + g - d - (α/2))*x + (g/d)*x^2
    else
        return NaN
    end
end

d = 0.1
g = 0.7
s = 0.3
c = 0.2
ϕ = 0.3
α = 0.25 

X = 0:0.01:1

pyplot()
fig = plot(yguidefontrotation=-90, xlabel="Pi", ylabel="Pj", 
xlims=(0,1), ylims=(0, 1), 
title="Best response of individual", 
aspect_ratio=:equal)

plot!(X, f.(X, g, d, s, c, ϕ, α), fill=(0, :purple), alpha=0.3, 
label="")
## label = crop with pesticide uses

plot!(X, h.(X, g, d, s, α), fill=(0, :green), alpha=0.3, 
label="")
## label = crop without pesticide use

hline!([c/ϕ], linestyle=:dash, linecolor=:black, label="")
vline!([c/ϕ], linestyle=:dash, linecolor=:black, label="")

plot!(legend=:bottom)

###########################################
## END OF SENSITIVE ANALYSIS ##############
############################################################

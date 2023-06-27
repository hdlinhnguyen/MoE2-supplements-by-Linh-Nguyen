##################### BEST RESPONSE VS. FULL INFO ##################
####################################################################
##### ∃ α, ϕ, c #### BENCHMARK CASE ################################
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

d = 0.25 #keep it instead of full-filled
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
### legend position for case 1:
plot!(legend=:outerbottom)

#for 45 degree line:
x_line = collect(range(0, 1, length=100))
y_line = x_line
plot!(x_line, y_line, linestyle=:solid, linecolor=:blue, label="")

# save
savefig(fig,"fullinfo.png")

## END benchmark case of full ecological info ##############
############################################################

############################################################
####### SENSITIVE ANALYSIS: #################################
############################################################

using Plots

function f(x, g, d, π, c, ϕ, α)
    if x >= c/ϕ
        return (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*x + (g/d)*x^2
    else
        return NaN
    end
end

function h(x, g, d, π, α)
    if x <= c/ϕ
        return (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*x + (g/d)*x^2
    else
        return NaN
    end
end

d = 0.1
g = 0.7
π = 0.3
c = 0.2
ϕ = 0.3
α = 0.25 

X = 0:0.01:1

pyplot()
fig = plot(yguidefontrotation=-90, xlabel="Pi", ylabel="Pj", 
xlims=(0,1), ylims=(0, 1), 
title="Best response of individual", 
aspect_ratio=:equal)

plot!(X, f.(X, g, d, π, c, ϕ, α), fill=(0, :purple), alpha=0.3, 
label="")
## label = crop with pesticide uses

plot!(X, h.(X, g, d, π, α), fill=(0, :green), alpha=0.3, 
label="")
## label = crop without pesticide use

hline!([c/ϕ], linestyle=:dash, linecolor=:black, label="")
vline!([c/ϕ], linestyle=:dash, linecolor=:black, label="")

plot!(legend=:bottom)

#for 45 degree line:
x_line = collect(range(0, 1, length=100))
y_line = x_line
plot!(x_line, y_line, linestyle=:solid, linecolor=:blue, label="")

# save
savefig(fig,"sensitive4.png")

###########################################
## END OF SENSITIVE ANALYSIS ##############
############################################################




### legend position:
plot!(legend=:outerleft)
plot!(legend=:outerbottomleft)
plot!(legend=:bottom)

########################
##### plot for my neighbor j: another test thui khong co gi dau dung post 
########################
Y = 0:0.01:1

function a(y, g, d, π, c, ϕ, α)
    if y >= c/ϕ
        return (1/d)*(1 - π - c) - (1/d)*(1 + g - d - ϕ - (α/2))*y + (g/d)*y^2
    else
        return NaN
    end
end

function b(y, g, d, π, α)
    if y <= c/ϕ
        return (1/d)*(1 - π) - (1/d)*(1 + g - d - (α/2))*y + (g/d)*y^2
    else
        return NaN
    end
end
fig = plot(xlabel="Pi", ylabel="Pj", xlims=(0,1), ylims=(0, 1), 
title="Case 2: test j", 
aspect_ratio=:equal)

plot!(Y, a.(Y, g, d, π, c, ϕ, α), fill=(0, :pink), alpha=0.5, 
label="∃ both ϕ, α")

plot!(Y, b.(Y, g, d, π, α), fill=(0, :yellow), alpha=0.5, 
label="∃ only α")
hline!([c/ϕ], linestyle=:dash, label="c/ϕ")

#save fig
savefig(fig,"Case2Main.png") 
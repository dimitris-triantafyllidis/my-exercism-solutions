function transform(input::AbstractDict)

    return Dict( [ ( lowercase(l) => p ) for (p, vl) in pairs(input) for l in vl ] )

end

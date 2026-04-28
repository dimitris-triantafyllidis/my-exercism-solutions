function secret_handshake(code)
    actions = String[]

    code = bitstring(UInt8(code))

    if code[8] == '1' push!(actions, "wink") end
    if code[7] == '1' push!(actions, "double blink") end
    if code[6] == '1' push!(actions, "close your eyes") end
    if code[5] == '1' push!(actions, "jump")  end

    if code[4] == '1' actions = reverse(actions) end

    return actions

end

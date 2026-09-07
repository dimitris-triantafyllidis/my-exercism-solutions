function sortquantity!(qty)
    srtperm = sortperm(qty, rev=true)
    sort!(qty, rev=true)
    return srtperm
end

function sortcustomer(cust, srtperm)
    return cust[srtperm]
end

function production_schedule!(cust, qty)
    srtperm = sortquantity!(qty)
    return (cust[srtperm], invperm(srtperm))
end

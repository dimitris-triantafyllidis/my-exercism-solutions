def square_root(number):

    rmin = 0
    rmax = number
    rmid = number // 2

    while True:
        if rmin * rmin == number:
            return rmin
        elif rmax * rmax == number:
            return rmax
        elif rmid * rmid == number:
            return rmid
        elif rmid * rmid < number:
            rmin = rmid
            rmid = (rmin + rmax) // 2
        else:
            rmax = rmid
            rmid = (rmin + rmax) // 2
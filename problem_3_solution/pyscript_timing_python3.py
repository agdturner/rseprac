# -*- coding: utf-8 -*-
"""
Created on Fri Mar 17 21:45:30 2023

@author: Andy Turner (a.g.d.turner@leeds.ac.uk)
@Licence https://www.apache.org/licenses/LICENSE-2.0
"""
from time import perf_counter

def is_prime(x, primes):
    """
    Check if x is divisible by any other prime in primes.

    Parameters
    ----------
    x : Integer
        The integer to test if it is prime.
    primes : List
        All primes less than x.
        
    Returns
    -------
    None
    """
    for p in primes:
        if x % p == 0:
            return False
    return True

def is_prime2(x, primes):
    """
    Check if x is divisible by any other prime in the first half of primes. Is
    this a robust test or should more primes be tested?

    Parameters
    ----------
    x : Integer
        The integer to test if it is prime.
    primes : List
        All primes less than x.
        
    Returns
    -------
    None
    """
    for i in range(int(len(primes)/2)):
        if x % primes[i] == 0:
            return False
    return True


def get_primes(n):
    """
    Creates and returns a list of prime number less than or equal to n.

    Parameters
    ----------
    n : Integer
        All primes less than or equal to this number are returned in a list.

    Returns
    -------
    primes : List
        All primes less than or equal to n.
    """
    primes = []
    if n >= 2:
        x = 2
        while True:
            #if is_prime(x, primes):
            if is_prime2(x, primes):
                primes.append(x)
            x += 1
            if x > n:
                return primes
    else:
        return primes
                

start = perf_counter()
primes = get_primes(1000)
print(primes)
print(len(primes))
end = perf_counter()
print(end - start)
# project euler #7
# Find the 10001st prime

def find_primes(n)
  # use the Sieve of Eratosthenes method
  # http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes
  # i don't know how big the 10001st prime is, so gonna have to guess.

  # initialize the sieve
  # 1. "create a list of consecutive integers from 2 to n"
  sieve = {}
  for i in 2..n
    sieve[i] = false  # true if 'marked'
  end

  # 2. "initially, let p equal 2, the first prime number"
  p = 2

  while true
    # 3. "starting from p, count up in increments of p and mark each of these numbers 
    # greater than p itself in the list."
    i = 2 * p
    while i <= n
      sieve[i] = true
      i += p
    end

    # 4. "find the number greater than p in the list that is not marked. if there was no such
    # number, stop. otherwise, let p now equal this number (which is the next prime) and repeat
    # from step 3."
    old_p = p
    new_p = nil
    for i in (old_p + 1)..n
      if not sieve[i]
        new_p = i
        break
      end
    end
    if not new_p
      break
    end
    p = new_p
  end

  # everything not marked is prime.
  primes = []
  for i in 2..n
    if not sieve[i]
      primes.push(i)
    end
  end

  primes
end


if __FILE__ == $0
  puts "Running..."
  primes = find_primes(200000)
  puts "Done"
  puts "Num primes found: #{primes.length}"
  puts "10001th prime: #{primes[10000]}"
end

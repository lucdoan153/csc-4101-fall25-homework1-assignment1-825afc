def fib(n)
    if n == 0
        []
    elsif n == 1
        [0]
    else
        fibo = [0, 1]
        (n-2).times do
            fibo << fibo[-1] + fibo[-2]
        end
    fibo
    end
end

def isPalindrome(n)
    s = n.to_s
    s == s.reverse
end

def nthmax(n, a)
    list = a.uniq.sort.reverse
    list[n]
end

def freq(s)
    if s.empty?
        return ""
    end
    count = Hash.new(0)
    s.each_char { |ch| count[ch] += 1 }
    count.max_by { |_, v| v}[0]
end

def zipHash(arr1, arr2)
    if arr1.length == arr2.length
        Hash[arr1.zip(arr2)]
    else
        return nil
    end
end

def hashToArray(hash)
    hash.map { |k, v| [k, v] }
end

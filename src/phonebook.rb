class PhoneBook
    def initialize
        @entries = {}
        @numbers = {}
    end

    def add(name, number, is_listed)
        return false if @entries.key?(name)
        return false unless number =~ /^[1-9]\d{2}-\d{3}-\d{4}$/
        if is_listed && @numbers.key?(number) && @numbers[number].any? { |entry| entry[:listed] }
            return false
        end
        @entries[name] = { number: number, listed: is_listed }
        @numbers[number] ||= []
        @numbers[number] << { name: name, listed: is_listed }
        true
    end

    def lookup(name)
        entry = @entries[name]
        return nil unless entry && entry[:listed]
        entry[:number]
    end

    def lookupByNum(number)
        return nil unless @numbers[number]
        entry = @numbers[number].find { |v| v[:listed] }
        entry ? entry[:name] : nil
    end

    def namesByAc(areacode)
        @entries
        .select { |_, data| data[:number].start_with?(areacode) }
        .map { |name, _| name}
    end
end

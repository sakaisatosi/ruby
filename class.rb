class Foo
    def initialize(a, b)
	@a, @b = a, b
	@v = a + b
    end

    attr_reader :a
    attr_writer :b
    attr_accessor :c
    
    def d() @d end
    def d=(d) @d = d end
end

foo = Foo.new(1,2)
p foo

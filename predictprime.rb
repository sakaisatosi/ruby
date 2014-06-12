require 'mathn.rb'

class PrimePredicater
  def initialize
    @prime = Prime.new
    @cache = []
  end
  
  def prime?(x)
    extend_cache x if @cache.empty? || x > @cache.last
    @cache.include? x
  end
  
private
  def extend_cache(lim)
    @prime.each do |x|
      break if x > lim
      @cache.push x
    end
  end
end

#使用例
ppred = PrimePredicater.new
[1, 10, 2, 5, 7].each do |x|
  p ppred.prime?(x)
end
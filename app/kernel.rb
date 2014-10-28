module Kernel

  def after_ms(n, &block)
    `setTimeout(function() {`
      block.call
    `}, n);`
  end

end


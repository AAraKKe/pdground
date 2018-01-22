# frozen_string_literal: true

# Redefine float with the apropriate options
class Float
  def sigfig(digits)
    f = format("%.#{digits - 1}e", self)
    f = f.to_f
    i = f.to_i
    (i == f ? i : f).to_s
  end

  def hisigfig(digits)
    format("%.#{digits - 1}e", self).split('e')[0].delete('.')
  end
end

class Integer
  def sigfig(digits)
    to_f.sigfig(digits)
  end

  def hisigfig(digits)
    to_f.hisigfig(digits)
  end
end

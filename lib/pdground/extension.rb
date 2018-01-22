# Redefine float with the apropriate options
class Float
  def sigfig(digits)
    f = sprintf("%.#{digits - 1}e", self)
    #puts f
    f = f.to_f
    i = f.to_i
    (i == f ? i : f).to_s
  end

  def hisigfig(digits)
    sprintf("%.#{digits - 1}e", self).split("e")[0].gsub(".","")
  end

end
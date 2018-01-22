# PDGRound module
module PDGRound
  # Main function for the rounding
  def PDGRound.round(args)
    unless args[:meas] && args[:unc]
      raise ArgumentError "To round a value you need a value and an uncertainty (:val and :unc parameters)"
    end
    if (dig = digits(args[:unc]).to_i) <  355
      return round_to(args, 2)
    elsif dig < 950
      return round_to(args, 1)
    else
      sci = ("%.2e" % args[:unc]).split("e")
      exp = sci[1]
      args[:unc] = "10e#{exp}".to_f.to_s
      meas(args[:meas], args[:unc])
      return round_to(args, 2)
    end
  end

  def PDGRound.digits(num)
    res = num.to_f.hisigfig(3)
    res
  end

  def PDGRound.round_to(args, digits)
    # Round to a given number of significant digits
    unc = args[:unc].to_f.sigfig(digits)
    if unc.size < digits
      unc += "."
      (digits+1-unc.size).times {|x| unc += "0"}
    end
    if unc.to_f < 1
      dec = unc.split(".")[1]
      puts "Dec: #{dec}"
      cmp = dec.gsub(/\A0+/,"")
      if cmp.size < digits
        (digits-cmp.size).times {|x| unc += "0"}
      end
    end
    # Rewrite measurement
    val = meas(args[:meas], unc)
    puts "Rounding: #{args[:meas]} +- #{args[:unc]} ---> #{val} +- #{unc}"
    [val, unc]
  end

  def PDGRound.meas(meas, unc)
    if (dec = unc.split(".")[1])
      m = "%.#{dec.size}f" % meas.to_f
    else
      m = meas.to_f.round(unc.gsub(/0+$/,"").size-unc.size)
    end
    m
  end
end
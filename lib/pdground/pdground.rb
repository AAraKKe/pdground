# frozen_string_literal: true

# PDGRound module
module PDGRound
  # Main function for the rounding
  def self.round(args)
    unless args[:meas] && args[:unc]
      raise ArgumentError 'To round a value you need a value and an
                           uncertainty (:val and :unc parameters)'
    end
    args.each { |k, v| args[k] = v.to_s if v.is_a? Numeric }
    dig = digits(args[:unc]).to_i
    return round_to(args, 2) if dig < 355
    return round_to(args, 1) if dig < 950
    round_to_up(args)
  end

  def self.round_to_up(args)
    sci = format('%.2e', args[:unc]).split('e')
    exp = sci[1]
    args[:unc] = "10e#{exp}".to_f.to_s
    # meas(args[:meas], args[:unc])
    round_to(args, 2)
  end

  def self.digits(num)
    res = num.to_f.hisigfig(3)
    res
  end

  def self.round_to(args, digits)
    # Round to a given number of significant digits
    unc = args[:unc].to_f.sigfig(digits)
    unc = prepare(unc, digits)
    # puts "Rounding: #{args[:meas]} +- #{args[:unc]} ---> #{val} +- #{unc}"
    [meas(args[:meas], unc), unc]
  end

  def self.prepare(unc, digits)
    if unc.size < digits
      unc += '.'
      (digits + 1 - unc.size).times { unc.concat '0' }
    end
    if unc.to_f < 1
      cmp = unc.split('.')[1].gsub(/\A0+/, '')
      (digits - cmp.size).times { unc.concat '0' } if cmp.size < digits
    end
    unc
  end

  def self.meas(meas, unc)
    if (dec = unc.split('.')[1])
      meas.to_f.round(dec.size).to_s
    else
      meas.to_f.round(unc.gsub(/0+$/, '').size - unc.size).to_s
    end
  end

  private_class_method :meas, :round_to, :digits, :round_to_up, :prepare
end

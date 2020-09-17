# frozen_string_literal: true

module CreditCardBins::Validator
  def self.data(record)
    (bins(record['bin']) \
    && brands(record['brand']) \
    && types(record['type']) \
    && issuers(record['issuer']) \
    && countries(record['country']['alpha_3']))
  end

  def self.bins(bin = nil)
    return true if CreditCardBin.accepted_bins.empty?

    check(CreditCardBin.accepted_bins, bin)
  end

  def self.brands(brand = nil)
    return true if CreditCardBin.accepted_brands.empty?

    check(CreditCardBin.accepted_brands, brand)
  end

  def self.types(type = nil)
    return true if CreditCardBin.accepted_types.empty?

    check(CreditCardBin.accepted_types, type)
  end

  def self.issuers(issuer = nil)
    return true if CreditCardBin.accepted_issuers.empty?

    check(CreditCardBin.accepted_issuers, issuer)
  end

  def self.countries(countrie = nil)
    return true if CreditCardBin.accepted_countries.empty?

    check(CreditCardBin.accepted_countries, countrie)
  end

  def self.check(array, value)
    return false if value.nil? || value.empty?

    result = false
    array.each do |item|
      if value.include?(item) || item.include?(value)
        result = true
        break
      end
    end

    result
  end
end

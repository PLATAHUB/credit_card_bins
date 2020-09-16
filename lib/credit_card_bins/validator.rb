# frozen_string_literal: true
module CreditCardBins::Validator
  def self.bins(bin = nil)
    return false if bin.nil? || bin.empty?
    return true if CreditCardBin.accepted_bins.empty?
    check(CreditCardBin.accepted_bins, bin)
  end

  def self.brands(brand = nil)
    return false if brand.nil? || brand.empty?
    return true if CreditCardBin.accepted_brands.empty?
    check(CreditCardBin.accepted_brands, brand)
  end

  def self.types(type = nil)
    return false if type.nil? || type.empty?
    return true if CreditCardBin.accepted_types.empty?
    check(CreditCardBin.accepted_types, type)
  end

  def self.issuers(issuer = nil)
    return false if issuer.nil? || issuer.empty?
    return true if CreditCardBin.accepted_issuers.empty?
    check(CreditCardBin.accepted_issuers, issuer)
  end

  def self.countries(countrie = nil)
    return false if countrie.nil? || countrie.empty?
    return true if CreditCardBin.accepted_countries.empty?
    check(CreditCardBin.accepted_countries, countrie)
  end

  def self.check(array, value)
    result = false
    array.each do |item|
      if item.include?(value)
        result = true
        break
      end
    end

    result
  end
end

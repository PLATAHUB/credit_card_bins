require "yaml"
require 'pry'
require "credit_card_bins/version"
require "credit_card_bins/bin"
require "credit_card_bins/info"
require "credit_card_bins/string"
require "errors/not_found"

class CreditCardBin < CreditCardBins::Bin
  def to_s
    self.name
  end
end

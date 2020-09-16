require 'yaml'
require 'pry'
require 'credit_card_bins/version'
require 'credit_card_bins/configure'
require 'credit_card_bins/bin'
require 'credit_card_bins/validator'
require 'credit_card_bins/info'
require 'credit_card_bins/string'
require 'errors/not_found'

class CreditCardBin < CreditCardBins::Bin
  extend CreditCardBins::Configure

  def to_s
    name
  end
end

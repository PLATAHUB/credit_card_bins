# frozen_string_literal: true
module CreditCardBins::Info
  def self.full_data
    read_data
  end

  def self.bins
    bins = []

    read_data do |_key, value|
      bins << value['bin'] if CreditCardBins::Validator.data value
    end

    bins.compact.uniq
  end

  def self.brands
    brands = []

    read_data do |_key, value|
      if CreditCardBins::Validator.data value
        brands << value['brand']
      end
    end

    brands.compact.uniq
  end

  def self.types
    types = []

    read_data do |_key, value|
      if CreditCardBins::Validator.data value
        types << value['type']
      end
    end

    types.compact.uniq
  end

  def self.issuers
    issuers = []

    read_data do |_key, value|
      if CreditCardBins::Validator.data value
        issuers << value['issuer']
      end
    end

    issuers.compact.uniq
  end

  def self.countries
    countries = []

    read_data do |_key, value|
      if CreditCardBins::Validator.data value
        countries << value['country']['alpha_3']
      end
    end

    countries.compact.uniq
  end

  def self.read_data
    yml_files = File.join(File.dirname(__FILE__), '..', 'data', '**', '*.yml')
    full_data = []

    Dir.glob(yml_files) do |filename|
      data = YAML.load_file(filename)
      if block_given?
        data.each do |key, value|
          yield key, value
        end
      else
        full_data << data
      end
    end

    full_data
  end
end
